package p_hash_go

import (
	"encoding/hex"
	"fmt"
	"testing"
)

const image = "../../pHash.png"
const hash = "000002FF89C1E392350D7E233B9E302FE2E356471DD95119F2A552B2DC550AB4B16AD96DF0ACEF67151C39C4AF4460F70CE7323DB90002DB12F2727C382C04B2DAC7EDC4BDAF6C92"

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
