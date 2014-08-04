#include <stdio.h>

class CppClass {
	public: void ClassFunction(){
		printf("  C++ class function\n");
	};
};

extern "C" { // only the functions within can be called from golang
	void CFunction(){
		printf("  C function\n");
	}
	void CFunctionCallingCpp(){
		// you can call whatever C++ you like in this functions. CppClass is just an integrated example.
		CppClass t;
		t.ClassFunction();
	}
};
