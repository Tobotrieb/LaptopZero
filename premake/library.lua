
libraries = {}

--library(("StaticLib" | "SharedLib"), "Name", {"OtherLib", "AnotherLib"}, "BUILD_DLL")
function library(libtype, name, link_against, external_defines)
	group("Libraries")
	project(name)
		kind(libtype)
		location("build")
		targetdir("lib")
		files({
			"include/%{prj.name}/**.h",
			"src/%{prj.name}/**.cpp",
			"src/%{prj.name}/**.c",
		})
		includedirs("include")
		
		links(link_against)
		
		defines(external_defines)
	
	table.insert(libraries, name)
end