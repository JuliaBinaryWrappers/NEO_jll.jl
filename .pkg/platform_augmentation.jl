using Base.BinaryPlatforms

# Can't use Preferences since we might be running this very early with a non-existing Manifest
NEO_jll_uuid = Base.UUID("700fe977-ac61-5f37-bbc8-c6c4b2b6a9fd")
const preferences = Base.get_preferences(NEO_jll_uuid)
Base.record_compiletime_preference(NEO_jll_uuid, "debug")

function augment_platform!(platform::Platform)
    debug = tryparse(Bool, get(preferences, "debug", "false"))
    if debug === nothing
        @error "Invalid preference debug=$(get(preferences, "debug", "false"))"
    elseif !haskey(platform, "debug")
        platform["debug"] = string(debug)
    end
    return platform
end