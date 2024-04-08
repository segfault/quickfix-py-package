import glob
import os
import shutil
import subprocess
import sys
from distutils.command.build import build
from distutils.command.build_ext import build_ext
from distutils.command.install import install
from distutils.core import Extension, setup
from distutils.sysconfig import get_config_vars


class build_ext_subclass(build_ext):
    def build_extensions(self):
        self.compiler.define_macro("PYTHON_MAJOR_VERSION", sys.version_info[0])
        print("Testing for std::tr1::shared_ptr...")
        try:
            self.compiler.compile(["test_std_tr1_shared_ptr.cpp"])
            self.compiler.define_macro("HAVE_STD_TR1_SHARED_PTR")
            print("...found")
        except:
            print(" ...not found")

        print("Testing for std::shared_ptr...")
        try:
            self.compiler.compile(["test_std_shared_ptr.cpp"], extra_preargs=["-std=c++0x"]),
            self.compiler.define_macro("HAVE_STD_SHARED_PTR")
            print("...found")
        except:
            print("...not found")

        print("Testing for std::unique_ptr...")
        try:
            self.compiler.compile(["test_std_unique_ptr.cpp"], extra_preargs=["-std=c++0x"]),
            self.compiler.define_macro("HAVE_STD_UNIQUE_PTR")
            print("...found")
        except:
            print("...not found")

        build_ext.build_extensions(self)


# Remove the "-Wstrict-prototypes" compiler option, which isn't valid for C++.
import distutils.sysconfig

cfg_vars = distutils.sysconfig.get_config_vars()
for key, value in cfg_vars.items():
    if type(value) == str:
        cfg_vars[key] = value.replace("-Wstrict-prototypes", "")

long_description = ""
with open("LICENSE") as file:
    license = file.read()

extra_compile_args = [
    "-std=c++0x",
    "-Wno-deprecated",
    "-Wno-unused-variable",
    "-Wno-deprecated-declarations",
    "-Wno-uninitialized",
    "-Wno-unused-label",
    "-IC++/swig",
    "-DHAVE_SSL=1",
]

# extra_link_args = []

# if sys.platform == 'linux':
#     extra_link_args.append("-L/usr/lib/aarch64-linux-gnu")
#     extra_compile_args.append("-I/usr/include/openssl")
# else:
#     extra_link_args.append("-L/opt/homebrew/opt/openssl@3/lib")
#     extra_compile_args.append("-I/opt/homebrew/opt/openssl@3/include")

setup(
    name="quickfix-py",
    version="0.0.10",
    py_modules=[
        "quickfix",
        "quickfixt11",
        "quickfix40",
        "quickfix41",
        "quickfix42",
        "quickfix43",
        "quickfix44",
        "quickfix50",
        "quickfix50sp1",
        "quickfix50sp2",
    ],
    data_files=[("share/quickfix", glob.glob("spec/FIX*.xml"))],
    author_email="pablodcar@gmail.com",
    maintainer="Pablo Carballo",
    maintainer_email="pablodcar@gmail.com",
    description="FIX (Financial Information eXchange) protocol implementation",
    url="https://github.com/pablodcar/quickfix-py-package",
    download_url="https://github.com/pablodcar/quickfix-py-package",
    license=license,
    cmdclass={"build_ext": build_ext_subclass},
    ext_modules=[
        Extension(
            "_quickfix",
            glob.glob("C++/*.cpp"),
            include_dirs=["C++"],
            # extra_compile_args=extra_compile_args,
            # extra_link_args=extra_link_args,
            libraries=["ssl", "crypto"],
        )
    ],
)
