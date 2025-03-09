# Compiler
CXX = g++

# Compiler flags
CXXFLAGS = -std=c++17 -Wall -Wextra -g

# Directories
SRC_DIR = src
BUILD_DIR = build
INCLUDE_DIR = include
SHADER_DIR = Shaders

# Libraries
LIBS = -lGLEW -lGLFW -lGL -lm

# Include directories
INCLUDES = -I./$(INCLUDE_DIR) -I C:\Users\166539\Downloads\opengl_setup\Externel_lib\glew-2.2.0-win32\glew-2.2.0\include -I C:\Users\166539\Downloads\opengl_setup\Externel_lib\glfw-3.4.bin.WIN32\glfw-3.4.bin.WIN32\include

# Source files
SRCS = $(SRC_DIR)/Window.cpp $(SRC_DIR)/Shader.cpp $(SRC_DIR)/Mesh.cpp $(SRC_DIR)/Camera_movement.cpp

# Object files (generated from the source files)
OBJS = $(SRCS:$(SRC_DIR)/%.cpp=$(BUILD_DIR)/%.o)

# Final output binary
TARGET = my_program

# Rule for creating the final executable
$(TARGET): $(OBJS)
	$(CXX) $(OBJS) -o $(TARGET) $(LIBS)

# Rule for compiling source files
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) $(INCLUDES)  $< -o $@

# Clean up
clean:
	rm -rf $(BUILD_DIR) $(TARGET)

.PHONY: clean
