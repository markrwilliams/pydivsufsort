#!/usr/bin/env python
# -*- coding: utf-8 -*-

from distutils.core import setup
from Cython.Build import cythonize

setup(
    name='divsufsort',
    include_dirs=['lib'],
    ext_modules=cythonize("src/*.pyx"),
)
