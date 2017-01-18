//
//  UIAlertController+showAlertOnMainThread.h
//  Socket Protocol
//
//  Created by 黄 庆超 on 2016/10/31.
//  Copyright © 2016年 com.hqc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^AlertBlock)(UIAlertController * _Nonnull alertController);

@interface UIAlertController (showAlertOnMainThread)

+(UIAlertController * _Nonnull)showHintAlertOnMainThreadWithMsg:(NSString * _Nonnull)msg;
+(UIAlertController * _Nonnull)showHintAlertOnMainThreadWithMsg:(NSString * _Nonnull)msg completion:(AlertBlock _Nullable)block;
+(UIAlertController * _Nonnull)showHintAlertOnMainThreadWithTitle:(NSString * _Nullable)title withMsg:(NSString * _Nonnull)msg completion:(AlertBlock _Nullable)block;


+(UIAlertController * _Nonnull)showHintAlertOnMainThreadWithMsg:(NSString * _Nonnull)msg withTextFieldNum:(NSUInteger)num completion:(AlertBlock _Nonnull)block;
+(UIAlertController * _Nonnull)showHintAlertOnMainThreadWithTitle:(NSString * _Nullable)title withMsg:(NSString * _Nonnull)msg withTextFieldNum:(NSUInteger)num completion:(AlertBlock _Nonnull)block;

@end
