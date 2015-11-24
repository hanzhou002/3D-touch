//
//  GuideViewController.m
//  Test3Dtouch
//
//  Created by haoxiangfeng on 15/11/24.
//  Copyright © 2015年 artron. All rights reserved.
//

#import "GuideViewController.h"

@interface GuideViewController ()

@end

@implementation GuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(popback)];
    [self.view addGestureRecognizer:tap];
    
   
}

- (void)popback{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSArray<id<UIPreviewActionItem>> *)previewActionItems {
    
    // setup a list of preview actions
    UIPreviewAction *action1 = [UIPreviewAction actionWithTitle:@"Action one" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"Action 1 was tapped");
    }];
    
    UIPreviewAction *action2 = [UIPreviewAction actionWithTitle:@"Action two" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"Action 2 was tapped");
    }];
    
    UIPreviewAction *action3 = [UIPreviewAction actionWithTitle:@"Action three" style:UIPreviewActionStyleSelected handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"Action 3 was tapped");
    }];
    
    // add them to an arrary
    NSArray *actions = @[action1, action2, action3];
    
    // add all actions to a group
    UIPreviewActionGroup *group1 = [UIPreviewActionGroup actionGroupWithTitle:@"ActionArray" style:UIPreviewActionStyleDefault actions:actions];
    NSArray *group = @[group1];
    
    return group;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
