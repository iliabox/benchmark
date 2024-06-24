package main

import (
    "crypto/sha256"
    "encoding/hex"
    "fmt"
    "time"
)

func main() {
    start := time.Now()

    array := make(map[int]string)
    for i := 0; i < 1000000; i++ {
        hash := sha256.Sum256([]byte(fmt.Sprintf("%d", i)))
        array[i] = hex.EncodeToString(hash[:])
    }

    duration := time.Since(start)
    fmt.Printf("Execution time: %v milliseconds\n", duration.Milliseconds())
}
