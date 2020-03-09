## Build with mingw-w64
1. install MSYS2
2. pacman -S mingw-w64-x86_64-gcc
### use cmake
```shell
mkdir build
cmake -G "MSYS Makefiles" ..
make -j
```

