%module gophash

%{
#include "gophash.h"
%}

%include <typemaps.i>
%apply unsigned char *INOUT { unsigned char *output };

%include "gophash.h"

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

func phBitCount8(val byte) int {
	num := 0
	for val != 0 {
		num += 1
		val &= val - 1
	}
	return num
}

func PhHammingDistance(hash1, hash2 []byte) float64 {
	lenA := len(hash1)
	if lenA != len(hash2) {
		return -1.0
	}
	dist := float64(0)
	D := byte(0)
	for i, b := range hash1 {
		D = hash2[i] ^ b
		dist += float64(phBitCount8(D))
	}
	bits := float64(lenA * 8)
	return dist / bits
}

func HexStringPhHammingDistance(hash1, hash2 string) (float64, error) {
	hashByteArr1, err := hex.DecodeString(hash1)
	if err != nil {
		return 0, err
	}
	hashByteArr2, err := hex.DecodeString(hash2)
	if err != nil {
		return 0, err
	}
	return PhHammingDistance(hashByteArr1, hashByteArr2), nil
}
%}
