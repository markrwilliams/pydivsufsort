#!/usr/bin/env python
# -*- coding: utf-8 -*-

from glob import glob
import subprocess
from os.path import exists

from distutils.core import setup
from distutils.extension import Extension
from distutils.command.build_py import build_py as _build_py

from Cython.Build import cythonize


class build_py(_build_py):
    if exists('lib/Makefile'):
        subprocess.Popen(['make', 'distclean'], cwd='lib/')
    subprocess.Popen(['configure'], cwd='lib/')


setup(
    cmdclass={'build_py': build_py},
    name='divsufsort',
    include_dirs=['lib'],
    ext_modules=[
        Extension(
            "divsufsort",
            sources=glob('lib/lib/*.c'),
            include_dirs=['lib/include'],
            language="c",
        )
    ] + cythonize('src/*.pyx'),
)
