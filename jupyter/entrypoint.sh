#!/bin/bash
set -e

if [ ! -z "$JUPYTER_PASSWORD_REQUIRED" ]
then
  sed -i 's/#?\s?c.NotebookApp.password_required\s*=\s*.*/c.NotebookApp.password_required = ${JUPYTER_PASSWORD_REQUIRED}/g' /root/.jupyter/jupyter_notebook_config.py
fi

exec jupyter notebook
