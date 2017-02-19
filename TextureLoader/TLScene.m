//
//  TLScene.m
//  TextureLoader
//
//  Created by ax on 2/18/17.
//  Copyright © 2017 Alexey Kushnir. All rights reserved.
//

#import "TLScene.h"
#import "TLLoadDirector.h"
#import "TLTexturesAssetBuilder.h"
#import "TLTextureAtlasAssetBuilder.h"

@interface TLScene () <TLLoadDirectorProtocol>

@end

@implementation TLScene

#pragma mark -
#pragma mark - Init
- (instancetype) initWithParentViewSize: (CGSize) parentViewSize {
    
    self = [super initWithSize:parentViewSize];
    if (self) {
        
    }
    return self;
}


#pragma mark -
#pragma mark - Scene lifecycle
-(void)didMoveToView:(SKView *)view{
    [self loadAssets];
}



#pragma mark -
#pragma mark - Load assets
-(void) loadAssets{
    
    /* create load director */
    TLLoadDirector *loadDirector = [[TLLoadDirector alloc]initWithDelegate:self];
    
    
    /* Create and set assets builders: */
    
    /* Single textures collection example:
     get images from "assetsFolder/bolders" folder, scale down to 0.1 relative to screen height and create texture from each file */
    TLTexturesAssetBuilder *texturesAssetBuilder = [[TLTexturesAssetBuilder alloc]initWithBundleFolder:@"assetsFolder/bolders"
                                                                                      screenScaleRatio:0.1f
                                                                                                    of:SCREEN_HEIGHT];
    /* Texture atlas example:
     get images from "assetsFolder/planets" folder, scale up to 1.2 relative to screen width and create texture atlas */
    TLTextureAtlasAssetBuilder *textureAtlasAssetBuilder = [[TLTextureAtlasAssetBuilder alloc]initWithBundleFolder:@"assetsFolder/planets"
                                                                                                  screenScaleRatio:1.2f
                                                                                                                of:SCREEN_WIDTH];
    
    /* Another texture atlas example:
     get images from "assetsFolder/ships" folder, scale down to 0.4 relative to screen height and create texture atlas */
    TLTextureAtlasAssetBuilder *textureAtlasAssetBuilderB = [[TLTextureAtlasAssetBuilder alloc]initWithBundleFolder:@"assetsFolder/ships"
                                                                                                   screenScaleRatio:0.4f
                                                                                                                 of:SCREEN_HEIGHT];
    
    /* load assets batch async */
    [loadDirector startLoadProcessWithAssetBuildersBatch:@[texturesAssetBuilder,textureAtlasAssetBuilder,textureAtlasAssetBuilderB]];
}



#pragma mark -
#pragma mark - AssetsDirector callbacks landing
-(void)onAssetsBatchLoaded:(NSDictionary *)loadedAssets{
    NSLog(@"::: onAssetsBatchLoaded %@", loadedAssets.description);
}

/* use to track load progress */
-(void) onAssetsLoadProgress: (CGFloat) assetsLoadProgress{
    NSLog(@"::: onAssetsLoadProgress %.1f%%",assetsLoadProgress);
}

@end
