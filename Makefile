VULKAN_SDK ?= $(HOME)/Applications/vulkansdk-macos-1.1.126.0/macos

vulkan-app: main.o
	g++ main.o -o vulkan-app -rpath $(VULKAN_SDK)/Frameworks -F $(VULKAN_SDK)/Frameworks -framework vulkan -lglfw

main.o: src/main.cpp
	g++ -c src/main.cpp

clean:
	rm -f *.o vulkan-app
