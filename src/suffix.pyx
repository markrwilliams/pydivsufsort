#!/usr/bin/env python
# -*- coding: utf-8 -*-
from __future__ import unicode_literals

cimport _suffixarray

stuff = 'hi'

cdef class SuffixArray:

    def __cinit__(self):
        pass

    def __init__(self):
        print _suffixarray.divsufsort_version()
