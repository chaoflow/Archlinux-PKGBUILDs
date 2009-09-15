#!/bin/sh -x

test -z $1 && exit 1

# get rid of trailing /
dir=$( basename $1 )
tarball=${dir}.tar.gz

git archive --format=tar --prefix=${dir}/ HEAD:${dir}/ | gzip > ${tarball}

# sanity check - there needs to be a PKGBUILD otherwise we exit 1
tar tfz ${tarball} |grep -q PKGBUILD || exit 1
