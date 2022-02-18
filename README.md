# vapoursynth-docker
Simple docker containers for using [vapoursynth](https://www.vapoursynth.com/) in conjunction with encoders like ffmpeg, x264 and x265.
This container gives you a collection of preselected vapoursynth plugins as well as the ability to write and execute scripts and encodes in [yuuno](https://yuuno.encode.moe/).

## Usage
Run ``build.sh`` to build containers. This will take a while.

You can then access the yuuno container by using the ``vapoursynth-yuuno`` tag.

To access vapoursynth without yuuno, use the tag ``vapoursynth-utility``.

To only access vapoursynth without any encoders, use the tag ``vapoursynth-base``.