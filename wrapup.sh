#!/bin/sh -x

test -z $1 && exit 1

# get rid of trailing /
dir=$( basename $1 )

git archive --format=tar --prefix=${dir}/ HEAD:${dir}/ | gzip > ${dir}.tar.gz
