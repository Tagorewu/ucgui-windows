cmake_minimum_required(VERSION 3.13)
project(ucgui)

file(GLOB GUI_SRC ucgui/GUI/AntiAlias/*.c
    ucgui/GUI/ConvertColor/*.c
    ucgui/GUI/ConvertMono/*.c
    ucgui/GUI/Core/*.c
    ucgui/GUI/Font/*.c
    ucgui/GUI/MemDev/*.c
    ucgui/GUI/MultiLayer/*.c
    ucgui/GUI/Widget/*.c
    ucgui/GUI/WM/*.c
    ucgui/GUI_X/*.c
    ucgui/GUI_X/font/*.c)

add_library(ucgui STATIC ${GUI_SRC})

target_include_directories(ucgui PUBLIC
    ucgui/GUI/Core
    ucgui/GUI/WM
    ucgui/GUI/Widget
    ucgui/GUI_X)

file(GLOB EXE_SRC GUIDemo_windows/*.c)
add_executable(GUIDEMO ${EXE_SRC})
target_link_libraries(GUIDEMO ucgui m winmm gdi32)
