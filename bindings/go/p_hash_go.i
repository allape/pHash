%module p_hash_go

%{
#include "p_hash_go.h"
%}

%include <typemaps.i>
%apply unsigned char *INOUT { unsigned char *output };

%apply unsigned char *INOUT { unsigned char *hash1 };
%apply unsigned char *INOUT { unsigned char *hash2 };

%apply unsigned long *INOUT { unsigned long *videoHashes };

%include "p_hash_go.h"

%go_import("errors")
%go_import("encoding/hex")
%insert(go_wrapper) %{
func ImageHashString(alpha, level int, image string) (string, error) {
    hash := make([]byte, 256)
    result := GoPhMhImageHash(alpha, level, image, hash)
    if len(hash) < 1 || result != 0 {
        return "", errors.New("Not a valid hash wrapper array")
    }
    hashLength := int(hash[0])
    if hashLength < 1 {
        return "", errors.New("Not a valid hash array")
    }
    return hex.EncodeToString(hash[1:hashLength+1]), nil
}

func HashStringDistance(hash1, hash2 string) (float64, error) {
    hashByteArr1, err := hex.DecodeString(hash1)
    if err != nil {
        return 0, err
    }
    hashByteArr2, err := hex.DecodeString(hash2)
    if err != nil {
        return 0, err
    }
    distance := GoPhHammingDistance2(hashByteArr1, len(hashByteArr1), hashByteArr2, len(hashByteArr2))
    return distance, nil
}
%}
