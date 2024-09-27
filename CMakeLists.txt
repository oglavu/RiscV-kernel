cmake_minimum_required(VERSION 3.10) # Minimum CMake version
project(PROJEKAT)  # Name of your project

# Define the C++ standard
set(CMAKE_CXX_STANDARD 20)

# Include directories for headers
include_directories(h)

# Find all .cpp and .h files in src and include directories
file(GLOB_RECURSE SRC_FILES src/* h/* test/*)

# Add executable with all source files
add_executable(PROJEKAT ${SRC_FILES})
