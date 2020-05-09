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
RUN git clone https://aur.archlinux.org/yay.git && \ 
    cd yay && \
    makepkg --noconfirm --noprogressbar -si && \
    yay --afterclean --removemake --save

# Installing vapoursynth
RUN yay -Syu --noconfirm --noprogressbar --removemake vapoursynth-git

# Installing plugins
#COPY /vapoursynth/install-plugins.sh /install-plugins.sh
#ENTRYPOINT [ "/bin/bash", "/install-plugins.sh" ]
RUN yay -Syu --noconfirm --noprogressbar \
    vapoursynth-plugin-addgrain-git \
    vapoursynth-plugin-bm3d-git \
    vapoursynth-plugin-combmask-git \
    vapoursynth-plugin-d2vsource-git \
    vapoursynth-plugin-dctfilter-git \
    vapoursynth-plugin-deblock-git \
    vapoursynth-plugin-descale-git \
    vapoursynth-plugin-dfttest-git \
    vapoursynth-plugin-dither-git \
    vapoursynth-plugin-edgefixer-git \
    vapoursynth-plugin-f3kdb-git \
    vapoursynth-plugin-edi_rpow2-git \
    vapoursynth-plugin-fft3dfilter-git \
    vapoursynth-plugin-fmtconv-git \
    vapoursynth-plugin-fvsfunc-git \
    vapoursynth-plugin-havsfunc-git \
    vapoursynth-plugin-kagefunc-git \
    vapoursynth-plugin-knlmeanscl-git \
    vapoursynth-plugin-lsmashsource-git \
    vapoursynth-plugin-lvsfunc-git \
    vapoursynth-plugin-muvsfunc-git \
    vapoursynth-plugin-mvsfunc-git \
    vapoursynth-plugin-mvtools-git \
    vapoursynth-plugin-nnedi3-git \
    vapoursynth-plugin-sangnom-git \
    vapoursynth-plugin-retinex-git \
    vapoursynth-plugin-vsutil-git

