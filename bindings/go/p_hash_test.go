package p_hash_go

import (
	"encoding/hex"
	"fmt"
	"testing"
)

const image = "../../pHash.png"
const hash = "000002ff89c1e392350d7e233b9e302fe2e356471dd95119f2a552b2dc550ab4b16ad96df0acef67151c39c4af4460f70ce7323db90002db12f2727c382c04b2dac7edc4bdaf6c92"

func TestDistance(t *testing.T) {
	fmt.Printf("TestDistance\n")
	distance := GoPhMhImageDistance(image, image)
	fmt.Printf("Distance: %f\n", distance)
	if distance != 0 {
		t.Fatalf("Unexpect %f\n", distance)
	}
	fmt.Printf("\n\n")
}

func TestImageHash(t *testing.T) {
	fmt.Printf("TestImageHash\n")
	hash := make([]byte, 256)
	GoPhMhImageHash(2, 1, image, hash)
	fmt.Printf("hash array with length: %v\n", hash)
	if hash[0] != 72 {
		t.Fatalf("Unexpect %v\n", hash)
	}
	fmt.Printf("\n\n")
}

func TestImageHashString(t *testing.T) {
	fmt.Printf("TestImageHashString\n")
	hash, err := ImageHashString(2, 1, image)
	if err != nil {
		t.Fatalf("Unexpect %v\n", err)
	}
	fmt.Printf("hash: %s\n\n\n", hash)
}

func TestHashStringDistance(t *testing.T) {
	fmt.Printf("TestHashStringDistance\n")
	hashByteArr, err := hex.DecodeString(hash)
	if err != nil {
		t.Fatalf("Unexpect %v\n", err)
	}
	fmt.Printf("hash string hex length: %d, array: %v\n", len(hashByteArr), hashByteArr)
	distance, err := HashStringDistance(hash, hash)
	fmt.Printf("distance: %f\n", distance)
	if distance != 0 {
		t.Fatalf("Unexpect %v\n", distance)
	}
}
