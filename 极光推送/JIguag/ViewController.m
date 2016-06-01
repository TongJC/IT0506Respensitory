//
//  ViewController.m
//  JIguag
//
//  Created by student on 16/5/25.
//  Copyright © 2016年 Tom. All rights reserved.
//

#import "ViewController.h"
#import "JPUSHService.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
    [defaultCenter addObserver:self
                      selector:@selector(networkDidSetup:)
                          name:kJPFNetworkDidSetupNotification
                        object:nil];
    [defaultCenter removeObserver:self
                             name:kJPFNetworkDidCloseNotification
                           object:nil];
    [defaultCenter removeObserver:self
                             name:kJPFNetworkDidRegisterNotification
                           object:nil];
    [defaultCenter removeObserver:self
                             name:kJPFNetworkDidLoginNotification
                           object:nil];
    [defaultCenter removeObserver:self
                             name:kJPFNetworkDidReceiveMessageNotification
                           object:nil];
    [defaultCenter removeObserver:self
                             name:kJPFServiceErrorNotification
                           object:nil];
    
    
}
- (void)networkDidSetup:(NSNotification*)userifon {
    
    NSLog(@"已连接");
    
}
- (void)networkDidClose:(NSNotification *)notification {
    NSLog(@"未连接");
}
- (void)networkDidRegister:(NSNotification *)notification {
    NSLog(@"%@", [notification userInfo]);
   
    NSLog(@"已注册");
}
- (void)networkDidLogin:(NSNotification *)notification {

    NSLog(@"已登录");
    
    if ([JPUSHService registrationID]) {
 
        NSLog(@"get RegistrationID");
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
