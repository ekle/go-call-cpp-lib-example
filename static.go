package main

/*
#cgo LDFLAGS: libtest.a
#include "libtest.h"
*/
import "C"

func main() {
	C.CFunction()
	C.CFunctionCallingCpp()
}
