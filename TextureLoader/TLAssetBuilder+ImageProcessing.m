//
//  TLAssetBuilder+ImageProcessing.m
//  TextureLoader
//
//  Created by ax on 2/19/17.
//  Copyright © 2017 Alexey Kushnir. All rights reserved.
//

#import "TLAssetBuilder+ImageProcessing.h"

@implementation TLAssetBuilder (ImageProcessing)

#pragma mark -
#pragma mark - Image size tools
-(CGSize) imagePixelSize: (UIImage*) image{
    CGImageRef ref = image.CGImage;
    return  CGSizeMake(CGImageGetWidth(ref), CGImageGetHeight(ref));
}


-(CGSize) screenPixelSize{
    CGRect screenRect = [UIScreen mainScreen].nativeBounds;
    CGSize screenResolution = CGSizeMake(screenRect.size.width, screenRect.size.height);
    return screenResolution;
}


-(CGSize) newImageSizeForImage: (UIImage *) image
              screenScaleRatio: (CGFloat) screenScaleRatio
               scaleVertically: (BOOL) scaleVertically {
    
    CGSize initialSize = [self imagePixelSize:image];
    CGSize screenPixelSize = [self screenPixelSize];
    CGFloat referentScreenSize = 0.0f;
    CGFloat imageAspect = 0.0f;
    CGSize  newImageSize = CGSizeZero;
    
    if (scaleVertically){
        referentScreenSize = screenPixelSize.height;
        imageAspect = initialSize.width / initialSize.height;
        newImageSize.height = referentScreenSize * screenScaleRatio;
        newImageSize.width =  newImageSize.height * imageAspect;
        
    } else {
        referentScreenSize = screenPixelSize.width;
        imageAspect = initialSize.height / initialSize.width;
        newImageSize.width = referentScreenSize * screenScaleRatio;
        newImageSize.height =  newImageSize.width * imageAspect;
    }
    
    //        NSLog(@"::: S: x=%.f y=%.f  F=%.1f  Init x=%.f y=%.f r=%.1f Res x=%.f y=%.f r=%.1f", screenPixelSize.width,screenPixelSize.height, screenScaleRatio, initialSize.width, initialSize.height, initialSize.width/initialSize.height, newImageSize.width,newImageSize.height, newImageSize.width/newImageSize.height);
    
    return newImageSize;
}


#pragma mark -
#pragma mark - Directory & file operations
-(NSArray *) fileNamesStoredInBundleDirectory: (NSString *) directoryPath{
    
    /* get path */
    NSString *bundleDirectoryPath = [[NSBundle mainBundle] bundlePath];
    NSString *path = [bundleDirectoryPath stringByAppendingPathComponent:directoryPath];
    
    /* get file list */
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *directoryScanError = nil;
    NSArray *fileNames = [fileManager contentsOfDirectoryAtPath:path error:&directoryScanError];
    if (directoryScanError)
        NSLog(@"::: ERROR! directoryScanError");
    
    /* filter filemlist - only .png files */
    NSPredicate *pngFilesPredicate = [NSPredicate predicateWithFormat:@"self ENDSWITH '.png'"];
    NSArray *onlyPNGs = [fileNames filteredArrayUsingPredicate:pngFilesPredicate];
    return onlyPNGs;
}



#pragma mark -
#pragma mark - Image creation
- (UIImage *)imageWithPathInsideTheBundle:(NSString *) pathInsideTheBundle{
    NSString *bundleDirectoryPath = [[NSBundle mainBundle] bundlePath];
    NSString *filePath = [bundleDirectoryPath stringByAppendingPathComponent:pathInsideTheBundle];
    UIImage *image = [UIImage imageWithContentsOfFile:filePath];
    return image;
}

#pragma mark -
#pragma mark - Image processing
- (UIImage *)imageByResizing:(UIImage *)imageToResize toSize:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    [imageToResize drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *resizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resizedImage;
}


- (UIImage *)imageByCropping:(UIImage *)imageToCrop toRect:(CGRect)rect {
    CGImageRef ref = CGImageCreateWithImageInRect(imageToCrop.CGImage, rect);
    UIImage *croppedImage = [UIImage imageWithCGImage: ref];
    CGImageRelease(ref);
    return croppedImage;
}


@end
