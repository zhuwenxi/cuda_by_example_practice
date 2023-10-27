INCLUDE = ../common/


hello_world: hello_world.cu
	nvcc -I${INCLUDE} -o $@.bin $<
query_device: query_device.cu
	nvcc -I${INCLUDE} -o $@.bin $<
clean:
	rm -rf hello_world
