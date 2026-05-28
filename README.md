# haskell-pprof

Continuous profiling for GHC programs.

GHC 9.2 added two flags `-finfo-table-map` and `-fdistinct-constructor-tables`. These flags add source-level information (module, function, file, and line) into every closure's info table (i.e. an entry into the `.ipe` ELF section). At runtime, `GHC.Stack.CloneStack` can walk a thread's stack and resolve each frame back to those names.

This repository takes that capability and hooks it up to existing profiling backends. It provides a sampler that periodically captures live stacks, a writer for the standard pprof format, and a client that ships the result to a server.

If all you want is to drop continuous profiling into a Haskell service, depend on `pyroscope-ghc` and call `withPyroscopeEnv` from `main`. The other libraries are useful for projects that target backends other than Pyroscope (write a pprof to disk and open it in Speedscope, ingest into Parca, etc.) or that need a sampling strategy different from ghc-pprof's defaults.

## Limitations

This will inflate your binary size by a significant amount. The `-finfo-table-map` flag adds a large `.ipe` section with module names, function names, file names and line numbers of everything. The GHC user's guide says the overhead is around 200 MB on a project the size of GHC itself; expect less for your application, but some cost on shipping your binaries.

## Requirements

One GHC flag is required for stacks to symbolicate.

- `-finfo-table-map` embeds a section into the compiled binary that maps each info table back to its source location. Without it, frames decoded by `GHC.Stack.CloneStack` carry no names - the profile will be a flat sea of anonymous addresses.

An additional GHC flag makes the stacks more meaningful:

- `-fdistinct-constructor-tables` stops GHC from sharing one info table across all constructor allocations of a given shape. By default a `Just` built at line 12 and a `Just` built at line 99 collapse to the same info table and look identical in a profile; with this flag each allocation site gets its own info table. This is fairly important for real Haskell code, where most CPU time tends to be in constructor application and thunk evaluation rather than in named functions.

Both flags must be applied to every package whose frames you want resolved in the profile: your own application, the libraries it links against, and ideally GHC's own boot libraries (`base`, `ghc-internal`, `bytestring`, etc.). The Nix flake in this repository rebuilds GHC with the corresponding `hadrianFlags` so the boot libraries also carry IPE; for non-Nix setups, see the GHC user's guide chapter on info-table profiling.

And other flags are recommended:

- `-fno-info-table-map-with-stack` (since GHC 9.10) because `STACK` info tables are the majority of entries in the IPE map, but are only useful for heap-inspection tools like ghc-debug. This flag omits them and reclaims most of the binary size overhead without affecting ghc-pprof.
- `-fdistinct-constructor-tables-only=XXX` (since GHC 10) reduces binary size again by limiting to the selected constructors. For example, you might be interested in attributing only `Just` and `Right` so provide `-fdistinct-constructor-tables-only=Just,Right` - module names are stripped so just provide the constructor names.

## Libraries

### pprof

Build and gzip-encode profiles in Google's pprof format (`profile.proto`) for tools such as Speedscope, Pyroscope, and Parca.

Targets symbolicated profiles: frames carry resolved function names, and a single placeholder mapping is emitted in lieu of real address-space mappings. Suited to language-level profilers; not intended for emitting unsymbolicated native profiles.

Handles string interning, function and location deduplication, and gzip compression.

### ghc-pprof

Sampling profiler for a running GHC program. Periodically clones each live thread's stack via "GHC.Stack.CloneStack" and emits a pprof profile suitable for tools such as Pyroscope, Parca, or Speedscope.

The application and libraries being profiled must be compiled with `-finfo-table-map` for stack decoding to produce frames.

### pyroscope-client

HTTP client for Pyroscope.

### pyroscope-ghc

Background agent that samples a running GHC program with ghc-pprof and uploads the resulting pprof profiles to a Pyroscope server on an interval.
