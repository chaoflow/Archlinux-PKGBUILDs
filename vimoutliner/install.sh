#!/bin/sh

srcdir=$1
pkgdir=$2

_docdir=${pkgdir}/usr/share/doc/vimoutliner
install -d ${_docdir}/
for x in \
    FAQ.txt \
    INSTALL \
    MANIFEST \
    README.otl \
    changes.txt \
    versions.txt
do
 install -D -m644 ${srcdir}/${x} ${_docdir}/
done

_bindir=${pkgdir}/usr/bin
install -d ${_bindir}/
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
 install -m755 ${srcdir}/${x} ${_bindir}/
done

_sharedir=${pkgdir}/usr/share/vimoutliner
install -d ${_sharedir}/
install -m644 ${srcdir}/easy.gvimrc ${_sharedir}/easy.gvimrc
install -m644 ${srcdir}/easy.vimrc ${_sharedir}/easy.vimrc

_bitmapdir=${_sharedir}/bitmaps
install -d ${_bitmapdir}/
install -m644 ${srcdir}/bitmaps/TVO/* ${_bitmapdir}/

_macrosdir=${_sharedir}/macros
install -d ${_macrosdir}/
install -m644 ${srcdir}/macros/* ${_macrosdir}/

_vimdir=${pkgdir}/usr/share/vim/vimfiles
for x in doc ftdetect ftplugin syntax; do
install -d ${_vimdir}/${x}/
install -m644 ${srcdir}/${x}/* ${_vimdir}/${x}/
done

_licensedir=${pkgdir}/usr/share/licenses/${_pkgname}
install -D -m755 ${srcdir}/license.txt ${_licensedir}/license.txt
