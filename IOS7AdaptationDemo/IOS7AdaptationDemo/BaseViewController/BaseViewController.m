//
//  BaseViewController.m
//  XFTIOSClinet
//
//  Created by doujingxuan on 13-11-11.
//  Copyright (c) 2013年 doujingxuan. All rights reserved.
//

#import "BaseViewController.h"
#import "UINavigationItem+iOS7Spacing.h"


@interface BaseViewController ()

@end

@implementation BaseViewController
float OSVersion() {
    return [[[UIDevice currentDevice] systemVersion] floatValue];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)performBack:(id)sender
{
    if (self.navigationController.viewControllers.count < 2) {
        [self dismissViewControllerAnimated:YES completion:^(void){}];
    }else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    CGFloat navHeight = self.navigationController.navigationBar.frame.size.height;
    int osValue = OSVersion();
    if (osValue < 7) {
        self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height-navHeight);
    }
    else{
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.modalPresentationCapturesStatusBarAppearance = NO;
        
    }
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

@end
