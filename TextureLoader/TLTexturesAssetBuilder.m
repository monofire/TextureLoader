//
//  TLTexturesAssetBuilder.m
//  TextureLoader
//
//  Created by ax on 2/19/17.
//  Copyright © 2017 Alexey Kushnir. All rights reserved.
//

#import "TLTexturesAssetBuilder.h"
#import "TLAssetBuilder+TexturesCreation.h"


/* Builds collection of single textures */

@implementation TLTexturesAssetBuilder{
    
    NSString *_bundleFolderPath;
    CGFloat _screenScaleRatio;
    ScaleReference _scaleReference;
}

#pragma mark -
#pragma mark - Init
-(instancetype) initWithBundleFolder: (NSString *) bundleFolderPath
                    screenScaleRatio: (CGFloat) screenScaleRatio
                                  of: (ScaleReference) scaleReference{
    
    self = [super init];
    if (self) {
        _bundleFolderPath = bundleFolderPath;
        _screenScaleRatio = screenScaleRatio;
        _scaleReference = scaleReference;
    }
    return self;
}


#pragma mark -
#pragma mark - Building
-(void)buildAsset{
    self.assetID = _bundleFolderPath;
    self.asset = [self texturesWithNamesFromBundleFolder:_bundleFolderPath
                                        screenScaleRatio:_screenScaleRatio
                                                      of:_scaleReference];
    
    [self.delegate onAssetItemProcessingCompletedByAssetBuilder:self];
}


@end
