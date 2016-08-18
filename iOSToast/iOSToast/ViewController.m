//
//  ViewController.m
//  iOSToast
//
//  Created by 王涛 on 16/8/18.
//  Copyright © 2016年 wata. All rights reserved.
//

#import "ViewController.h"
#import "ttToast.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showToast:(UIButton *)sender {
    [[[ttToast alloc] initWithMessage:@"loading..."] showAboveViewController:self];
}

@end
