//
//  UIAlertController+showAlertOnMainThread.m
//  Socket Protocol
//
//  Created by 黄 庆超 on 2016/10/31.
//  Copyright © 2016年 com.hqc. All rights reserved.
//

#import "UIAlertController+showAlertOnMainThread.h"

@implementation UIAlertController (showAlertOnMainThread)

__weak  UIAlertController   *_alertController;

+(UIAlertController * _Nonnull)showHintAlertOnMainThreadWithMsg:(NSString *)msg{
    return [self showHintAlertOnMainThreadWithTitle:nil withMsg:msg completion:nil];
}

+(UIAlertController * _Nonnull)showHintAlertOnMainThreadWithMsg:(NSString *)msg completion:(AlertBlock)block{
    return [self showHintAlertOnMainThreadWithTitle:nil withMsg:msg completion:block];
}

+(UIAlertController * _Nonnull)showHintAlertOnMainThreadWithTitle:(NSString *)title withMsg:(NSString *)msg completion:(AlertBlock)block{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    if (title)  [param setObject:title forKey:@"title"];
    if (msg)    [param setObject:msg forKey:@"msg"];
    if (block)  [param setObject:block forKey:@"block"];
    
    [self performSelectorOnMainThread:@selector(showHintAlertWithParam:) withObject:param waitUntilDone:YES];
    
    return _alertController;
}

+(UIAlertController * _Nonnull)showHintAlertOnMainThreadWithMsg:(NSString *)msg withTextFieldNum:(NSUInteger)num completion:(AlertBlock)block{
    return [self showHintAlertOnMainThreadWithTitle:nil withMsg:msg withTextFieldNum:num completion:block];
}

+(UIAlertController * _Nonnull)showHintAlertOnMainThreadWithTitle:(NSString *)title withMsg:(NSString *)msg withTextFieldNum:(NSUInteger)num completion:(AlertBlock)block{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    if (title)  [param setObject:title forKey:@"title"];
    if (msg)    [param setObject:msg forKey:@"msg"];
    if (block)  [param setObject:block forKey:@"block"];
    [param setObject:@(num) forKey:@"num"];
    
    [self performSelectorOnMainThread:@selector(showHintAlertWithParam:) withObject:param waitUntilDone:YES];
    
    return _alertController;
}

+(void)showHintAlertWithParam:(NSDictionary *)param{
    NSString *title = nil;
    NSString *msg = nil;
    AlertBlock block = nil;
    NSUInteger num = 0;
    
    NSArray *keys = param.allKeys;
    if ([keys containsObject:@"title"]) title = param[@"title"];
    if ([keys containsObject:@"msg"])   msg = param[@"msg"];
    if ([keys containsObject:@"block"]) block = param[@"block"];
    if ([keys containsObject:@"num"])   num = [param[@"num"] unsignedIntegerValue];
    
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
    
    if (num) {
        for (NSUInteger i = 0; i < num; i++) {
            [alertController addTextFieldWithConfigurationHandler:nil];
        }
    }
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (block) {
            block(alertController);
        }
    }];
    [alertController addAction:okAction];
    
    _alertController = alertController;
    
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [window setRootViewController:[[UIViewController alloc] init]];
    window.windowLevel = UIWindowLevelAlert;
    [window makeKeyAndVisible];
    
    [window.rootViewController presentViewController:_alertController animated:YES completion:nil];
    
}

@end
