//
//  TLLoadDirector.h
//  TextureLoader
//
//  Created by ax on 2/18/17.
//  Copyright © 2017 Alexey Kushnir. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol TLLoadDirectorProtocol <NSObject>

-(void) onAssetsBatchLoaded: (NSDictionary*) loadedAssetsBatch;

@optional
-(void) onAssetsLoadProgress: (CGFloat) assetsLoadProgress;

@end



@interface TLLoadDirector : NSObject

-(instancetype) initWithDelegate: (id <TLLoadDirectorProtocol>) delegate;
-(void) startLoadProcessWithAssetBuildersBatch: (NSArray*) assetBuildersBatch;

@end
