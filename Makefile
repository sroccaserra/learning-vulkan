VULKAN_SDK ?= $(HOME)/Applications/vulkansdk-macos-1.1.126.0/macOS

CXX = clang++
CXXFLAGS = -g -std=c++17 -Wall -pedantic -I$(VULKAN_SDK)/include
LDFLAGS = -L$(VULKAN_SDK)/lib -lglfw -lvulkan

vulkan-app: main.o shaders/vert.spv shaders/frag.spv
	$(CXX) $(LDFLAGS) main.o -o vulkan-app

main.o: src/main.cpp
	$(CXX) $(CXXFLAGS) -c src/main.cpp

shaders/vert.spv: shaders/shader.vert
	glslc shaders/shader.vert -o shaders/vert.spv

shaders/frag.spv: shaders/shader.frag
	glslc shaders/shader.frag -o shaders/frag.spv

clean:
	rm -f *.o vulkan-app shaders/*.spv
