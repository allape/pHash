void goPhMhImageHash(int alpha, int level, char *img, unsigned char *output);
double goPhHammingDistance2(unsigned char *hash1, int hashlen1, unsigned char *hash2, int hashlen2);

double goPhMhImageDistance(char *img1, char *img2);

int goPhDctVideohash(char *img, unsigned long *videoHashes);
