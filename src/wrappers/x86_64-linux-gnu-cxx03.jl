# Autogenerated wrapper script for NEO_jll for x86_64-linux-gnu-cxx03
export libigdrcl, libze_intel_gpu, ocloc

using gmmlib_jll
using libigc_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"
LIBPATH_default = ""

# Relative path to `libigdrcl`
const libigdrcl_splitpath = ["lib64", "intel-opencl", "libigdrcl.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libigdrcl_path = ""

# libigdrcl-specific global declaration
# This will be filled out by __init__()
libigdrcl_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libigdrcl = "libigdrcl.so"


# Relative path to `libze_intel_gpu`
const libze_intel_gpu_splitpath = ["lib64", "libze_intel_gpu.so.0.8"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libze_intel_gpu_path = ""

# libze_intel_gpu-specific global declaration
# This will be filled out by __init__()
libze_intel_gpu_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libze_intel_gpu = "libze_intel_gpu.so.0.8"


# Relative path to `ocloc`
const ocloc_splitpath = ["bin", "ocloc"]

# This will be filled out by __init__() for all products, as it must be done at runtime
ocloc_path = ""

# ocloc-specific global declaration
function ocloc(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        LIBPATH_base = get(ENV, LIBPATH_env, expanduser(LIBPATH_default))
        if !isempty(LIBPATH_base)
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', LIBPATH_base)
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(ocloc_path)
    end
end


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"NEO")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (gmmlib_jll.PATH_list, libigc_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (gmmlib_jll.LIBPATH_list, libigc_jll.LIBPATH_list,))

    global libigdrcl_path = normpath(joinpath(artifact_dir, libigdrcl_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libigdrcl_handle = dlopen(libigdrcl_path)
    push!(LIBPATH_list, dirname(libigdrcl_path))

    global libze_intel_gpu_path = normpath(joinpath(artifact_dir, libze_intel_gpu_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libze_intel_gpu_handle = dlopen(libze_intel_gpu_path)
    push!(LIBPATH_list, dirname(libze_intel_gpu_path))

    global ocloc_path = normpath(joinpath(artifact_dir, ocloc_splitpath...))

    push!(PATH_list, dirname(ocloc_path))
    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

