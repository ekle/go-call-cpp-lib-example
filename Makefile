build:
	# --------------------------------------------------------------------
	# compile lib
	# --------------------------------------------------------------------
	gcc -c -fPIC libtest.cc -o libtest.o 
	@echo
	# --------------------------------------------------------------------
	# static
	# --------------------------------------------------------------------
	ar rcs libtest.a libtest.o
	go build -ldflags="-extldflags=-static" static.go
	ldd static || true
	@echo
	# --------------------------------------------------------------------
	# dynamic
	# --------------------------------------------------------------------
	gcc -shared -Wl,-soname,libtest.so -o libtest.so  libtest.o
	go build dynamic.go
	LD_LIBRARY_PATH=. ldd dynamic
	@echo
	# --------------------------------------------------------------------
	#  run both
	# --------------------------------------------------------------------
	LD_LIBRARY_PATH=. ./dynamic
	# --------------------------------------------------------------------
	./static

clean:
	rm dynamic 
	rm static 
	rm libtest.a
	rm libtest.o
	rm libtest.so
