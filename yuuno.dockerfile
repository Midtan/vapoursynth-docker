ARG BASE_IMAGE

FROM ${BASE_IMAGE}

ENV JUPYTER_PASSWORD_REQUIRED = True

# Installing pip
RUN yay -Syu --noconfirm --noprogressbar python-pip

# Installing and enabling yuuno
RUN sudo pip3 install jupyterlab
RUN sudo pip3 install yuuno --pre

# Entrypoint
USER root
WORKDIR /home
ENTRYPOINT [ "jupyter", "lab", "--allow-root" ]
