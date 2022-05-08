#include "p_hash_go.h"

#include <stdint.h>
#include <stdio.h>
#include "math.h"
#include "pHash.h"

double distance(char *img1, char *img2) {
    int alpha = 2;
    int level = 1;

    int hashlen1, hashlen2;

    uint8_t *hash1 = ph_mh_imagehash(img1, hashlen1, alpha, level);
    uint8_t *hash2 = ph_mh_imagehash(img2, hashlen2, alpha, level);
    if (hash2 == NULL || hash1 == NULL) {
        printf("Unable to generate hash");
        return 0;
    }

    double dist = ph_hammingdistance2(hash1, hashlen1, hash2, hashlen2);

    free(hash1);
    free(hash2);

    return dist;
}
