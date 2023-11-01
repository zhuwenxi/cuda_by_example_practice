#include <iostream>
#include "book.h"

#define N 10

__global__ void add(int *a, int *b, int *c) {
  int tid = blockIdx.x;
  if (tid < N) {
    c[tid] = a[tid] + b[tid];
  }
}

__global__ void fill(int *a, int *b) {
  int tid = blockIdx.x;
  printf("tid: %d\n", tid); 
  if (tid < N) {
    a[tid] = -tid;
    b[tid] = tid * tid;
  }
}


int main() {
  int a[N], b[N], c[N];
  int *dev_a, *dev_b, *dev_c;

  // Allocate device memory.
  cudaMalloc((void **)&dev_a, N * sizeof(int));
  cudaMalloc((void **)&dev_b, N * sizeof(int));
  cudaMalloc((void **)&dev_c, N * sizeof(int));

  // Fill the array "a" and "b" on CPU.
  //for (int i = 0; i < N; ++ i) {
  //  a[i] = -i;
  //  b[i] = i * i;
  //}

  //cudaMemcpy(dev_a, a, N * sizeof(int), cudaMemcpyHostToDevice);
  //cudaMemcpy(dev_b, b, N * sizeof(int), cudaMemcpyHostToDevice);

  // Fill the array "a" and "b" on GPU.
  fill<<<N, 1>>>(dev_a, dev_b);
  cudaMemcpy(a, dev_a, N * sizeof(int), cudaMemcpyDeviceToHost);
  cudaMemcpy(b, dev_b, N * sizeof(int), cudaMemcpyDeviceToHost);

  add<<<N, 1>>> (dev_a, dev_b, dev_c);

  // Copy "c" back to CPU.
  cudaMemcpy(c, dev_c, N * sizeof(int), cudaMemcpyDeviceToHost);

  // Display the results.
  for (int i = 0; i < N; ++ i) {
    std::cout << a[i] << " + " << b[i] << " = " << c[i] << std::endl;
  }
  return 0;
}
