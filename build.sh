#!/bin/bash
set -e

docker build -t vapoursynth-base -f base.dockerfile ./
docker build -t vapoursynth-yuuno --build-arg BASE_IMAGE=vapoursynth-base -f yuuno.dockerfile ./
