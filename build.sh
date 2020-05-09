#!/bin/bash
set -e

docker build -t vapoursynth-base -f base.dockerfile ./

git clone https://github.com/markus-perl/ffmpeg-build-script.git
cd ffmpeg-build-script
docker build --tag=ffmpeg-static .

cd ../
docker build -t vapoursynth-utility --build-arg BASE_IMAGE=vapoursynth-base -f utility.dockerfile ./
docker build -t vapoursynth-yuuno --build-arg BASE_IMAGE=vapoursynth-utility -f yuuno.dockerfile ./
