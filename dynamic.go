package main

/*
#cgo LDFLAGS: -L. -ltest
#include "libtest.h"
*/
import "C"

func main() {
	C.CFunction()
	C.CFunctionCallingCpp()
}
