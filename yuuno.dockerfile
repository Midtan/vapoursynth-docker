ARG BASE_IMAGE

FROM ${BASE_IMAGE}

ENV JUPYTER_PASSWORD_REQUIRED = True

# Installing pip
RUN yay -Syu --noconfirm --noprogressbar python-pip

# Installing and enabling yuuno
RUN sudo pip3 install yuuno
RUN sudo yuuno jupyter install

# Entrypoint
USER root
WORKDIR /home
#COPY /jupyter/entrypoint.sh /entrypoint.sh
#ENTRYPOINT [ "/bin/bash", "/entrypoint.sh" ]
ENTRYPOINT [ "jupyter", "notebook" ]
