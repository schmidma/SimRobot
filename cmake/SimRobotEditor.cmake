set(SIMROBOTEDITOR_ROOT_DIR "${PROJECT_SOURCE_DIR}/Src/SimRobotEditor")

file(GLOB_RECURSE SIMROBOTEDITOR_SOURCES CONFIGURE_DEPENDS
    "${SIMROBOTEDITOR_ROOT_DIR}/*.cpp" "${SIMROBOTEDITOR_ROOT_DIR}/*.h")
list(APPEND SIMROBOTEDITOR_SOURCES "${SIMROBOTEDITOR_ROOT_DIR}/SimRobotEditor.qrc")

add_library(SimRobotEditor MODULE EXCLUDE_FROM_ALL ${SIMROBOTEDITOR_SOURCES})
set_property(TARGET SimRobotEditor PROPERTY AUTOMOC ON)
set_property(TARGET SimRobotEditor PROPERTY AUTORCC ON)
target_include_directories(SimRobotEditor PRIVATE "${SIMROBOTEDITOR_ROOT_DIR}")
target_link_libraries(SimRobotEditor PRIVATE Qt6::Core Qt6::Gui Qt6::Widgets)
target_link_libraries(SimRobotEditor PRIVATE SimRobotInterface)

add_library(SimRobotEditorInterface INTERFACE)
target_include_directories(SimRobotEditorInterface SYSTEM INTERFACE "${SIMROBOTEDITOR_ROOT_DIR}")
target_link_libraries(SimRobotEditorInterface INTERFACE Qt6::Core)
target_link_libraries(SimRobotEditorInterface INTERFACE SimRobotInterface)
