//
//  homePageSwiftViewController.m
//  ComponentKitDemo
//
//  Created by 董其林 on 2024/10/30.
//

#import "homePageSwiftViewController.h"
#import "ComponentKitDemo-Swift.h"
@import SwiftUI;
@interface homePageSwiftViewController ()

@end

@implementation homePageSwiftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    TestSwiftUIViewManage *TestSwiftUI = [[TestSwiftUIViewManage new] makeManageTestSwiftUIView];
    
    [self.navigationController pushViewController:TestSwiftUI animated:YES];
    
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
