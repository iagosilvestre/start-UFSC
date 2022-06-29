# the compiler: gcc for C program, define as g++ for C++
CC = g++ -I /opt/ros/noetic/include
# compiler flags:
#  -g    adds debugging information to the executable file
#  -Wall turns on most, but not all, compiler warnings
CFLAGS  =-static -O2

# the build target executable:
TARGET = detect_redPixel_image

all: $(TARGET)

$(TARGET): $(TARGET).cpp
	$(CC) $(CFLAGS) -o $(TARGET) $(TARGET).cpp

clean:
	$(RM) $(TARGET)
