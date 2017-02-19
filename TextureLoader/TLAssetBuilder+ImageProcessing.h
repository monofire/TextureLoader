//
//  TLAssetBuilder+ImageProcessing.h
//  TextureLoader
//
//  Created by ax on 2/19/17.
//  Copyright © 2017 Alexey Kushnir. All rights reserved.
//

#import "TLAssetBuilder.h"

@interface TLAssetBuilder (ImageProcessing)

-(NSArray *) fileNamesStoredInBundleDirectory: (NSString *) directoryPath;

-(UIImage *)imageWithPathInsideTheBundle:(NSString *) pathInsideTheBundle;

-(CGSize) newImageSizeForImage: (UIImage *) image
              screenScaleRatio: (CGFloat) screenScaleRatio
                            of: (ScaleReference) scaleReference;

-(UIImage *)imageByCropping:(UIImage *)imageToCrop toRect:(CGRect)rect;
-(UIImage *)imageByResizing:(UIImage *)imageToResize toSize:(CGSize)size;

@end
