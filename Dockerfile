FROM alpine:3.10

ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk

ENV BAZEL_VERSION 0.26.1
ENV TENSORFLOW_VERSION 1.4.0

RUN apk add --no-cache python3 python3-tkinter py3-numpy py3-numpy-f2py freetype libpng libjpeg-turbo imagemagick graphviz git
RUN apk add --no-cache --virtual=.build-deps \
        bash \
        cmake \
        curl \
        freetype-dev \
        g++ \
        libjpeg-turbo-dev \
        libpng-dev \
        linux-headers \
        make \
        musl-dev \
        openblas-dev \
        openjdk8 \
        patch \
        perl \
        python3-dev \
        py-numpy-dev \
        rsync \
        sed \
        swig \
        zip \
    && : prepare for building TensorFlow \
    && : install wheel python module \
    && cd /tmp \
    && pip3 install --no-cache-dir wheel \
    && : \
    && : add python symlink to avoid python detection error \
    && $(cd /usr/bin && ln -s python3 python) \
   
