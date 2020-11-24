
--external_library(("StaticLib" | "SharedLib"), "Name")
--this calls the lua file in the include directory: name.lua
function external_library(libtype, name, external_defines)
	group("ExternalLibraries")
	project(name)
		kind(libtype)
		location("build")
		targetdir("lib")
		includedirs("include") --not needed, defined in include/name.lua
		warnings("Off")
		include("include/" .. name .. ".lua")
		defines(external_defines)
end