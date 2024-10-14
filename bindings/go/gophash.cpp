#include "gophash.h"

#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <cmath>
#include "math.h"
#include "pHash.h"

void hashWithLength(uint8_t *hash, int hashLen, unsigned char *output) {
    output[0] = (unsigned char) std::abs(hashLen);
    for (int i = 0; i < hashLen; i++) {
        output[i + 1] = hash[i];
    }
}

int goPhMhImageHash(int alpha, int level, char *img, unsigned char *output) {
    int hashlen;
    try {
        uint8_t *hash = ph_mh_imagehash(img, hashlen, alpha, level);
        hashWithLength(hash, hashlen, output);
        free(hash);
        return 0;
    } catch (...) {
        // ignore
    }
    return -1;
}
