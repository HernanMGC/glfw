project "GLFW"
	kind "StaticLib"
	language "C"

	targetdir("bin/" .. outputdir .. "%{prj.name}")
	objdir("bin-int/" .. outputdir .. "%{prj.name}")

	files
	{
		"include/GLFW/glfw3.h",
		"include/GLFW/glfw3native.h",
		"src/contest.h",
		"src/context.c",
		"src/egl_context.c",
		"src/glfw_config.h",
		"src/init.c",
		"src/init.h",
		"src/input.c",
		"src/input.h",
		"src/internal.h",
		"src/mappings.h",
		"src/monitor.c",
		"src/monitor.h",
		"src/null_init.c",
		"src/null_joystick.c",
		"src/null_joystick.h",
		"src/null_monitor.c",
		"src/null_platform.h",
		"src/null_window.c",
		"src/osmesa_context.c",
		"src/platform.c",
		"src/platform.h",
		"src/vulkan.c",
		"src/vulkan.h",
		"src/window.c",
		"src/window.h"
	}

	filter "system:windows"
		buildoptions {"-std=c11", "-lgdi32"}
		systemversion "latest"
		staticruntime "On"

	files
	{
		"src/win32_init.c",
		"src/win32_module.c",
		"src/win32_joystick.c",
		"src/win32_monitor.c",
		"src/win32_time.h",
		"src/win32_time.c",
		"src/win32_thread.h",
		"src/win32_thread.c",
		"src/win32_window.c",
		"src/wgl_context.c",
		"src/egl_context.c",
		"src/osmesa_context.c"
	}

	defines
	{
		"_GLFW_WIN32",		
		"_CRT_SECURE_NO_WARNINGS"		
	}

	filter {"system:windows", "configurations:Release"}
		buildoptions "/MT"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"