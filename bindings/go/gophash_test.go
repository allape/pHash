package gophash

import (
	"fmt"
	"testing"
)

const LogoImage = "../../pHash.png"
const PerceptualHash = "0000013f89c1e3920400fe233b9e303fe2e325471dd95119f2a552b2dc550ab4b16ad96d60acef67151c39c4ab2068f70ce7323dc0db012492f27278380cdbb2dac7edc4bdaf6cdb"

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
