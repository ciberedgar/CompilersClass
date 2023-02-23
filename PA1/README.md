# README file for Programming Assignment 1

## Your directory should now contain the following files:
- `build.xml` contains targets for compiling and testing your program. DO NOT MODIFY.
- `runmips.py` is a script to run a mips assembly file on the MARS mips emulator. DO NOT MODIFY.
- `coolc.py` is a script to drive the compiler. DO NOT MODIFY.
- `coolc.jar` is a jar file containing a coolc compiler reference implementation and the MARS mips emulator. DO NOT MODIFY.
- `trap_handler.mars` is a trap handler implementation required by the MART mips emulator. DO NOT MODIFY.
- `README` contains this info. Part of the assignment is to answer the questions at the end of this README file. Just edit this file.
- `atoi.cl` is an implementation in Cool of the string to integer conversion function known from the C language.
- `stack.cl` is the skeleton file which you should fill in with your program.
- `stack.test` is a short test input to the stack machine. It is run through your program when you hand it in, and the output is also handed in.
- `PA1.pdf` is the specficiation of the first programming assignment. Please read it carefully.
- `cool-manual.pdf` is the specification of the cool language syntax and semantics. Please read it carefully.

## System Requirements

If you want to use your own system for the development, you will need to install following programs before starting the assignment:

- JDK version 1.7 (Java 7 Development Kit)
- Apache Ant 1.7 (or newer)
- Python 2.7

After installing a package, please put the path to the bin folder of the installed package in your PATH variable. I.e., "java", "ant", and "python" commands should run without the exact path to the corresponding bin folder. You also need to set "JAVA_HOME" and "ANT_HOME" environment variables. 

## Instructions

To compile the program, type
```
> python coolc.py stack.cl atoi.cl
```
And to run the program, type
```
> % python runmips.py stack.s
```
Instructions for turning in the assignment are given in the handout.

GOOD LUCK!

## Questions on PA1

1. **Describe your implementation of the stack machine in a single short paragraph.**
I created a Stack object that has basic methods such as Push, Pop, Peek, etc. With this i solve the problem with the different commands on the main class.

2. **List 3 things that you like about the Cool programming language.**
- I would say it is very *Cool* 😏 (No pun intended)
- Easy to learn.
- Classes are very similar to other languages.
3. **List 3 things you DON'T like about Cool.**
- There's nothing implemented, evrything must be made from scratch. But that's the point of this course! I think...? 
- Syntax is weird.
- The block structure is very confusing.