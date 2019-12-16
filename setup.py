import io
from setuptools import setup
from distutils.core import setup
from Cython.Build import cythonize

setup(
    name="mojimoji2",
    description="A fast converter between Japanese hankaku and zenkaku characters",
    long_description=io.open("README.rst", encoding="utf-8").read(),
    author="tamuhey",
    author_email="tamuhey@gmail.com",
    ext_modules=cythonize("mojimoji.pyx"),
    url="http://github.com/tamuhey/mojimoji",
    keywords=["japanese"],
    classifiers=[
        "Development Status :: 4 - Beta",
        "Intended Audience :: Developers",
        "Natural Language :: Japanese",
        "License :: OSI Approved :: Apache Software License",
        "Programming Language :: Python",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.5",
        "Programming Language :: Python :: 3.6",
        "Programming Language :: Python :: 3.7",
    ],
    install_requires=["Cython"],
)
