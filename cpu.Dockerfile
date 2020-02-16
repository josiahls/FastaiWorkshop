FROM ubuntu1804
# See http://bugs.python.org/issue19846
ENV LANG C.UTF-8

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential cmake git curl vim ca-certificates python-qt4 libjpeg-dev \
        zip nano unzip libpng-dev strace python-opengl xvfb && \
        rm -rf /var/lib/apt/lists/*

ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64
ENV PYTHON_VERSION=3.6

RUN curl -o ~/miniconda.sh -O  https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh  && \
     chmod +x ~/miniconda.sh && \
     ~/miniconda.sh -b -p /opt/conda && \
     rm ~/miniconda.sh && \
     /opt/conda/bin/conda install conda-build && \
     apt-get update && apt-get upgrade -y --no-install-recommends

ENV PATH=$PATH:/opt/conda/bin/
ENV USER fastai_user
# Create Enviroment
COPY cpu.environment.yaml /environment.yaml
RUN conda env create -f environment.yaml

# Cleanup
RUN rm -rf /var/lib/apt/lists/* \
    && apt-get -y autoremove

EXPOSE 8888
ENV CONDA_DEFAULT_ENV fastai36
RUN useradd -ms /bin/bash fastai_user
USER fastai_user
WORKDIR /home/fastai_user
ENTRYPOINT ["/opt/conda/envs/fastai36/bin/jupyter", "notebook", "--ip=0.0.0.0", "--no-browser"]
