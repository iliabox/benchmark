package main

import (
    "crypto/sha256"
    "encoding/hex"
    "fmt"
    "strconv"
    "strings"
    "time"
)

func sha256Hash(data string) string {
    hash := sha256.Sum256([]byte(data))
    return hex.EncodeToString(hash[:])
}

func main() {
    start := time.Now()

    array1 := make(map[int]string)
    for i := 0; i < 1000000; i++ {
        array1[i] = sha256Hash(strconv.Itoa(i))
    }

    array2 := make([]string, 0, len(array1))
    for _, hash := range array1 {
        array2 = append(array2, hash[1:len(hash)-1])
    }

    finalHash := sha256Hash(strings.Join(array2, ""))

    fmt.Printf("Final hash: %s\n", finalHash)

    duration := time.Since(start).Milliseconds()
    fmt.Printf("Execution time: %d milliseconds\n", duration)
}
