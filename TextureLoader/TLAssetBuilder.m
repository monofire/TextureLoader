//
//  TLAssetBuilder.m
//  TextureLoader
//
//  Created by ax on 2/18/17.
//  Copyright © 2017 Alexey Kushnir. All rights reserved.
//

#import "TLAssetBuilder.h"

@implementation TLAssetBuilder

#pragma mark -
#pragma mark - Init
-(instancetype) initWithBundleFolder: (NSString *) bundleFolderPath
                    screenScaleRatio: (CGFloat) screenScaleRatio
                     scaleVertically: (BOOL) scaleVertically{
    
    
    /* to be overridden in subclasses */
    self = [super init];
    if (self) {
        
    }
    return self;
    
}

#pragma mark -
#pragma mark - Building
-(void)buildAsset{
    /* to be overridden in subclasses */
}

@end
