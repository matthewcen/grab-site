#!/usr/bin/env python3

try:
	from setuptools import setup
except ImportError:
	from distutils.core import setup

import os
import sys
import libgrabsite

install_requires = [
	"click>=8.0",
	"wpull @ https://github.com/matthewcen/ludios_wpull/tarball/master",
	"manhole>=1.5.0",
	"lmdb>=1.3.0",
	"autobahn>=22.1.1",
	"fb-re2>=1.0.7",
	"websockets>=10.3",
]

if 'GRAB_SITE_NO_CCHARDET' not in os.environ:
	install_requires.append("cchardet>=2.1.7")

setup(
	name="grab-site",
	version=libgrabsite.__version__,
	description="The archivist's web crawler: WARC output, dashboard for all crawls, dynamic ignore patterns",
	url="https://ludios.org/grab-site/",
	author="Ivan Kozik",
	author_email="ivan@ludios.org",
	classifiers=[
		"Programming Language :: Python :: 3",
		"Development Status :: 5 - Production/Stable",
		"Intended Audience :: End Users/Desktop",
		"License :: OSI Approved :: MIT License",
		"Topic :: Internet :: WWW/HTTP",
	],
	scripts=["grab-site", "gs-server", "gs-dump-urls"],
	packages=["libgrabsite"],
	package_data={"libgrabsite": ["*.html", "*.ico", "*.txt", "ignore_sets/*"]},
	python_requires=">3.8",
	install_requires=install_requires,
)
