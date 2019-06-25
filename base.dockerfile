FROM archlinux/base

# Add user, group sudo
RUN pacman -Syu --noconfirm --noprogressbar base-devel && \
    groupadd --system sudo && useradd -m --groups sudo user && \
    sed -i -e "s/Defaults    requiretty.*/ #Defaults    requiretty/g" /etc/sudoers && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Installing AUR manager
RUN sudo pacman -Syu --noconfirm --noprogressbar git
USER user
WORKDIR /tmp
RUN git clone https://aur.archlinux.org/yay.git
WORKDIR /tmp/yay
RUN makepkg --noconfirm --noprogressbar -si
RUN yay --afterclean --removemake --save

# Installing vapoursynth
RUN yay -Syu --noconfirm --noprogressbar --removemake vapoursynth-git

# Installing plugins
COPY /vapoursynth/install-plugins.sh /install-plugins.sh
ENTRYPOINT [ "/bin/bash", "/install-plugins.sh" ]
