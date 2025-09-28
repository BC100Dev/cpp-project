TestCLibraryFunctionality(glibc "#include <features.h>
#include <features.h>
#ifdef __GLIBC__
int main() { return 0; }
#else
#error Not GLIBC
#endif" HAS_GLIBC)

TestCLibraryFunctionality(bionic "#include <features.h>
#ifdef __BIONIC__
int main() { return 0; }
#else
#error Not Bionic
#endif" HAS_BIONIC)

TestCLibraryFunctionality(musl "#ifdef __MUSL__
int main() { return 0; }
#else
#error Not Musl
#endif" HAS_MUSL)

TestCLibraryFunctionality(mdlc "#if defined(__MDLC__) && defined(__MDLC_version__)
int main() { return 0; }
#else
#error Not MDLC
#endif" HAS_MDLC)

message(STATUS "HAS_GLIBC=${HAS_GLIBC}")
message(STATUS "HAS_BIONIC=${HAS_BIONIC}")
message(STATUS "HAS_MUSL=${HAS_MUSL}")
message(STATUS "HAS_MDLC=${HAS_MDLC}")

if (HAS_GLIBC)
    message(STATUS "Building against GNU C Library (GLIBC)")
elseif (HAS_BIONIC)
    message(STATUS "Building against Bionic")
elseif (HAS_MUSL)
    message(STATUS "Building against Musl C Library")
elseif (HAS_MDLC)
    message(STATUS "Building against Modular C (MDLC)")
else ()
    message(WARNING "C Library has not been detected. Make sure that the C library has been set up properly, and that the building works as expected.")
endif ()