%module p_hash_go

%{
#include "p_hash_go.h"
%}

%include <typemaps.i>
%apply unsigned char *INOUT { unsigned char *output };

%apply unsigned char *INOUT { unsigned char *hash1 };
%apply unsigned char *INOUT { unsigned char *hash2 };

%include "p_hash_go.h"

%go_import("errors")
%go_import("encoding/hex")
%go_import("fmt")
%go_import("strings")
%insert(go_wrapper) %{

func ImageHashString(alpha, level int, image string) (string, error) {
	hash := make([]byte, 256)
	GoPhMhImageHash(alpha, level, image, hash)
  if len(hash) < 1 {
    return "", errors.New("hash wrapper length less than 1")
  }
  hashLength := int(hash[0])
  if hashLength < 1 {
    return "", errors.New("hash length less than 1")
  }
  hashStringArray := make([]string, hashLength)
  for i, b := range hash {
		if i == 0 {
			continue
		}
		if i > int(hash[0]) {
			break
		}
		hashStringArray[i - 1] = fmt.Sprintf("%02X", b)
	}
  return strings.Join(hashStringArray, ""), nil
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
