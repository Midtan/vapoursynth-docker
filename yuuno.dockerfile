ARG BASE_IMAGE

FROM ${BASE_IMAGE}

ENV JUPYTER_PASSWORD_REQUIRED = True

# Installing and enabling yuuno
RUN pip3 install yuuno
RUN yuuno jupyter install

# Entrypoint
COPY /jupyter/entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/bin/bash", "/entrypoint.sh" ]
