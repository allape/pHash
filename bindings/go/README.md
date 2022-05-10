# [pHash](http://www.phash.org/) bindding for [Go-lang](https://go.dev/)

## ⚠️ This `Binding` does *NOT* bind everything in `pHash`, just a demo ⚠️

## Required Tools
- [pHash](http://www.phash.org/)
- [Go](https://go.dev/)
- [Swig](https://swig.org/)

## Build Instruction
- ```bash
    chmod +x swig.go.sh && ./swig.go.sh
  ```
- Insert `#cgo LDFLAGS: -L/usr/local/lib -lpHash` to the first line of comment of `import "C"` in [`p_hash_go.go`](./p_hash_go.go). 
  - Insert `--verbose` in `LDFLAGS` to display debug info, and go command must run with env `CGO_LDFLAGS_ALLOW='--verbose'`.
- Tests
  ```bash
    go test
  ```
- `go install`
  ```bash
    # sudo /usr/local/go/bin/go install
    go install
  ```
