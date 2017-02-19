//
//  TLAssetBuilder+TexturesCreation.m
//  TextureLoader
//
//  Created by ax on 2/19/17.
//  Copyright © 2017 Alexey Kushnir. All rights reserved.
//

#import "TLAssetBuilder+TexturesCreation.h"
#import "TLAssetBuilder+ImageProcessing.h"

@implementation TLAssetBuilder (TexturesCreation)

-(NSDictionary*) texturesWithNamesFromBundleFolder: (NSString *) bundleFolderPath
                                  screenScaleRatio: (CGFloat) screenScaleRatio
                                   scaleVertically: (BOOL) scaleVertically{
    
    /* get images from bundle category */
    NSArray *imagesNames = [self fileNamesStoredInBundleDirectory:bundleFolderPath];
    
    /* instantiate output dictionary */
    NSMutableDictionary *texturesWithNames = [[NSMutableDictionary alloc]init];
    
    /* resize images */
    for (NSString *imageName in imagesNames){
        
        /* build path */
        NSString *imagePath = [bundleFolderPath stringByAppendingPathComponent:imageName];
        UIImage *image = [self imageWithPathInsideTheBundle:imagePath];
        
        /* resize */
        CGSize newSize = [self newImageSizeForImage:image screenScaleRatio:screenScaleRatio scaleVertically:scaleVertically];
        UIImage *resizedImage = [self imageByResizing:image toSize:newSize];
        
        /* create texture */
        SKTexture *texture = [SKTexture textureWithImage:resizedImage];
        
        [texturesWithNames setObject:texture forKey:imageName];
    }
    
    return texturesWithNames;
    
}

@end
