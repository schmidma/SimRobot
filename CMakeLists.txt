cmake_minimum_required(VERSION 3.16)

project(SimRobot LANGUAGES CXX)

find_package(box2d REQUIRED)
find_package(Eigen3 REQUIRED NO_MODULE)
find_package(ODE REQUIRED)
find_package(Qt6 COMPONENTS Concurrent Core Gui OpenGL OpenGLWidgets Svg SvgWidgets Widgets REQUIRED)

include("cmake/SimRobot.cmake")
include("cmake/SimRobotCommon.cmake")
include("cmake/SimRobotCore2.cmake")
include("cmake/SimRobotCore2D.cmake")
include("cmake/SimRobotEditor.cmake")
