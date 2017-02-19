//
//  TLAssetBuilder+TextureAtlasCreation.m
//  TextureLoader
//
//  Created by ax on 2/19/17.
//  Copyright © 2017 Alexey Kushnir. All rights reserved.
//

#import "TLAssetBuilder+TextureAtlasCreation.h"
#import "TLAssetBuilder+ImageProcessing.h"

@implementation TLAssetBuilder (TextureAtlasCreation)

-(SKTextureAtlas*) texturesAtlasByResizingImagesFromBundleFolder: (NSString *) bundleFolderPath
                                                screenScaleRatio: (CGFloat) screenScaleRatio
                                                 scaleVertically: (BOOL) scaleVertically{
    
    /* get images from bundle category */
    NSArray *imagesNames = [self fileNamesStoredInBundleDirectory:bundleFolderPath];
    
    NSMutableArray *resizedImages = [[NSMutableArray alloc] init];
    
    /* resize images */
    for (NSString *imageName in imagesNames){
        
        /* build path */
        NSString *imagePath = [bundleFolderPath stringByAppendingPathComponent:imageName];
        UIImage *image = [self imageWithPathInsideTheBundle:imagePath];
        
        /* resize */
        CGSize newSize = [self newImageSizeForImage:image screenScaleRatio:screenScaleRatio scaleVertically:scaleVertically];
        UIImage *resizedImage = [self imageByResizing:image toSize:newSize];
        
        [resizedImages addObject:resizedImage];
    }
    
    /* create texture Atlas */
    NSDictionary *resizedImagesWithNames = [NSDictionary dictionaryWithObjects:resizedImages forKeys:imagesNames];
    SKTextureAtlas *textureAtlas = [SKTextureAtlas atlasWithDictionary:resizedImagesWithNames];
    
    return textureAtlas;
}

@end
