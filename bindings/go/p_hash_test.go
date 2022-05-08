package p_hash_go

import (
	"testing"
)

func TestDistance(t *testing.T) {
	distance := Distance("1.png", "1.png")
	if distance != 0 {
		t.Fatalf("Unexpect %f", distance)
	}
}
