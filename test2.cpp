
#include <opencv2/opencv.hpp>

using namespace cv;

int main(int argc, char** argv )
{
  Mat leftRGB,rightRGB;
  Mat left,right,depth;
  leftRGB  = imread( "img1.png", 1 );
  rightRGB = imread( "img2.png", 1 );
  
  if ( (!leftRGB.data) || (!rightRGB.data) )
  {
    printf("No image data \n");
    return -1;
  }

  cv::cvtColor(leftRGB,  left,  cv::COLOR_BGR2GRAY);
  cv::cvtColor(rightRGB, right, cv::COLOR_BGR2GRAY);
  
  Ptr<StereoBM> stereo = cv::StereoBM::create( 800 /* numDisparities */,25 /* block size */ );
  stereo->compute( left, right, depth );

  Mat depth8;
  //depth.convertTo( depth8, CV_8UC1, 0.25 / 16.0 , 0.0 );
  //depth.convertTo( depth8, CV_8UC1, (1.0/ 16.0) * 16.0  , -5864 );
  depth.convertTo( depth8, CV_8UC1, (1.0/ 16.0) * 8.0  , -2850.0 );

  imwrite("depth.png", depth8 );

#if 0
  namedWindow("left", 1 );
  imshow("left", left);
  
  namedWindow("right", 1 );
  imshow("right", right);
  
  namedWindow("depth", 0 );
  imshow("depth", depth8 );
  
  waitKey(0);
#endif
  
  return 0;
}
