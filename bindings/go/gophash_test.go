package gophash

import (
	"fmt"
	"testing"
)

const LogoImage = "../../pHash.png"
const PerceptualHash = "000002ff89c1e392350d7e233b9e302fe2e356471dd95119f2a552b2dc550ab4b16ad96df0acef67151c39c4af4460f70ce7323db90002db12f2727c382c04b2dac7edc4bdaf6c92"

func TestImageHashString(t *testing.T) {
	fmt.Printf("TestImageHashString\n")
	hash, err := ImageHashString(2, 1, LogoImage)
	if err != nil {
		t.Fatalf("Unexpect %v\n", err)
	}
	fmt.Printf("hash: %s\n\n\n", hash)
	if hash != PerceptualHash {
		t.Fatalf("Expected %s, got %s\n", PerceptualHash, hash)
	}
}
