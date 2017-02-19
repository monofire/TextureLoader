//
//  TLAssetBuilder.h
//  TextureLoader
//
//  Created by ax on 2/18/17.
//  Copyright © 2017 Alexey Kushnir. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>


@class TLAssetBuilder;


@protocol TLAssetBuilderProtocol <NSObject>

-(void) onAssetItemProcessingCompletedByAssetBuilder: (TLAssetBuilder *) assetBuilder;

@end


typedef enum{
    SCREEN_HEIGHT,
    SCREEN_WIDTH,
    
}ScaleReference;


@interface TLAssetBuilder : NSObject

-(instancetype) initWithBundleFolder: (NSString *) bundleFolderPath /* NOTE: do not forget to add your "assetsFolder" to XCode navigator, using "create folder references "*/
                    screenScaleRatio: (CGFloat) screenScaleRatio
                                  of: (ScaleReference) scaleReference;

@property (nonatomic,weak) id <TLAssetBuilderProtocol> delegate;
@property (nonatomic) NSString* assetID;
@property (nonatomic) id asset;

-(void) buildAsset;

@end
