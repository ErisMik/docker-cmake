FROM debian:latest

RUN mkdir -p /cmakebuild
WORKDIR /cmakebuild

RUN apt-get update -y && apt-get install -y build-essential wget libssl-dev
RUN wget https://github.com/Kitware/CMake/releases/download/v3.17.3/cmake-3.17.3.tar.gz
RUN tar -xzf cmake-3.17.3.tar.gz

WORKDIR /cmakebuild/cmake-3.17.3
RUN ./bootstrap
RUN make -j4
RUN make install

WORKDIR /
RUN rm -rf /cmakebuild
