#!/usr/bin/env python
# -*- coding: utf-8 -*-

cimport divsufsort

cdef class SuffixArray:
    def __init__(self):
        print divsufsort.divsufsort_version()
