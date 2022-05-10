#include "p_hash_go.h"

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

void goPhMhImageHash(int alpha, int level, char *img, unsigned char *output) {
    int hashlen;
    uint8_t *hash = ph_mh_imagehash(img, hashlen, alpha, level);
    hashWithLength(hash, hashlen, output);
    free(hash);
}

double goPhHammingDistance2(unsigned char *hash1, int hashlen1, unsigned char *hash2, int hashlen2) {
    return ph_hammingdistance2((uint8_t*)hash1, hashlen1, (uint8_t*)hash2, hashlen2);
}

double goPhMhImageDistance(char *img1, char *img2) {
    int alpha = 2;
    int level = 1;

    int hashlen1, hashlen2;

    uint8_t *hash1 = ph_mh_imagehash(img1, hashlen1, alpha, level);
    uint8_t *hash2 = ph_mh_imagehash(img2, hashlen2, alpha, level);
    if (hash2 == NULL || hash1 == NULL) {
        return 0;
    }

    double dist = ph_hammingdistance2(hash1, hashlen1, hash2, hashlen2);

    free(hash1);
    free(hash2);

    return dist;
}
