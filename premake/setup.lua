
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
			defines("DEBUG")
	
		filter {"configurations:Release"}
			optimize("On")
			runtime("Release")
			defines({"NDEBUG", "RELEASE", })
		
		filter {"system:windows"}
			defines("WINDOWS")
		
		filter {"system:linux"}
			defines("LINUX")
		
		filter {"system:macosx"}
			defines("MACOSX")
		
		filter {"system:wii"}
			defines("WII")
			
		filter {}
	
		objdir("bin-int/%{prj.name}/%{cfg.longname}_%{cfg.architecture}")
end