require "premake/setup"
require "premake/external_library"
require "premake/library"
require "premake/application"
require "premake/finish"

setup("Zero", "windows") --aix, bsd, haiku, linux, macosx, solaris, wii, windows, xbox360
--external_library("SharedLib", "glad", {"GLAD_GLAPI_EXPORT",})
--external_library("SharedLib", "GLFW", {"_GLFW_BUILD_DLL",})
--library("SharedLib", "ZeroLib", {"glad", "glfw", }, {"DLL_BUILD",})
library("SharedLib", "ZeroLib", {}, {"DLL_BUILD",})
application("ConsoleApp", "Zero", {"ZeroLib", }, {"DLL_USE",})
finish("Zero")