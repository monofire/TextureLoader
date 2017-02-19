//
//  TLTextureAtlasAssetBuilder.m
//  TextureLoader
//
//  Created by ax on 2/19/17.
//  Copyright © 2017 Alexey Kushnir. All rights reserved.
//

#import "TLTextureAtlasAssetBuilder.h"
#import "TLAssetBuilder+TextureAtlasCreation.h"

/* Builds Texture Atlas */

@implementation TLTextureAtlasAssetBuilder{
    
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
    self.asset = [self texturesAtlasByResizingImagesFromBundleFolder:_bundleFolderPath
                                                    screenScaleRatio:_screenScaleRatio
                                                                  of:_scaleReference];
    
    [self.delegate onAssetItemProcessingCompletedByAssetBuilder:self];
}

@end
