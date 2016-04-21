//
//  ViewController.m
//  iOS3DTouchDemo
//
//  Created by 123 on 16/4/21.
//  Copyright © 2016年 com.pureLake. All rights reserved.
//

#import "ViewController.h"
#include "SubViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, UIViewControllerPreviewingDelegate>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"3DTouch Demo";
    
    // Do any additional setup after loading the view, typically from a nib.
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:_tableView];
    
    [self registerPreview];
}


- (void)registerPreview {
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 9.0) {
        
        if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
            [self registerForPreviewingWithDelegate:self sourceView:_tableView];
        }
    }
}



#pragma mark -- tableview delegate, datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.0;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.0;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cellid";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Cell_00%d", (int)indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [_tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        return;
    }
    
    SubViewController *svc = [[SubViewController alloc] init];
    svc.navTitle = cell.textLabel.text;
    
    [self.navigationController pushViewController:svc animated:YES];
}




#pragma mark -- preview delegate

- (UIViewController*)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location {
    
    NSIndexPath *indexPath = [_tableView indexPathForRowAtPoint:location];
    UITableViewCell *cell = [_tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        return nil;
    }
    
    SubViewController *svc = [[SubViewController alloc] init];
    svc.navTitle = cell.textLabel.text;
    svc.preferredContentSize = CGSizeMake(0, 0);
    
    previewingContext.sourceRect = cell.frame;
    
    return svc;
}

- (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit {

    [self.navigationController pushViewController:viewControllerToCommit animated:YES];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
