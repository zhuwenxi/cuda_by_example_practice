INCLUDE = ../common/


vector_add: vector_add.cu
	nvcc -I${INCLUDE} -o $@.bin $<
query_device: query_device.cu
	nvcc -I${INCLUDE} -o $@.bin $<
choose_device: choose_device.cu
	nvcc -I${INCLUDE} -o $@.bin $<
clean:
	rm -rf *.bin
