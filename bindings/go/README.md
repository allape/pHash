# [pHash](http://www.phash.org/) binding for [Golang](https://go.dev/)

## ONLY ph_mh_imagehash has been implemented.

## Required Tools

- [pHash](http://www.phash.org/)
- [Go](https://go.dev/)
- [Swig](https://swig.org/)

## Build Instruction

- ```bash
    swig -go -intgosize 32 -c++ gophash.i
  ```
- Insert `#cgo LDFLAGS: -L/usr/local/lib -lpHash` to the first line of comment of `import "C"` in [
  `gophash.go`](./gophash.go).
    - Insert `--verbose` in `LDFLAGS` to display debug info, and go command must run with env
      `CGO_LDFLAGS_ALLOW='--verbose'`.
- Tests
  ```bash
    go test
  ```
- Installation
  ```bash
    /usr/local/go/bin/go install
  ```
