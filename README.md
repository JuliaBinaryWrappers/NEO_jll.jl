# `NEO_jll.jl` (v20.27.17231+0)

This is an autogenerated package constructed using [`BinaryBuilder.jl`](https://github.com/JuliaPackaging/BinaryBuilder.jl). The originating [`build_tarballs.jl`](https://github.com/JuliaPackaging/Yggdrasil/blob/b06dba0416f21dfee6356e596a756ded944a8d51/N/NEO/build_tarballs.jl) script can be found on [`Yggdrasil`](https://github.com/JuliaPackaging/Yggdrasil/), the community build tree.

For more details about JLL packages and how to use them, see `BinaryBuilder.jl` [documentation](https://juliapackaging.github.io/BinaryBuilder.jl/dev/jll/).

## Sources

The tarballs for `NEO_jll.jl` have been built from these sources:

* git repository: https://github.com/intel/compute-runtime.git (revision: `5eafc349c9c7566211bacd7d2de22ceed335c5c2`)
* git repository: https://github.com/oneapi-src/level-zero.git (revision: `ebb363e938a279cf866cb93d28e31aaf0791ea19`)

## Platforms

`NEO_jll.jl` is available for the following platforms:

* `Linux(:x86_64, libc=:glibc, compiler_abi=CompilerABI(cxxstring_abi=:cxx03))` (`x86_64-linux-gnu-cxx03`)
* `Linux(:x86_64, libc=:glibc, compiler_abi=CompilerABI(cxxstring_abi=:cxx11))` (`x86_64-linux-gnu-cxx11`)

## Dependencies

The following JLL packages are required by `NEO_jll.jl`:

* [`gmmlib_jll`](https://github.com/JuliaBinaryWrappers/gmmlib_jll.jl)
* [`libigc_jll`](https://github.com/JuliaBinaryWrappers/libigc_jll.jl)

## Products

The code bindings within this package are autogenerated from the following `Products`:

* `LibraryProduct`: `libigdrcl`
* `LibraryProduct`: `libze_intel_gpu`
* `ExecutableProduct`: `ocloc`
