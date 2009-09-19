#!/bin/sh -e

pkgname=$1
srcdir=$2
pkgdir=$3

docdir=${pkgdir}/usr/share/doc/vimoutliner
install -d ${docdir}/
install -m644 \
    ${srcdir}/{FAQ.txt,INSTALL,MANIFEST,README.otl,changes.txt,versions.txt} \
    ${docdir}/

bindir=${pkgdir}/usr/bin
install -d ${bindir}/
install -m755 ${srcdir}/{doc2otl,opml2otl,otl2*,otlParser.rb,pod2otl} \
    ${bindir}/

sharedir=${pkgdir}/usr/share/vimoutliner
install -d ${sharedir}/
install -m644 ${srcdir}/easy.{gvimrc,vimrc} ${sharedir}/

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
install -D -m644 ${srcdir}/license.txt ${licensedir}/license.txt
