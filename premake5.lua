require "premake/setup"
require "premake/external_library"
require "premake/library"
require "premake/application"
require "premake/finish"

setup("TechTest", "windows") --aix, bsd, haiku, linux, macosx, solaris, wii, windows, xbox360
external_library("SharedLib", "glad", {"GLAD_GLAPI_EXPORT",})
external_library("SharedLib", "GLFW", {"_GLFW_BUILD_DLL",})
library("SharedLib", "TestLib", {"glad", "glfw", }, {"BUILD_DLL",})
application("ConsoleApp", "Test1", {"TestLib", }, {"USE_DLL",})
finish("TechTest")