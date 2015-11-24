//
//  HomeViewController.m
//  Test3Dtouch
//
//  Created by haoxiangfeng on 15/11/24.
//  Copyright © 2015年 artron. All rights reserved.
//

#import "HomeViewController.h"
#import "GuideViewController.h"
@interface HomeViewController ()<UIViewControllerPreviewingDelegate>

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
  
    [self test3Dtouch];
    
    
    
}

- (void)test3Dtouch
{

    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
        
        //if available, register for 3D Touch
        [self registerForPreviewingWithDelegate:(id)self sourceView:self.view];
        NSLog(@"available");
        
        
    } else {
        
        NSLog(@"no available");

        
    }

}

#pragma mark 3dtouch delegate
- (UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location
{
    //GuideViewController is popViewController
    if ([self.presentedViewController isKindOfClass:[GuideViewController class]]) {
        return nil;
    }
    
    GuideViewController *sec = [[GuideViewController alloc] init];
    
    return sec;
    
}

//当按压出现小屏的想进入的页面的时候，加大按压力度的就能进入全屏状态，相当于push
- (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit {
    
    // deep press:viewControllerToCommit is Full screen
    [self showViewController:viewControllerToCommit sender:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
