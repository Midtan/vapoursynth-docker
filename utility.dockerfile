ARG BASE_IMAGE

#ARG BUILD_DEPENDENCIES="coreutils curl nasm tar bzip2 lcms2 imagemagick tesseract zlib yasm libogg linux-headers"
#ARG RUNTIME_DEPENDENCIES="openssl libtheora libwebp opus libass freetype2 x264 x265 lame libvorbis libvpx libfdk-aac libjpeg-turbo libtiff"

FROM ffmpeg-static AS ffmpeg-docker

FROM ${BASE_IMAGE}

#### ffmpeg
# Installing build dependencies
#RUN yay -Syu --noconfirm --noprogressbar ${BUILD_DEPENDENCIES}

# Installing runtime dependencies
#RUN yay -Syu --noconfirm --noprogressbar ${RUNTIME_DEPENDENCIES}

# Building ffmpeg
#RUN yes '' | yay -Syu --noprogressbar ffmpeg-full
#WORKDIR /tmp
#RUN curl -s http://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2 | tar jxf - -C .
#WORKDIR /tmp/ffmpeg
#RUN ./configure --disable-debug --enable-avresample --enable-fontconfig --enable-gpl --enable-libass --enable-libfdk-aac --enable-libfreetype --enable-libmp3lame --enable-libopus --enable-libtheora --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx264 --enable-libx265 --enable-nonfree --enable-openssl --enable-postproc --enable-shared --enable-small --enable-version3
#RUN make -j 12
#RUN make install
COPY --from=ffmpeg-docker /usr/bin/ffmpeg /usr/bin/ffmpeg
COPY --from=ffmpeg-docker /usr/bin/ffprobe /usr/bin/ffprobe

# Installing x264
RUN yay -Syu --noconfirm --noprogressbar x264
#WORKDIR /tmp
#RUN git clone https://github.com/jpsdr/x264 && \
#    cd x264 && \
#    ./configure --enable-pic --enable-lto && \
#    make -j 8 && \
#    make install

RUN yay --noconfirm --noprogressbar -Syu x265

# Removing build dependencies
#RUN yay -Runs ${BUILD_DEPENDENCIES}
