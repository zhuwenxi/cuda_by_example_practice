#include <iostream>
#include "book.h"

__global__ void add(int a, int b, int *c) {
  *c = a + b;
}

int main(void) {
  int c;
  int *dev_c;
  HANDLE_ERROR(cudaMalloc((void **)&dev_c, sizeof(int)));
  add<<<1, 1>>> (3, 4, dev_c);
  HANDLE_ERROR(cudaMemcpy(&c, dev_c, sizeof(int), cudaMemcpyDeviceToHost));
  std::cout << "3 + 4 = " << c  << std::endl;
  cudaFree(dev_c);
}
