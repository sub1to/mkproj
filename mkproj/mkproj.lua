project "mkproj"
    uuid                "6938b008-4e39-4017-9876-abe20f12bbe4"
    kind                "ConsoleApp"
    characterset        "Unicode"
    targetname          "mkproj"
    language            "C++"
    cppdialect          "C++20" 
    pchheader           "pch.h"
    pchsource           "src/pch.cpp"

    files
    {
        "include/**.hpp",
        "include/**.h",
        
        "src/**.inc",
        "src/**.asm",
        "src/**.cpp",
        "src/**.hpp",
        "src/**.h",
    }   
    
    vpaths {
        ["src/*"]     = "src/**",
        ["include/*"] = "include/**"
    }
    
    includedirs {
        "include",
        "src",
    }
    
    libdirs {
        "lib/",
    }
    
    links {
        
    }
    
    linkoptions {
        
    }
    
    defines {
        
    }
    
    warnings "Extra"        -- msc: /W4; gcc: -Wall -Wextra
    fatalwarnings "All"     -- msc: /WX; gcc: -Werror
    conformancemode "On"    -- msc: /permissive-
        
    filter "configurations:Debug"
        defines { "DEBUG" }
        optimize "Off"
        symbols "On"
        linktimeoptimization "Off"
        editandcontinue "Off"
        sanitize { "Address" }
        
    filter "configurations:Dev"
        flags { "NoIncrementalLink" }
        optimize "Off"
        symbols "Off"
        linktimeoptimization "On"
        
    filter "configurations:Release"
        flags { "NoIncrementalLink" }
        defines { "NDEBUG" }
        optimize "Full"
        symbols "Off"
        linktimeoptimization "On"

    filter { "configurations:Release", "toolset:gcc or clang" }
        buildoptions {
            "-flto=auto"
        }
        
        linkoptions {
            "-flto=auto"
        }
        
    -- Linux hardening
    filter "toolset:gcc or clang"
        buildoptions {
            "-Wpedantic",                   -- Warn on non-standard C++ extensions
            "-Wshadow",                     -- Even more pedantic
            "-Wconversion",                 -- Even more pedantic!!
            "-fstack-clash-protection",     -- chkstk probe
            "-fstack-protector-strong",     -- stack cookies
            "-fPIE"                         -- ASLR
        }
        
        linkoptions {
            "-pie",         -- ASLR
            "-Wl,-z,relro", -- .reloc readonly
            "-Wl,-z,now"    -- resolve GOT and PLT at init (like IAT in PE32+)
        }
    
    
    -- Windows "hardening"
    filter "toolset:msc"
        buildoptions {
            "/permissive-", -- Strict C++ standard, no MSVC bullshit
            "/w14242",      -- Warn on conversion checks
            "/w14254",      -- Warn on operator conversion
        }
    
    filter {}
