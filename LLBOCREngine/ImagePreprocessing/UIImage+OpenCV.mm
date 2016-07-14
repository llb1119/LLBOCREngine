//
//  UIImage+OpenCV.mm
//
//  Created by liulb on 16/4/6.
//  Copyright © 2016年 liulibo. All rights reserved.
//

#import "UIImage+OpenCV.h"

@implementation UIImage (UIImage_OpenCV)

- (cv::Mat)CVMat {

  CGColorSpaceRef colorSpace = CGImageGetColorSpace(self.CGImage);
  CGFloat cols = self.size.width;
  CGFloat rows = self.size.height;

  cv::Mat cvMat(rows, cols, CV_8UC4); // 8 bits per component, 4 channels

  CGContextRef contextRef =
      CGBitmapContextCreate(cvMat.data,    // Pointer to backing data
                            cols,          // Width of bitmap
                            rows,          // Height of bitmap
                            8,             // Bits per component
                            cvMat.step[0], // Bytes per row
                            colorSpace,    // Colorspace
                            kCGImageAlphaNoneSkipLast |
                                kCGBitmapByteOrderDefault); // Bitmap info flags

  CGContextDrawImage(contextRef, CGRectMake(0, 0, cols, rows), self.CGImage);
  CGContextRelease(contextRef);

  return cvMat;
}

- (cv::Mat)CVGrayscaleMat {
  CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
  CGFloat cols = self.size.width;
  CGFloat rows = self.size.height;

  cv::Mat cvMat =
      cv::Mat(rows, cols, CV_8UC1); // 8 bits per component, 1 channel

  CGContextRef contextRef = CGBitmapContextCreate(
      cvMat.data,                                     // Pointer to backing data
      cols,                                           // Width of bitmap
      rows,                                           // Height of bitmap
      8,                                              // Bits per component
      cvMat.step[0],                                  // Bytes per row
      colorSpace,                                     // Colorspace
      kCGImageAlphaNone | kCGBitmapByteOrderDefault); // Bitmap info flags

  CGContextDrawImage(contextRef, CGRectMake(0, 0, cols, rows), self.CGImage);
  CGContextRelease(contextRef);
  CGColorSpaceRelease(colorSpace);

  return cvMat;
}

+ (UIImage *)imageWithCVMat:(const cv::Mat &)cvMat {
  return [[UIImage alloc] initWithCVMat:cvMat];
}

- (id)initWithCVMat:(const cv::Mat &)cvMat {
  NSData *data =
      [NSData dataWithBytes:cvMat.data length:cvMat.elemSize() * cvMat.total()];

  CGColorSpaceRef colorSpace;

  if (cvMat.elemSize() == 1) {
    colorSpace = CGColorSpaceCreateDeviceGray();
  } else {
    colorSpace = CGColorSpaceCreateDeviceRGB();
  }

  CGDataProviderRef provider =
      CGDataProviderCreateWithCFData((__bridge_retained CFDataRef)data);

  CGImageRef imageRef = CGImageCreate(
      cvMat.cols,                                    // Width
      cvMat.rows,                                    // Height
      8,                                             // Bits per component
      8 * cvMat.elemSize(),                          // Bits per pixel
      cvMat.step[0],                                 // Bytes per row
      colorSpace,                                    // Colorspace
      kCGImageAlphaNone | kCGBitmapByteOrderDefault, // Bitmap info flags
      provider,                                      // CGDataProviderRef
      NULL,                                          // Decode
      false,                                         // Should interpolate
      kCGRenderingIntentDefault);                    // Intent

  self = [self initWithCGImage:imageRef];
  CGImageRelease(imageRef);
  CGDataProviderRelease(provider);
  CGColorSpaceRelease(colorSpace);

  return self;
}

@end
