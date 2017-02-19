//
//  TLLoadDirector.m
//  TextureLoader
//
//  Created by ax on 2/18/17.
//  Copyright © 2017 Alexey Kushnir. All rights reserved.
//

#import "TLLoadDirector.h"
#import "TLAssetBuilder.h"

@interface TLLoadDirector() <TLAssetBuilderProtocol>

@end


@implementation TLLoadDirector{
    NSMutableArray *_inputAssetBuildersBatch;
    NSMutableDictionary *_processedAssetsBatch;
    dispatch_queue_t _assetProcessingConcurrentQueue;
    dispatch_group_t _assetProcessingGroup;
    NSInteger _amountOfAssetsToBeProcessed;
    
    __weak id <TLLoadDirectorProtocol> _delegate;
}


#pragma mark -
#pragma mark - Init
-(instancetype) initWithDelegate: (id <TLLoadDirectorProtocol>) delegate{
    
    self = [super init];
    if (self) {
        
        if (delegate)
            _delegate = delegate;
        
        _processedAssetsBatch = [[NSMutableDictionary alloc]init];
        _assetProcessingConcurrentQueue = dispatch_queue_create("_assetProcessingConcurrentQueue", DISPATCH_QUEUE_CONCURRENT);
        _assetProcessingGroup = dispatch_group_create();
        
    }
    return self;
}


#pragma mark -
#pragma mark - Load process
-(void) startLoadProcessWithAssetBuildersBatch: (NSArray*) assetBuildersBatch{
    
    /* prepare input and output collections */
    _inputAssetBuildersBatch = [NSMutableArray arrayWithArray:assetBuildersBatch];
    [_processedAssetsBatch removeAllObjects];
    
    /* set progress counter */
    _amountOfAssetsToBeProcessed = _inputAssetBuildersBatch.count;
    
    
    /* dispatch batch to processing */
    for (TLAssetBuilder *assetBuilder in _inputAssetBuildersBatch){
        dispatch_group_async(_assetProcessingGroup, _assetProcessingConcurrentQueue, ^{
            [assetBuilder setDelegate:self];
            [assetBuilder buildAsset];
        });
    }
    
    dispatch_group_notify(_assetProcessingGroup, _assetProcessingConcurrentQueue, ^{
        [self onBatchIsProcessed];
    });
}



#pragma mark -
#pragma mark - Asset Builder callbacks landing
-(void) onAssetItemProcessingCompletedByAssetBuilder: (TLAssetBuilder *) assetBuilder{
    
    /* add processed asset to output collection */
    [_processedAssetsBatch setObject:assetBuilder.asset forKey:assetBuilder.assetID];
    
    /* remove processed asset from input collection */
    [_inputAssetBuildersBatch removeObject:assetBuilder];
    
    /* notify delegate with new progress level */
    if (_delegate){
        if ([_delegate respondsToSelector:@selector(onAssetsLoadProgress:)]){
            CGFloat progress = (1.0f - (CGFloat)_inputAssetBuildersBatch.count / (CGFloat)_amountOfAssetsToBeProcessed) * 100.0f;
            dispatch_async(dispatch_get_main_queue(), ^{
                [_delegate onAssetsLoadProgress:progress];
            });
        }
    }
}



#pragma mark -
#pragma mark - Asset Processing Group callbacks landing
-(void) onBatchIsProcessed{
    
    /* notify delegate that batch load process is finished */
    dispatch_async(dispatch_get_main_queue(), ^{
        [_delegate onAssetsBatchLoaded:_processedAssetsBatch];
    });
}

@end
