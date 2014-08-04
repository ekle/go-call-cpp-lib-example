go: call cpp lib example
========================

Example Project. Call C++ Code from go via a C wrapper lib.

libtest.cc and libtest.h
========================

C-Code and C++-Code with a C-wrapper, which is both called by Go.   

dynamic.go
==========

compiles to a dynamically linked binary.

static.go
=========

compiles to a statistically linked binary.
It is a bit tricky to link external dependency’s statistically. but it is possible.

Mixtures of static and dynamic linking are also possible. Like linking the C-wrapper statistically and the external dependency’s dynamically.

Makefile
=======

compiles and runs both versions. 
This Makefile is needed to compile the CPP part of the Project and build the C-lib.

