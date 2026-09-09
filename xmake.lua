set_project("Yansuan")
set_version("0.1.0")

set_languages("c++latest", "c11")

add_rules("mode.debug", "mode.release")

-- debug
if is_mode("debug") then
    set_symbols("debug")
    set_optimize("none")
else
    set_symbols("hidden")
    set_warnings("all", "error")
    set_optimize("fastest")
    set_strip("all")
end

-- platform-specific flags
function add_platform_specific_flags()
    if is_plat("windows") then
        add_cxxflags("/EHsc")
    else
    end
end

-- libyansuan static
target("libyansuan-static")
    set_kind("static")
    add_files("src/foo.cpp")
    add_platform_specific_flags()

-- libyansuan shared
target("libyansuan")
    set_kind("shared")
    add_files("src/foo.cpp")
    add_platform_specific_flags()

-- yansuan
target("Yansuan")
    set_kind("binary")
    add_deps("libyansuan-static")
    add_files("src/main.cpp")
    add_platform_specific_flags()
