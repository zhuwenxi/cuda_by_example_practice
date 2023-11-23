INCLUDE = ../common/


sum_arbitrarily_long_vector: sum_arbitrarily_long_vector.cu
	nvcc -I${INCLUDE} -o $@.bin $<
sum_longer_vector: sum_longer_vector.cu
	nvcc -I${INCLUDE} -o $@.bin $<
clean:
	rm -rf *.bin
