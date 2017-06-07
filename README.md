# TextureLoader

Texture loader for [SpriteKit](https://developer.apple.com/spritekit/)   
Asynchronously cooks textures from bundle resources with source images.   
Designed for cases when you don't want to use standard load mechanism from assets-folder.

## Example

```objective-c
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


    /* load events */
   -(void)onAssetsBatchLoaded:(NSDictionary *)loadedAssets{
   
   }

   -(void) onAssetsLoadProgress: (CGFloat) assetsLoadProgress{
   
   }

```


[Download example project](https://github.com/monofire/TextureLoader/archive/master.zip)
