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

1.3 Install LLVM 3.4:

sudo add 2 lines in /etc/apt/sources.list

        deb http://llvm.org/apt/trusty/ llvm-toolchain-trusty-3.4 main  
        deb-src http://llvm.org/apt/trusty/ llvm-toolchain-trusty-3.4 main

do these in command line

        wget -O - http://llvm.org/apt/llvm-snapshot.gpg.key|sudo apt-key add -
        sudo apt-get update
        sudo apt-get install clang-3.4 llvm-3.4 llvm-3.4-dev llvm-3.4-tools
        sudo ln -sf /usr/bin/llvm-config-3.4 /usr/bin/llvm-config

1.4 Build STP:
        
Go to the directory that you want to install the program
        
        git clone https://github.com/stp/stp.git
        mkdir stp/build
        cd stp/build
        cmake -DBUILD_SHARED_LIBS:BOOL=OFF -DENABLE_PYTHON_INTERFACE:BOOL=OFF ..
        make
        sudo make install
        cd ..
        ulimit -s unlimited

1.5 Build uclibc and the POSIX environment model:

Go to the directory that you want to install the program

        git clone https://github.com/klee/klee-uclibc.git
        cd klee-uclibc
        ./configure --make-llvm-lib
        make -j2
        cd ..

1.6 Build libgtest:

Go to the directory that you want to install the program

        curl -OL https://googletest.googlecode.com/files/gtest-1.7.0.zip
        unzip gtest-1.7.0.zip
        cd gtest-1.7.0
        cmake .
        make
        cd ..

1.7 Get KLEE source and build:

Go to the directory that you want to install the program

        git clone https://github.com/klee/klee.git
        cd klee
        mkdir build
        cd build
        ../configure --with-stp=/full/path/to/stp/build --with-uclibc=/full/path/to/klee-uclibc --enable-posix-runtime

Note: It should be that:

../configure --with-stp=/home/ubuntu/Developer/ProgramFiles/stp/build --with-uclibc=/home/ubuntu/Developer/ProgramFiles/klee-uclibc --enable-posix-runtime

        make DISABLE_ASSERTIONS=0 ENABLE_OPTIMIZED=1 ENABLE_SHARED=0 -j2
        vim ~/.bashrc
        alias klee='/home/ubuntu/Developer/ProgramFiles/klee/build/Release+Asserts/bin/klee'
        alias ktest-tool='/home/ubuntu/Developer/ProgramFiles/klee/build/Release+Asserts/bin/ktest-tool'    

### 2. Get the Frog_website code

Go to your Project directory

        git clone https://github.com/peidong/frog_website.git

### 3. Install Apache server

3.1 Install

        sudo apt-get install apache2
        
Go to browser to check http://localhost

3.2 Settings for Apache

        cd /etc/apache2/
        sudo vim apache2.conf

add these five lines at line 170

        <Directory /home/ubuntu/Developer/Projects/frog_website/>
	        Options Indexes FollowSymLinks
	        AllowOverride None
	        Require all granted
        </Directory>

![apache2.conf](https://raw.githubusercontent.com/peidong/frog_website/master/doc/photos/apache2.conf.png)

and change the first few lines in envvars

        sudo vim envvars

edit these

        export APACHE_RUN_USER=ubuntu
        export APACHE_RUN_GROUP=ubuntu

and add these lines at the end of the file [reference](http://askubuntu.com/questions/204159/add-path-to-path-environment-variable-for-www-data"<br />

        export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:(other paths like llvm-gcc path)
        export C_INCLUDE_PATH=/usr/include/x86_64-linux-gnu
        export CPLUS_INCLUDE_PATH=/usr/include/x86_64-linux-gnu 

Then change directory        

        cd sites-available/
        sudo cp 000-default.conf frog.conf 
        sudo vim frog.conf

change this lines

        ServerAdmin ubuntu@localhost
        DocumentRoot /home/ubuntu/Developer/Projects/frog_website

Then run the commands

        sudo a2dissite 000-default.conf
        sudo a2ensite frog.conf
        sudo service apache2 reload
        sudo service apache2 restart

Then go to browser to check http://localhost

### 4. Install MySQL

        sudo apt-get install mysql-server #don't input root passwd
        sudo mysql
        CREATE USER 'ubuntu'@'localhost';
        GRANT ALL PRIVILEGES ON *.* TO 'ubuntu'@'localhost';
        FLUSH PRIVILEGES;

settings

        cd ~/Developer/Projects/frog_website/server
        mysql < initialize.sql
        vim signup.php

change the content in the file

        $mysql_user='ubuntu';        

Then open the signup permission temperarily

        cd ..
        vim index.html

Delete the "hidden" word in line 70, so that it will be:

        <!-- User Signup -->
        <form class="form-inline" method="post" action="server/signup.php">        

make sure you need to add "hidden" once you have complete your work

![signup_hidden](https://raw.githubusercontent.com/peidong/frog_website/master/doc/photos/signup_hidden.png)

modify your login.php

        cd server
        vim login.php

change this line:

        $conn = mysql_connect('localhost', 'ubuntu', '');        


### 5. Install PHP

        #sudo apt-get install php5
        sudo apt-get install php5-mysql

### 6. Change llvm-gcc settings

        cd server
        vim compile.php

change these lines

define('COMPILE','clang-3.4 -emit-llvm -c -g '); 
define('KLEE_INCLUDE','/home/ubuntu/Developer/Projects/frog_website/tools/KLEE_SOURCE_2015/klee/include/klee ');

        cd ../Frog
        vim extract_functions2.py

at line 247, change to return 0;

        appendCode += "\treturn 0;\n"

### 7. Change Klee settings

        cd server
        vim run_klee.php

Change this line

        define('KLEE_EXECUTABLE', "/home/ubuntu/Developer/ProgramFiles/klee/build/Release+Asserts/bin/klee");
