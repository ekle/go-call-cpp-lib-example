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
	go build static.go
	ldd static
	@echo
	# --------------------------------------------------------------------
	# dynamic
	# --------------------------------------------------------------------
	gcc -shared -Wl,-soname,libtest.so -o libtest.so  libtest.o
	export LD_LIBRARY_PATH=.
	go build dynamic.go
	ldd dynamic
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
