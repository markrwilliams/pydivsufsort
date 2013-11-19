

cdef extern from "../lib/include/divsufsort.h":
    ctypedef int sauchar_t
    ctypedef int saidx_t
    ctypedef int saint_t

    # /**
    #  * Constructs the suffix array of a given string.
    #  * @param T[0..n-1] The input string.
    #  * @param SA[0..n-1] The output array of suffixes.
    #  * @param n The length of the given string.
    #  * @return 0 if no error occurred, -1 or -2 otherwise.
    #  */
    saint_t divsufsort(const sauchar_t *T, saidx_t *SA, saidx_t n)

    # /**
    #  * Constructs the burrows-wheeler transformed string of a given string.
    #  * @param T[0..n-1] The input string.
    #  * @param U[0..n-1] The output string. (can be T)
    #  * @param A[0..n-1] The temporary array. (can be NULL)
    #  * @param n The length of the given string.
    #  * @return The primary index if no error occurred, -1 or -2 otherwise.
    #  */
    saidx_t divbwt(const sauchar_t *T, sauchar_t *U, saidx_t *A, saidx_t n)

    # /**
    #  * Returns the version of the divsufsort library.
    #  * @return The version number string.
    #  */
    const char * divsufsort_version()


    # /**
    #  * Constructs the burrows-wheeler transformed string of a
    #  *   given string and suffix array.
    #  * @param T[0..n-1] The input string.
    #  * @param U[0..n-1] The output string. (can be T)
    #  * @param SA[0..n-1] The suffix array. (can be NULL)
    #  * @param n The length of the given string.
    #  * @param idx The output primary index.
    #  * @return 0 if no error occurred, -1 or -2 otherwise.
    #  */
    saint_t bw_transform(const sauchar_t *T,
                         sauchar_t *U,
                         saidx_t *SA, # /* can NULL */
                         saidx_t n, saidx_t *idx)

    # /**
    #  * Inverse BW-transforms a given BWTed string.
    #  * @param T[0..n-1] The input string.
    #  * @param U[0..n-1] The output string. (can be T)
    #  * @param A[0..n-1] The temporary array. (can be NULL)
    #  * @param n The length of the given string.
    #  * @param idx The primary index.
    #  * @return 0 if no error occurred, -1 or -2 otherwise.
    #  */
    saint_t inverse_bw_transform(const sauchar_t *T,
                                 sauchar_t *U,
                                 saidx_t *A, # /* can NULL */
                                 saidx_t n, saidx_t idx)

    # /**
    #  * Checks the correctness of a given suffix array.
    #  * @param T[0..n-1] The input string.
    #  * @param SA[0..n-1] The input suffix array.
    #  * @param n The length of the given string.
    #  * @param verbose The verbose mode.
    #  * @return 0 if no error occurred.
    #  */
    saint_t sufcheck(const sauchar_t *T, const saidx_t *SA, saidx_t n, saint_t verbose)

    # /**
    #  * Search for the pattern P in the string T.
    #  * @param T[0..Tsize-1] The input string.
    #  * @param Tsize The length of the given string.
    #  * @param P[0..Psize-1] The input pattern string.
    #  * @param Psize The length of the given pattern string.
    #  * @param SA[0..SAsize-1] The input suffix array.
    #  * @param SAsize The length of the given suffix array.
    #  * @param idx The output index.
    #  * @return The count of matches if no error occurred, -1 otherwise.
    #  */
    saidx_t sa_search(const sauchar_t *T,
                      saidx_t Tsize,
                      const sauchar_t *P,
                      saidx_t Psize,
                      const saidx_t *SA,
                      saidx_t SAsize,
                      saidx_t *left)

    # /**
    #  * Search for the character c in the string T.
    #  * @param T[0..Tsize-1] The input string.
    #  * @param Tsize The length of the given string.
    #  * @param SA[0..SAsize-1] The input suffix array.
    #  * @param SAsize The length of the given suffix array.
    #  * @param c The input character.
    #  * @param idx The output index.
    #  * @return The count of matches if no error occurred, -1 otherwise.
    #  */
    saidx_t sa_simplesearch(const sauchar_t *T,
                            saidx_t Tsize,
                            const saidx_t *SA,
                            saidx_t SAsize,
                            saint_t c,
                            saidx_t *left)
