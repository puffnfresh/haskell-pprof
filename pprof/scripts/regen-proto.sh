#!/usr/bin/env bash

set -euo pipefail

ROOT="$(dirname $(dirname "$0"))"

protoc \
    -I"$ROOT/proto" \
    --plugin=protoc-gen-haskell="$(command -v proto-lens-protoc)" \
    --haskell_out="$ROOT/src" \
    pprof/profile.proto
