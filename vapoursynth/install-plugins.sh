#!/bin/bash
set -e

packages="${VS_PACKAGES} ${VS_PACKAGES_ADDITIONAL}"

if [ "${packages}" != " " ]
then
    yay -Syu --noconfirm --noprogressbar ${packages}
fi

exec vspipe
