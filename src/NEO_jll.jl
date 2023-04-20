# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule NEO_jll
using Base
using Base: UUID
using LazyArtifacts
Base.include(@__MODULE__, joinpath("..", ".pkg", "platform_augmentation.jl"))
import JLLWrappers

JLLWrappers.@generate_main_file_header("NEO")
JLLWrappers.@generate_main_file("NEO", UUID("700fe977-ac61-5f37-bbc8-c6c4b2b6a9fd"))
end  # module NEO_jll
