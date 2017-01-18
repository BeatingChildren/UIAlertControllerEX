//
//  ViewController.m
//  UIAlertControllerEX
//
//  Created by 黄 庆超 on 2017/1/18.
//  Copyright © 2017年 黄 庆超. All rights reserved.
//

#import "ViewController.h"
#import "UIAlertController+showAlertOnMainThread.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self performSelectorInBackground:@selector(showMsgTest) withObject:nil];
}

-(void)showMsgTest{
    [UIAlertController showHintAlertOnMainThreadWithMsg:@"嘿嘿嘿"];
    [UIAlertController showHintAlertOnMainThreadWithMsg:@"呵呵呵"];
    [UIAlertController showHintAlertOnMainThreadWithMsg:@"哈哈哈"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
