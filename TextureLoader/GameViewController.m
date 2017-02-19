//
//  GameViewController.m
//  TextureLoader
//
//  Created by ax on 2/18/17.
//  Copyright (c) 2017 Alexey Kushnir. All rights reserved.
//

#import "GameViewController.h"
#import "TLScene.h"

@implementation GameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    TLScene *scene = [[TLScene alloc]initWithParentViewSize:self.view.frame.size];
    
    /* Set the scale mode */
    scene.scaleMode = SKSceneScaleModeAspectFill;
    SKView *skView = (SKView *)self.view;
    
    /* Present the scene */
    [skView presentScene:scene transition:[SKTransition crossFadeWithDuration:0.5f]];
    
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
