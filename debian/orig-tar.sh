#!/bin/sh -e

VERSION=$2
DIR=jogl-v$VERSION
TAR=libjogl2-java_$VERSION+dfsg.orig.tar.xz

# clean up the upstream tarball
tar xvf $3
cd $DIR*
rm -rf .gitignore .htaccess make/lib/ www/
rm -f src/test/com/jogamp/opengl/test/junit/jogl/demos/es2/shader/landscape.fp
cd ..
tar Jcvf ../$TAR $DIR
rm -rvf $DIR jogl-v$VERSION.tar

# move to directory 'tarballs'
if [ -r .svn/deb-layout ]; then
    . .svn/deb-layout
    mv $TAR $origDir
    echo "moved $TAR to $origDir"
fi

exit 0
