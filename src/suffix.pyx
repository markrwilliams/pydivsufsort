#!/usr/bin/env python
# -*- coding: utf-8 -*-

cimport _suffixarray

cdef class SuffixArray:

    def __cinit__(self):
        pass

    def __init__(self):
        print _suffixarray.divsufsort_version()
