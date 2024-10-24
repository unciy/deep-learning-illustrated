# Get the details on the base image here: http://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html#jupyter-scipy-notebook
# Ubuntu 18.04 (bionic) from 2018-04-26
# Note: tag [e7000ca1416d] is latest image as of 06/09/2018
# I've specified exact versions here. Users can modify at their own risk to get more recent versions of libraries.
# Note that this base image includes Python 3.6.5 as part of Miniconda 4.5.1

FROM jupyter/scipy-notebook:latest

LABEL maintainer="Jon Krohn <jon@untapt.com>"

USER $NB_USER

# install the libraries
RUN \
        # Upgrade pip first
        pip install --upgrade pip && \
        # install TensorFlow library
        pip install tensorflow==2.17.0 && \
        # install TFlearn, Keras, PyTorch, Torchvision, NLP libraries and RL environment
        pip install tflearn==0.5.0 \
                                keras==3.6.0 \
                                nltk==3.9.1 \
                                gensim==4.3.3 \
                                gym==0.26.2 \
                                torch==2.5.0 \
                                torchvision==0.20.0 \
                                h5py==3.10.0
