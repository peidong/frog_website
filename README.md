# frog_website
Frog Online Test Website
===============================

Features
---------------------------

Frog is a platform for automatic software testing. It helps to locate potential bugs by 3 simple steps

1. Upload source code, then test suites with will be generated and replayed automatically.

2. Specify test case replay result: Pass or Fail

3. Visualize potential bug locations in source code

Frog now supports C program testing.
URL: basil.ee.ucla.edu

Introductions for Installing Frog on Linux servers
----------------------------
### 1. Install Klee:
Follow this website to install Klee [Klee 3.4](http://klee.github.io/experimental/)<br />
You may have unknown issues when installing [Klee 2.9](http://klee.github.io/getting-started/)<br />
1.1 Install dependencies
    sudo apt-get install build-essential curl git bison flex bc libcap-dev git cmake libboost-all-dev libncurses5-dev python-minimal python-pip unzip
1.2 set environment variables in ~/.bashrc
    export C_INCLUDE_PATH=/usr/include/x86_64-linux-gnu
    export CPLUS_INCLUDE_PATH=/usr/include/x86_64-linux-gnu
1.3 Install LLVM 3.4
### 2. 
