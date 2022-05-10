package p_hash_go

import (
	"fmt"
	"testing"
)

func TestDistance(t *testing.T) {
	distance := Distance("1.png", "1.png")
	fmt.Printf("Distance: %f\n", distance)
	if distance != 0 {
		t.Fatalf("Unexpect %f\n", distance)
	}
}

func TestImageHash(t *testing.T) {
	hash := make([]byte, 256)
	GoPhMhImageHash(2, 1, "1.png", hash)
	fmt.Printf("hash array with length: %v\n", hash)
	fmt.Printf("hash: ")
	for i, b := range hash {
		if i == 0 {
			continue
		}
		if i > int(hash[0]) {
			break
		}
		fmt.Printf("%04X", b)
	}
	fmt.Printf("\n")
	if hash[0] != 72 {
		t.Fatalf("Unexpect %v\n", hash)
	}
}
