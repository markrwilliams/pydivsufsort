#!/usr/bin/env python
# -*- coding: utf-8 -*-

from glob import glob
import subprocess
from os.path import exists

from setuptools import setup
from setuptools.extension import Extension
from setuptools.command.build_py import build_py as _build_py

from Cython.Build import cythonize


class build_py(_build_py):
    if exists('lib/Makefile'):
        make_clean = subprocess.Popen(['make', 'distclean'], cwd='lib/')
        make_clean.wait()
    configure = subprocess.Popen(['./configure', '--enable-static'],
                                 cwd='lib/')
    configure.wait()
    make = subprocess.Popen(['make', '-j'], cwd='lib/')
    make.wait()

setup(
    cmdclass={'build_py': build_py},
    name='divsufsort',
    include_dirs=['lib'],
    ext_modules=[
        Extension(
            "suffixarray",
            sources=glob('src/*.c'),
            include_dirs=['lib/include'],
            language="c")])
