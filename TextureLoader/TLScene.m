//
//  TLScene.m
//  TextureLoader
//
//  Created by ax on 2/18/17.
//  Copyright © 2017 Alexey Kushnir. All rights reserved.
//

#import "TLScene.h"
#import "TLLoadDirector.h"

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
    
    /* single textures collection */

    
    /* texture atlas */

    
    /* load assets batch async */
   
}



#pragma mark -
#pragma mark - AssetsDirector callbacks landing
-(void)onAssetsBatchLoaded:(NSDictionary *)loadedAssets{
    NSLog(@"::: onAssetsBatchLoaded %@", loadedAssets.description);
}


-(void) onAssetsLoadProgress: (CGFloat) assetsLoadProgress{
    NSLog(@"::: onAssetsLoadProgress %.1f%%",assetsLoadProgress);
}

@end
