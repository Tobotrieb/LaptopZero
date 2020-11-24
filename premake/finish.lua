require "premake/application"
require "premake/library"

function finish(workspace_name)
	workspace(workspace_name)
		startproject(applications[#applications])
	
	applications = {}
	libaries = {}
end