# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.9

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /cvmfs/dampe.cern.ch/centos7/bin/cmake

# The command to remove a file.
RM = /cvmfs/dampe.cern.ch/centos7/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /atlas/users/coppinp/GeantExamples/B3

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /atlas/users/coppinp/GeantExamples/B3/build

# Utility rule file for B3b.

# Include the progress variables for this target.
include B3b/CMakeFiles/B3b.dir/progress.make

B3b/CMakeFiles/B3b: B3b/exampleB3b


B3b: B3b/CMakeFiles/B3b
B3b: B3b/CMakeFiles/B3b.dir/build.make

.PHONY : B3b

# Rule to build all files generated by this target.
B3b/CMakeFiles/B3b.dir/build: B3b

.PHONY : B3b/CMakeFiles/B3b.dir/build

B3b/CMakeFiles/B3b.dir/clean:
	cd /atlas/users/coppinp/GeantExamples/B3/build/B3b && $(CMAKE_COMMAND) -P CMakeFiles/B3b.dir/cmake_clean.cmake
.PHONY : B3b/CMakeFiles/B3b.dir/clean

B3b/CMakeFiles/B3b.dir/depend:
	cd /atlas/users/coppinp/GeantExamples/B3/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /atlas/users/coppinp/GeantExamples/B3 /atlas/users/coppinp/GeantExamples/B3/B3b /atlas/users/coppinp/GeantExamples/B3/build /atlas/users/coppinp/GeantExamples/B3/build/B3b /atlas/users/coppinp/GeantExamples/B3/build/B3b/CMakeFiles/B3b.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : B3b/CMakeFiles/B3b.dir/depend

