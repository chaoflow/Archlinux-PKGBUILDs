#!/bin/sh

pkgname=$1
srcdir=$2
pkgdir=$3

docdir=${pkgdir}/usr/share/doc/vimoutliner
install -d ${docdir}/
for x in \
    FAQ.txt \
    INSTALL \
    MANIFEST \
    README.otl \
    changes.txt \
    versions.txt
do
 install -D -m644 ${srcdir}/${x} ${docdir}/
done

bindir=${pkgdir}/usr/bin
install -d ${bindir}/
for x in \
    doc2otl \
    opml2otl \
    otl2html \
    otl2htmlList \
    otl2pod \
    otl2rtf \
    otl2swiki \
    otl2trac \
    otlParser.rb \
    pod2otl
do
 install -m755 ${srcdir}/${x} ${bindir}/
done

sharedir=${pkgdir}/usr/share/vimoutliner
install -d ${sharedir}/
install -m644 ${srcdir}/easy.gvimrc ${sharedir}/easy.gvimrc
install -m644 ${srcdir}/easy.vimrc ${sharedir}/easy.vimrc

bitmapdir=${sharedir}/bitmaps
install -d ${bitmapdir}/
install -m644 ${srcdir}/bitmaps/TVO/* ${bitmapdir}/

macrosdir=${sharedir}/macros
install -d ${macrosdir}/
install -m644 ${srcdir}/macros/* ${macrosdir}/

vimdir=${pkgdir}/usr/share/vim/vimfiles
for x in doc ftdetect ftplugin syntax; do
install -d ${vimdir}/${x}/
install -m644 ${srcdir}/${x}/* ${vimdir}/${x}/
done

licensedir=${pkgdir}/usr/share/licenses/${pkgname}
install -D -m755 ${srcdir}/license.txt ${licensedir}/license.txt
