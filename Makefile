

all: depth.png


depth.png: test2
	./test2


test1: test1.cpp
	g++ -o test1  test1.cpp -lopencv_core -lopencv_imgproc -lopencv_imgcodecs -lopencv_highgui


test2: test2.cpp
	g++ -o test2  test2.cpp -lopencv_core -lopencv_imgproc -lopencv_imgcodecs -lopencv_highgui -lopencv_calib3d

