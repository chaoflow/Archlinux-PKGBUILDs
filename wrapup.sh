#!/bin/sh -x

dir=$1
files=$( git ls-files |grep $dir)

echo $files |xargs tar cfz $1.tar.gz 

