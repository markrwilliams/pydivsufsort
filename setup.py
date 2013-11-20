#!/usr/bin/env python
# -*- coding: utf-8 -*-
import subprocess
from os.path import exists

from distutils.core import setup
from distutils.extension import Extension
from distutils.command.build_py import build_py as _build_py

from Cython.Distutils import build_ext


class build_py(_build_py):
    if exists('lib/Makefile'):
        make_clean = subprocess.Popen(['make', 'distclean'], cwd='lib/')
        make_clean.wait()
    configure = subprocess.Popen(['./configure', '--with-pic'],
                                 cwd='lib/')
    configure.wait()
    make = subprocess.Popen(['make', '-j'], cwd='lib/')
    make.wait()

setup(
    cmdclass={'build_py': build_py,
              'build_ext': build_ext},
    name='divsufsort',
    ext_modules=[
        Extension(
            "suffixarray",
            sources=['src/suffix.pyx'],
            libraries=['lib/lib/.libs/libdivsufsort.a'],
            extra_objects=['lib/lib/.libs/libdivsufsort.a'],
            include_dirs=['lib/include'],
            language="c")])
