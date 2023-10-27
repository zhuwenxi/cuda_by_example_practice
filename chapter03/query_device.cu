#include <iostream>
#include "book.h"

int main() {
  int count;
  HANDLE_ERROR(cudaGetDeviceCount(&count));
  
  cudaDeviceProp prop;
  for (int i = 0; i < count; ++ i) {
    HANDLE_ERROR(cudaGetDeviceProperties(&prop, i));
    std::cout << "--- Genernal information for device " << i << " ---" << std::endl;
    std::cout << "Name: " << prop.name << std::endl;
    std::cout << "Compute capability: " << prop.major << "." << prop.minor << std::endl;
    std::cout << "Clock rate: " << prop.clockRate << std::endl;
    std::cout << "Device copy overlap:" << prop.deviceOverlap << std::endl;
    std::cout << "Kernel execution timeout: " << prop.kernelExecTimeoutEnabled << std::endl;

    std::cout << "--- Memory information for device " << i << " ---" << std::endl;
    std::cout << "Total global mem: " << prop.totalGlobalMem << std::endl;
    std::cout << "Total constant mem: " << prop.totalConstMem << std::endl;
    std::cout << "Max mem pitch: " << prop.memPitch << std::endl;
    std::cout << "Texture Alignment: " << prop.textureAlignment << std::endl;

    std::cout << "--- MP Information for device " << i << " ---" << std::endl;
    std::cout << "Multiprocessor count: " << prop.multiProcessorCount << std::endl;
    std::cout << "Shared mem per mp: " << prop.sharedMemPerBlock << std::endl;
    std::cout << "Registers per mp: " << prop.regsPerBlock << std::endl;
    std::cout << "Threads in warp: " << prop.warpSize << std::endl;
    std::cout << "Max threads per block: " << prop.maxThreadsPerBlock << std::endl;
    std::cout << "Max thread dimensions: (" << prop.maxThreadsDim[0] << ", " << prop.maxThreadsDim[1] << ", " << prop.maxThreadsDim[2] << ")" << std::endl;
    std::cout << "Max grid dimensions: (" << prop.maxGridSize[0] << ", " << prop.maxGridSize[1] << ", " << prop.maxGridSize[2] << ")" << std::endl;
    break;
  }
}
