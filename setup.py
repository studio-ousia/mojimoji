# -*- coding: utf-8 -*-

import os
import sys
from setuptools import setup, Extension

if sys.platform == 'darwin':
    os.environ['CPPFLAGS'] = '-stdlib=libstdc++'

setup(
    name='mojimoji',
    version='0.0.6',
    description='A lightweight converter between hankaku(half-width) and zenkaku(full-width) characters',
    long_description=open('README.rst').read(),
    author='Studio Ousia',
    author_email='ikuya@ousia.jp',
    url='http://github.com/studio-ousia/mojimoji',
    ext_modules=[Extension('mojimoji', ['mojimoji.cpp'], language='c++')],
    license=open('LICENSE').read(),
    keywords=['japanese'],
    classifiers=[
        'Development Status :: 4 - Beta',
        'Intended Audience :: Developers',
        'Natural Language :: Japanese',
        'License :: OSI Approved :: Apache Software License',
        'Programming Language :: Python',
        'Programming Language :: Python :: 2.6',
        'Programming Language :: Python :: 2.7',
    ]
)
