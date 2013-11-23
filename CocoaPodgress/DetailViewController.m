//
//  DetailViewController.m
//  CocoaPodgress
//
//  Created by Matt Bowman on 11/6/13.
//  Copyright (c) 2013 Citrrus, LLC. All rights reserved.
//

#import "DetailViewController.h"
#import <BJRangeSliderWithProgress.h>
#import <BTProgressView.h>
#import <CERoundProgressView.h>
#import <CSColorizedProgressView.h>
#import <DACircularProgressView.h>
#import <DAProgressOverlayView.h>
#import <DCProgressView.h>
#import <DDProgressView.h>
#import <FFCircularProgressView.h>
#import <HKCircularProgressView.h>
#import <HTProgressHUD.h>
#import <HTProgressHUDIndicatorView.h>
#import <HTProgressHUDFadeZoomAnimation.h>
#import <JSProgressHUD.h>

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)configureView
{
    if (self.detailItem)
    {
        self.navigationItem.title = [self.detailItem description];
    }
}

- (void)loadProgress
{
    SEL progressSelector = NSSelectorFromString([self.detailItem description]);
    if ([self respondsToSelector:progressSelector])
    {
        [self performSelector:progressSelector];
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:@"Couldn't find example code for that pod."
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
        
        [alertView show];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)])
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }

    [self configureView];
}

- (void)viewDidAppear:(BOOL)animated
{
    [self loadProgress];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGRect)rectForIndex:(NSInteger)index outOf:(NSInteger)total
{
    CGFloat height = self.view.bounds.size.height - 64;
    return [self rectForIndex:index outOf:total withHeight:height/total];
}

- (CGRect)rectForIndex:(NSInteger)index outOf:(NSInteger)total withHeight:(CGFloat)viewHeight
{
    CGFloat height = self.view.bounds.size.height - 64;
    CGFloat padding = height * .05;
    CGRect rect = CGRectMake(self.view.bounds.origin.x + 20,
                             height/total * index + padding,
                             self.view.bounds.size.width - 40,
                             viewHeight - (padding * 2));
    
    NSLog(@"Frame: %@", NSStringFromCGRect(rect));
    return rect;
}

- (void)BJRangeSliderWithProgress
{
    BJRangeSliderWithProgress *slider;
    
    slider = [[BJRangeSliderWithProgress alloc] init];
    slider.minValue = 0;
    slider.maxValue = 100;
    slider.currentProgressValue = 50;
    slider.showThumbs = YES;
    slider.showProgress = YES;
    slider.showRange = YES;
    slider.frame = [self rectForIndex:0 outOf:3];
    [self.view addSubview:slider];

    slider = [[BJRangeSliderWithProgress alloc] init];
    slider.minValue = 0;
    slider.maxValue = 100;
    slider.currentProgressValue = 50;
    slider.leftValue = 0;
    slider.rightValue = 100;
    slider.showThumbs = NO;
    slider.showProgress = YES;
    slider.showRange = NO;
    slider.frame = [self rectForIndex:1 outOf:3];
    [self.view addSubview:slider];

    slider = [[BJRangeSliderWithProgress alloc] init];
    slider.minValue = 0;
    slider.maxValue = 100;
    slider.currentProgressValue = 50;
    slider.leftValue = 0;
    slider.rightValue = 100;
    slider.showThumbs = NO;
    slider.showProgress = YES;
    slider.showRange = YES;
    slider.frame = [self rectForIndex:2 outOf:3];
    [self.view addSubview:slider];

}

- (void)BTProgressView
{
    BTProgressView *view;

    view = [[BTProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleBar];
    view.progress = .5f;
    view.bgImage = @"bgimage_grey.png";
    view.fillImage = @"fillimage_blue.png";
    view.frame = [self rectForIndex:0 outOf:2 withHeight:40];
    [self.view addSubview:view];

    view = [[BTProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleBar];
    view.progress = .5f;
    view.bgImage = @"fancy_back.png";
    view.fillImage = @"fancy_fill.png";
    view.frame = [self rectForIndex:1 outOf:2 withHeight:40];
    [self.view addSubview:view];
}

- (void)CERoundProgressView
{
    CERoundProgressView *view;
    
    view = [[CERoundProgressView alloc] init];
    [view setProgress:.4 animated:YES];
    view.startAngle = -M_PI/2;
    view.tintColor = [UIColor blueColor];
    view.trackColor = [UIColor lightGrayColor];
    view.frame = [self rectForIndex:0 outOf:1];
    view.animationDuration = 2.0f;
    [self.view addSubview:view];
}

- (void)CSColorizedProgressView
{
    CSColorizedProgressView *view;
    
    view = [[CSColorizedProgressView alloc] initWithImage:[UIImage imageNamed:@"ash-28.jpg"]];
    view.totalAnimationDuration = 5.0f;
    [view sizeToFit];
    view.frame = [self rectForIndex:0 outOf:1];
    [self.view addSubview:view];
    [view setProgress:.75 animated:YES];

    view = [[CSColorizedProgressView alloc] initWithImage:[UIImage imageNamed:@"ash-28.jpg"]];
    view.totalAnimationDuration = 5.0f;
    view.direction = CSColorizedProgressViewDirectionLeftToRight;
    [view sizeToFit];
    view.frame = [self rectForIndex:1 outOf:2];
    [self.view addSubview:view];
    [view setProgress:.75 animated:YES];
}

- (void)DACircularProgress
{
    DACircularProgressView *view;
    view = [[DACircularProgressView alloc] initWithFrame:[self rectForIndex:0 outOf:2]];
    view.trackTintColor = [UIColor grayColor];
    view.progressTintColor = [UIColor blueColor];
    view.roundedCorners = 0;
    view.indeterminate = 0;
    view.indeterminateDuration = 0;
    [view setProgress:.6 animated:YES];
    [self.view addSubview:view];

    view = [[DACircularProgressView alloc] initWithFrame:[self rectForIndex:1 outOf:2]];
    view.trackTintColor = [UIColor purpleColor];
    view.progressTintColor = [UIColor greenColor];
    view.roundedCorners = 0;
    view.thicknessRatio = .1;
    view.indeterminate = 1;
    view.indeterminateDuration = 0;
    [self.view addSubview:view];
}

- (void)DAProgressOverlayView
{
    UIImageView *iv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ash-28.jpg"]];
    iv.frame = CGRectMake(50, 100, 220, 220);
    iv.contentMode = UIViewContentModeScaleAspectFill;
    iv.clipsToBounds = YES;
    iv.layer.cornerRadius = 10.0;
    DAProgressOverlayView *view;
    view = [[DAProgressOverlayView alloc] init];
    view.frame = iv.bounds;
    [iv addSubview:view];
    [self.view addSubview:iv];
    [self performSelector:@selector(DAProgressOverlayViewProgress:) withObject:view afterDelay:.01];
}

- (void)DAProgressOverlayViewProgress:(DAProgressOverlayView *)view
{
    view.progress += .005;
    if (view.progress >= 1.0)
    {
        [view displayOperationDidFinishAnimation];
    }
    else
    {
        [self performSelector:@selector(DAProgressOverlayViewProgress:) withObject:view afterDelay:.01];
    }
}

- (void)DCProgressView
{
    DCProgressView *view;
    
    view = [[DCProgressView alloc] initWithFrame:[self rectForIndex:0 outOf:1 withHeight:20.0]];
    view.fillColor = [UIColor blueColor];
    view.tintColor = [UIColor grayColor];
    view.borderWidth = 1.0;
    view.borderColor = [UIColor blackColor];
    view.rounding = 8.0;
    view.corners = UIRectCornerAllCorners;
    [view setProgress:.25 animated:YES];
    [self.view addSubview:view];
    
    
    view = [[DCProgressView alloc] initWithFrame:[self rectForIndex:1 outOf:3 withHeight:10.0]];
    view.fillColor = [UIColor greenColor];
    view.tintColor = [UIColor grayColor];
    view.borderWidth = 1.0;
    view.borderColor = [UIColor blackColor];
    view.rounding = 5.0;
    view.corners = UIRectCornerAllCorners;
    [view setProgress:.50 animated:YES];
    [self.view addSubview:view];

    view = [[DCProgressView alloc] initWithFrame:[self rectForIndex:2 outOf:3 withHeight:30.0]];
    view.fillColor = [UIColor yellowColor];
    view.tintColor = [UIColor blackColor];
    view.borderWidth = 1.0;
    view.borderColor = [UIColor blackColor];
    [view setProgress:.75 animated:YES];
    [self.view addSubview:view];
    
}

- (void)DDProgressView
{
    DDProgressView *view;
    view = [[DDProgressView alloc] initWithFrame:[self rectForIndex:0 outOf:1 withHeight:20]];
    view.innerColor = [UIColor blueColor];
    view.outerColor = [UIColor blackColor];
    view.emptyColor = [UIColor grayColor];
    view.progress = .75;
    [self.view addSubview:view];
}

- (void)FFCircularProgressView
{
    FFCircularProgressView *view;

    view = [[FFCircularProgressView alloc] initWithFrame:[self rectForIndex:0 outOf:3]];
    view.frame = CGRectMake(140, view.frame.origin.y, 40, view.frame.size.height);
    view.progress = 0;
    view.lineWidth = 1.0f;
    [self.view addSubview:view];
    [self performSelector:@selector(FFCircularProgressViewProgress:) withObject:view afterDelay:.01];

    view = [[FFCircularProgressView alloc] initWithFrame:[self rectForIndex:1 outOf:3]];
    view.frame = CGRectMake(140, view.frame.origin.y, 40, view.frame.size.height);
    view.lineWidth = 1.5f;
    [self.view addSubview:view];

    view = [[FFCircularProgressView alloc] initWithFrame:[self rectForIndex:2 outOf:3]];
    view.frame = CGRectMake(140, view.frame.origin.y, 40, view.frame.size.height);
    view.lineWidth = 2.0f;
    [view startSpinProgressBackgroundLayer];
    [self.view addSubview:view];

}

- (void)FFCircularProgressViewProgress:(FFCircularProgressView *)view
{
    view.progress += .005;
    if (view.progress < 1.0)
    {
        [self performSelector:@selector(FFCircularProgressViewProgress:) withObject:view afterDelay:.01];
    }
}

- (void)HKCircularProgressView
{
    HKCircularProgressView *view;
    view = [[HKCircularProgressView alloc] initWithFrame:[self rectForIndex:0 outOf:3]];
    view.progressTintColor = [UIColor cyanColor];
    view.max = 1.0f;
    view.fillRadius = 25;
    view.step = 0.1f;
    view.startAngle = (M_PI * 3) * 0.5;
    view.translatesAutoresizingMaskIntoConstraints = NO;
    view.outlineWidth = 1;
    view.outlineTintColor = [UIColor blackColor];
    view.endPoint = [[HKCircularProgressEndPointSpike alloc] init];
    view.animationDuration = 5;
    [view setCurrent:.75f animated:YES];
    [self.view addSubview:view];
    
    view = [[HKCircularProgressView alloc] initWithFrame:[self rectForIndex:1 outOf:3]];
    view.animationDuration = 5.0f;
    view.fillRadius = 25;
    view.progressTintColor = [UIColor magentaColor];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    view.endPoint = [[HKCircularProgressEndPointRound alloc] init];
    view.animationDuration = 5;
    [view setCurrent:.6f animated:YES];
    [self.view addSubview:view];
    
    view = [[HKCircularProgressView alloc] initWithFrame:[self rectForIndex:2 outOf:3]];
    view.fillRadius = 1;
    view.progressTintColor = [UIColor yellowColor];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    view.animationDuration = 5;
    [view setCurrent:.9f animated:YES];
    [self.view addSubview:view];
    
}

- (void) HTProgressHUD
{
    UIView *view;
    HTProgressHUD *hud;
    view = [[UIView alloc] initWithFrame:[self rectForIndex:0 outOf:4]];
    hud = [[HTProgressHUD alloc] init];
    [self.view addSubview:view];
    [hud showInView:view];

    view = [[UIView alloc] initWithFrame:[self rectForIndex:1 outOf:4]];
    hud = [[HTProgressHUD alloc] init];
    hud.indicatorView = [HTProgressHUDIndicatorView indicatorViewWithType:HTProgressHUDIndicatorTypePie];
    [self.view addSubview:view];
    [hud showWithAnimation:YES inView:view whileExecutingBlock:^{
        float r = 0.01;
        for (int i = 0; i <= 1 / 0.001; i++) {
            hud.progress = i * r;
            [NSThread sleepForTimeInterval:r];
        }
    }];

    view = [[UIView alloc] initWithFrame:[self rectForIndex:2 outOf:4]];
    hud = [[HTProgressHUD alloc] init];
    hud.text = @"Some custom text...";
    [self.view addSubview:view];
    [hud showInView:view];
    
    view = [[UIView alloc] initWithFrame:[self rectForIndex:3 outOf:4]];
    hud = [[HTProgressHUD alloc] init];
    hud.indicatorView = [HTProgressHUDIndicatorView indicatorViewWithType:HTProgressHUDIndicatorTypeRing];
    hud.animation = [HTProgressHUDFadeZoomAnimation animation];
    hud.text = @"Downloading...";
    [hud showWithAnimation:YES inView:view whileExecutingBlock:^{
        float r = 0.01;
        for (int i = 0; i <= 1 / 0.001; i++) {
            hud.progress = i * r;
            [NSThread sleepForTimeInterval:r];
        }
    }];
    [self.view addSubview:view];
    [hud showInView:view];
}


- (void) JSProgressHUD
{
    UIView *view;
    JSProgressHUD *progress;
    
    view = [[UIView alloc] initWithFrame:[self rectForIndex:-2 outOf:4]];
    progress = [JSProgressHUD progressViewInView:view];
    [progress showWithStatus:@"Loading stuff..."];
    [self.view addSubview:view];

    view = [[UIView alloc] initWithFrame:[self rectForIndex:-1 outOf:4]];
    progress = [JSProgressHUD progressViewInView:view];
    [progress showWithMaskType:JSProgressHUDMaskTypeNone];
    [self.view addSubview:view];
    
    view = [[UIView alloc] initWithFrame:[self rectForIndex:0 outOf:4]];
    progress = [JSProgressHUD progressViewInView:view];
    [progress showWithStatus:@"Another status..." maskType:JSProgressHUDMaskTypeNone];
    [self.view addSubview:view];
    
    view = [[UIView alloc] initWithFrame:[self rectForIndex:1 outOf:4]];
    progress = [JSProgressHUD progressViewInView:view];
    [progress showWithStatus:@"Yet another..." maskType:JSProgressHUDMaskTypeNone];
    [self.view addSubview:view];
}

@end
