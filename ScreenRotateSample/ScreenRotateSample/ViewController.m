//
//  ViewController.m
//  ScreenRotateSample
//
//  Created by Aaron Wang on 5/26/15.
//  Copyright (c) 2015 Aaron Wang. All rights reserved.
//

#import "ViewController.h"
#import "LandscapeViewController.h"

#define deg2rad (M_PI/180.0)

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LandscapeViewController *lvc = [[UIStoryboard storyboardWithName:@"LandscapeStoryboard" bundle:NULL] instantiateViewControllerWithIdentifier:@"LandscapeViewController"];
    self.mainLandscapeView = lvc.view;
    self.mainPortraitView = self.view;
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAllButUpsideDown;
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        self.view = self.mainLandscapeView;
        self.view.transform = CGAffineTransformMakeRotation(deg2rad * (90));
        self.view.bounds = CGRectMake(0.0, 0.0, 560, 320.0);
    } else if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
        self.view = self.mainLandscapeView;
        self.view.transform = CGAffineTransformMakeRotation(deg2rad * (-90));
        self.view.bounds = CGRectMake(0.0, 0.0, 560, 320.0);
    } else {
        self.view = self.mainPortraitView;
        self.view.transform = CGAffineTransformMakeRotation(deg2rad * (0));
        self.view.bounds = CGRectMake(0.0, 0.0, 320, 560);
    }
    
    [super willAnimateRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
