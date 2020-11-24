
function setup(workspace_name, target_system)
	workspace(workspace_name)
		location(".")
		language("C++")
		system(target_system)
		cppdialect("C++17")
		architecture("x64")
		configurations({"Debug", "Release", })
		flags({"MultiProcessorCompile", })
		systemversion("latest")
		staticruntime("on")
	
		filter {"configurations:Debug"}
			symbols("On")
			runtime("Debug")
			defines("CONFIGURATION_DEBUG")
	
		filter {"configurations:Release"}
			optimize("On")
			runtime("Release")
			defines("CONFIGURATION_RELEASE")
		
		filter {"system:windows"}
			defines("SYSTEM_WINDOWS")
		
		filter {"system:linux"}
			defines("SYSTEM_LINUX")
		
		filter {"system:macosx"}
			defines("SYSTEM_MACOSX")
		
		filter {"system:wii"}
			defines("SYSTEM_WII")
			
		filter {}
	
		objdir("bin-int/%{prj.name}/%{cfg.longname}_%{cfg.architecture}")
end