FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
        python3 \
        python3-dev \
        python3-venv \
        python3-pip \
        python3.6 \
        python3.6-dev \
        python3.6-venv \
        build-essential \
        curl \
        libsm6 \
        libxext6 \
        libxrender-dev \
        libglib2.0-0 \
        libfontconfig1 \
        libice6 \
        && rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install --upgrade pip

WORKDIR /workspace
COPY . .

RUN python3 -m venv venv_notebook && \
    ./venv_notebook/bin/pip install --upgrade pip && \
    ./venv_notebook/bin/pip install jupyter notebook && \
    if [ -f requirements.txt ]; then ./venv_notebook/bin/pip install -r requirements.txt; fi

RUN python3.6 -m venv pipeline/Road-Segmentation/venv && \
    ./pipeline/Road-Segmentation/venv/bin/pip install --upgrade pip && \
    if [ -f requirements_py36.txt ]; then ./pipeline/Road-Segmentation/venv/bin/pip install -r requirements_py36.txt; fi

EXPOSE 8888
CMD ["./venv_notebook/bin/jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''"]
