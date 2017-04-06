//
//  MainViewController.m
//  newListDraw
//
//  Created by mac on 2017/4/6.
//  Copyright © 2017年 szs. All rights reserved.
//

#import "MainViewController.h"
#import "SelectDrawViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    
    UIButton *selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    selectBtn.frame = CGRectMake(60, 200, 100, 30);
    [selectBtn setTitle:@"点击我" forState:UIControlStateNormal];
    [selectBtn addTarget:self action:@selector(nextpage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:selectBtn];
    
    
}

-(void)nextpage{
    SelectDrawViewController *selectVC = [[SelectDrawViewController alloc] init];
    [self.navigationController pushViewController:selectVC animated:YES];

}

@end
