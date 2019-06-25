ARG BASE_IMAGE

ARG BUILD_DEPENDENCIES="coreutils curl nasm tar bzip2 lcms2 imagemagick tesseract zlib yasm libogg linux-headers"
ARG RUNTIME_DEPENDENCIES="openssl libtheora libwebp opus libass freetype2 x264 x265 lame libvorbis libvpx libfdk-aac libjpeg-turbo libtiff"

FROM ${BASE_IMAGE}

#### ffmpeg
# Installing build dependencies
RUN yay -Syu --noconfirm --noprogressbar ${BUILD_DEPENDENCIES}

# Installing runtime dependencies
RUN yay -Syu --noconfirm --noprogressbar ${RUNTIME_DEPENDENCIES}

# Building ffmpeg
WORKDIR /tmp
RUN curl -s http://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2 | tar jxf - -C .
WORKDIR /tmp/ffmpeg
RUN ./configure --disable-debug --enable-avresample --enable-fontconfig --enable-gpl --enable-libass --enable-libfdk-aac --enable-libfreetype --enable-libmp3lame --enable-libopus --enable-libtheora --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx264 --enable-libx265 --enable-nonfree --enable-openssl --enable-postproc --enable-shared --enable-small --enable-version3
RUN make -j 12
RUN make install

# Removing build dependencies
RUN yay -Runs ${BUILD_DEPENDENCIES}

# Installing encoders
#RUN yes '' | yay -Syu --noprogressbar ffmpeg-full
