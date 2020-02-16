## Fastai Workshop
This workshop covers part of [Fastai course v3](https://course.fast.ai/). Since this workshop only covers about an hour 
in a half of material, working through this course will give a deeper understanding of neural networks and deep learning.

## Installation

### Cloud 
- [Fastai](https://course.fast.ai/) has easy cloud options that range from free to inexpensive.

### On System
- [Fastai Installation](https://github.com/fastai/fastai/blob/master/README.md#installation)
- [Conda Install](https://docs.conda.io/en/latest/miniconda.html)
- `conda env create -f environment.yaml`
- `source activate fastai36`

### Docker
- `docker build . -t fastai-interpreter`
- [Nvidia docker-gpu](https://github.com/nvidia/nvidia-docker/wiki/Installation-(version-2.0))

For jupyter
- `docker build -f cuda.Dockerfile -t fastai-interpreter . && docker run -p 8888:8888 -v $(pwd):/home/fastai_user/ --ipc=host --runtime=nvidia fastai-interpreter` 