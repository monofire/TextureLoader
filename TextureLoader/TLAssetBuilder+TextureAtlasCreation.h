//
//  TLAssetBuilder+TextureAtlasCreation.h
//  TextureLoader
//
//  Created by ax on 2/19/17.
//  Copyright © 2017 Alexey Kushnir. All rights reserved.
//

#import "TLAssetBuilder.h"

@interface TLAssetBuilder (TextureAtlasCreation)

-(SKTextureAtlas*) texturesAtlasByResizingImagesFromBundleFolder: (NSString *) bundleFolderPath
                                                screenScaleRatio: (CGFloat) screenScaleRatio
                                                 scaleVertically: (BOOL) scaleVertically;
@end
