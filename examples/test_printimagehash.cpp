#include <stdint.h>
#include <stdio.h>
#include "math.h"
#include "pHash.h"

using namespace cimg_library;

int main(int argc, char **argv) {
    if (argc < 2) {
        printf(" not enough input args\n");
        exit(1);
    }

    const char *img1 = argv[1];

    int alpha = 2;
    int level = 1;

    int hashlen1;

    printf("file1: %s\n", img1);
    uint8_t *hash1 = ph_mh_imagehash(img1, hashlen1, alpha, level);

    for (int i = 0; i < hashlen1; i++) {
        // print as hex
        printf("%02x", hash1[i]);
    }

    printf("\n");

    free(hash1);
    return 0;
}
