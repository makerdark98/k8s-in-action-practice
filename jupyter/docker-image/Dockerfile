FROM jupyter/base-notebook:notebook-6.4.11
USER root
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update
RUN apt install -y texlive-xetex git tig
USER 1000
RUN pip install matplotlib numpy
