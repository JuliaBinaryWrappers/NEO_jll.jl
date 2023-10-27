using Base.BinaryPlatforms

# Can't use Preferences since we might be running this very early with a non-existing Manifest
NEO_jll_uuid = Base.UUID("700fe977-ac61-5f37-bbc8-c6c4b2b6a9fd")
const preferences = Base.get_preferences(NEO_jll_uuid)
Base.record_compiletime_preference(NEO_jll_uuid, "debug")
const debug_preference = if haskey(preferences, "debug")
    if isa(preferences["debug"], Bool)
        preferences["debug"]
    elseif isa(preferences["debug"], String)
        parsed = tryparse(Bool, preferences["debug"])
        if parsed === nothing
            @error "Debug preference is not valid; expected a boolean, but got '$(preferences["debug"])'"
            nothing
        else
            parsed
        end
    else
        @error "Debug preference is not valid; expected a boolean, but got '$(preferences["debug"])'"
        nothing
    end
else
    nothing
end

function augment_platform!(platform::Platform)
    platform["debug"] = string(something(debug_preference, false))
    return platform
end