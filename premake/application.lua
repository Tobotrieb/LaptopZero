require "premake/library"

applications = {}

--application(("ConsoleApp" | "WindowedApp"), "Name", ({"OtherLib", "AnotherLib"} | libraries), {"USE_DLL",})
function application(apptype, name, link_against, external_defines)
	group("Applications")
	project(name)
		kind(apptype)
		location("build")
		targetdir("bin/%{prj.name}/%{cfg.longname}_%{cfg.architecture}")
		files({
			"include/%{prj.name}/**.h",
			"src/%{prj.name}/**.cpp",
			"src/%{prj.name}/**.c",
		})
		includedirs("include")
		
		links(link_against)
		
		defines(external_defines)
	
	table.insert(applications, name)
end