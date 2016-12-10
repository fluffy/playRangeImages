# Set up a docker machine that has all the tools to build opencv programs

FROM ubuntu
MAINTAINER Cullen Jennings <fluffy@iii.ca>

# set up basic build machine
RUN apt-get update -y --fix-missing
RUN apt-get -y update
RUN apt-get -y install tcsh
RUN apt-get install -y build-essential 

RUN apt-get install -y cmake
RUN apt-get install -y git
RUN apt-get install -y libgtk2.0-dev
RUN apt-get install -y pkg-config
RUN apt-get install -y libavcodec-dev
RUN apt-get install -y libavformat-dev
RUN apt-get install -y libswscale-dev
RUN apt-get install -y python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev

WORKDIR /tmp
RUN curl https://codeload.github.com/opencv/opencv/tar.gz/3.1.0 > opencv.tgz
RUN tar xvfz opencv.tgz

RUN mkdir /tmp/opencv-3.1.0/build 
WORKDIR /tmp/opencv-3.1.0/build
RUN cmake  -D CMAKE_BUILD_TYPE=RELEASE  ..
RUN make -j 4
RUN make install 

ENV LD_LIBRARY_PATH /usr/local/lib

VOLUME /data
WORKDIR /data

CMD [ "/usr/bin/make" ]

