# -*- coding: utf-8 -*-

from Cython.Build import cythonize
from setuptools import setup, Extension

extensions = cythonize([Extension(
    '*', ['*.pyx'],
    include_dirs=['/usr/include/c++/4.2.1'],
    language="c++")
])

setup(
    name='mojimoji',
    version='0.0.3',
    description='A lightweight converter between hankaku(half-width) and zenkaku(full-width) characters',
    long_description=open('README.rst').read(),
    author='Studio Ousia',
    author_email='admin@ousia.jp',
    url='http://github.com/studio-ousia/mojimoji',
    ext_modules=extensions,
    license=open('LICENSE').read(),
    keywords=['japanese'],
    classifiers=(
        'Development Status :: 4 - Beta',
        'Intended Audience :: Developers',
        'Natural Language :: Japanese',
        'License :: OSI Approved :: Apache Software License',
        'Programming Language :: Python',
        'Programming Language :: Python :: 2.6',
        'Programming Language :: Python :: 2.7',
    )
)
