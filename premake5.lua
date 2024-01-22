project "libwebcam"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "on"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files {
        "libwebcam/device/*.h",
        "libwebcam/device/*.cpp",
        "libwebcam/device/state/*.h",
        "libwebcam/device/state/*.cpp",
        "libwebcam/error/*.h",
        "libwebcam/error/*.cpp",
        "libwebcam/image/*.h",
        "libwebcam/image/*.cpp",
        "libwebcam/info/*.h",
        "libwebcam/info/*.cpp",
        "libwebcam/utils/*.h",
        "libwebcam/utils/*.cpp",
        "libwebcam/webcam.h"
    }

    filter "system:windows"
        systemversion "latest"

        files {
            "libwebcam/device/os/win/*.h",
            "libwebcam/device/os/win/*.cpp",
            "libwebcam/image/os/win/*.cpp"
        }

        links {
            "strmbase",
            "Winmm"
        }

        includedirs {
            "%{prj.location}/vendor/win7/multimedia/directshow/baseclass_headers"
        }

        buildoptions { "/EHsc" }

    filter "system:linux"
        pic "on"

        files {
            "libwebcam/device/os/lin/*.h",
            "libwebcam/device/os/lin/*.cpp",
            "libwebcam/image/os/lin/*.cpp"
        }
        
    filter "configurations:Debug"
        runtime "Debug"
        optimize "Off"
        symbols "On"
        
    filter "configurations:Release"
        runtime "Release"
        optimize "On"
        symbols "Default"

    filter "configurations:Dist"
        runtime "Release"
        optimize "Speed"
        symbols "Off"
