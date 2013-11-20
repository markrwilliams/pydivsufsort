#!/usr/bin/env python
# -*- coding: utf-8 -*-
from __future__ import unicode_literals

cimport divsufsort


cdef class SuffixArray:
    def __init__(self):
        print divsufsort.divsufsort_version()
