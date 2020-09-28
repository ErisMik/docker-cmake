FROM debian:latest

RUN mkdir -p /cmakebuild
WORKDIR /cmakebuild

RUN apt-get update -y && apt-get install -y build-essential wget libssl-dev

ARG CMAKE_VERSION=3.18.2
RUN wget https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}.tar.gz
RUN tar -xzf cmake-${CMAKE_VERSION}.tar.gz

WORKDIR /cmakebuild/cmake-${CMAKE_VERSION}
RUN ./bootstrap
RUN make -j4
RUN make install

WORKDIR /
RUN rm -rf /cmakebuild
