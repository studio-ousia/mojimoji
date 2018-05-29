# -*- coding: utf-8 -*-

import io
import sys
from setuptools import setup, Extension

if sys.platform.startswith('win'):
    compile_args = []
    link_args = []
else:
    compile_args = ['-std=c++11']
    link_args = ['-std=c++11']


setup(
    name='mojimoji',
    version='0.0.9',
    description='A fast converter between Japanese hankaku and zenkaku characters',
    long_description=io.open('README.rst', encoding='utf-8').read(),
    author='Studio Ousia',
    author_email='ikuya@ousia.jp',
    url='http://github.com/studio-ousia/mojimoji',
    ext_modules=[Extension('mojimoji', ['mojimoji.cpp'], language='c++',
                           extra_compile_args=compile_args, extra_link_args=link_args)],
    keywords=['japanese'],
    classifiers=[
        'Development Status :: 4 - Beta',
        'Intended Audience :: Developers',
        'Natural Language :: Japanese',
        'License :: OSI Approved :: Apache Software License',
        'Programming Language :: Python',
        'Programming Language :: Python :: 2.6',
        'Programming Language :: Python :: 2.7',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.5',
        'Programming Language :: Python :: 3.6',
    ]
)
