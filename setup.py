# -*- coding: utf-8 -*-

from distutils.core import setup
from Cython.Build import cythonize

setup(
    name='mojimoji',
    version='0.0.2',
    description='A lightweight converter between hankaku(half-width) and zenkaku(full-width) characters',
    long_description=open('README.rst').read(),
    author='Studio Ousia',
    author_email='admin@ousia.jp',
    url='http://github.com/studio-ousia/mojimoji',
    ext_modules=cythonize('mojimoji.pyx', language='c++'),
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
