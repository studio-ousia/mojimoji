import sys
from setuptools import setup, Extension

if sys.platform.startswith("win"):
    compile_args = []
    link_args = []
else:
    compile_args = ["-std=c++11"]
    link_args = ["-std=c++11"]

extensions = [
    Extension(
        "mojimoji",
        ["mojimoji.pyx"],
        extra_compile_args=compile_args,
        extra_link_args=link_args,
    )
]

setup(name="mojimoji", ext_modules=extensions, setup_requires=["wheel", "Cython"])
