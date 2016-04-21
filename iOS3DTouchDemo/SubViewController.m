//
//  SubViewController.m
//  iOS3DTouchDemo
//
//  Created by 123 on 16/4/21.
//  Copyright © 2016年 com.pureLake. All rights reserved.
//

#import "SubViewController.h"

@interface SubViewController ()

@end

@implementation SubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = _navTitle;
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    
}

#pragma mark -- preview override

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_9_0
- (NSArray <id <UIPreviewActionItem>> *)previewActionItems {
    NSMutableArray *arr = [NSMutableArray new];
    for (int i=0; i<3; i++) {
        UIPreviewAction *action = [UIPreviewAction actionWithTitle:[NSString stringWithFormat:@"Action_%d", i] style:i==2?UIPreviewActionStyleDestructive:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
            
            NSLog(@"-------->>>>>> %@", action.title);
        }];
        
        [arr addObject:action];
    }
    
    return arr;
}
#endif

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
