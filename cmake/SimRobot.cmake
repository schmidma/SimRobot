set(SIMROBOT_ROOT_DIR "${PROJECT_SOURCE_DIR}/Src/SimRobot")

file(GLOB_RECURSE SIMROBOT_SOURCES CONFIGURE_DEPENDS
    "${SIMROBOT_ROOT_DIR}/*.cpp" "${SIMROBOT_ROOT_DIR}/*.h")
list(APPEND SIMROBOT_SOURCES "${SIMROBOT_ROOT_DIR}/SimRobot.qrc")
list(APPEND SIMROBOT_SOURCES "${SIMROBOT_ROOT_DIR}/SimRobot.rc")

add_executable(SimRobot "${SIMROBOT_SOURCES}")

set_property(TARGET SimRobot PROPERTY AUTOMOC ON)
set_property(TARGET SimRobot PROPERTY AUTORCC ON)

target_include_directories(SimRobot PRIVATE "${SIMROBOT_ROOT_DIR}")
target_link_libraries(SimRobot PRIVATE Qt6::Core Qt6::Gui Qt6::OpenGL Qt6::Svg Qt6::Widgets)
add_dependencies(SimRobot SimRobotCore2 SimRobotCore2D SimRobotEditor)

add_library(SimRobotInterface INTERFACE)
target_include_directories(SimRobotInterface SYSTEM INTERFACE "${SIMROBOT_ROOT_DIR}")
target_link_libraries(SimRobotInterface INTERFACE Qt6::Core)

install(TARGETS SimRobot RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
