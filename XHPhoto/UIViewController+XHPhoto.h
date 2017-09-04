//
//  UIViewController+XHPhoto.h

//  XHPhotoExample
//
//  Created by xiaohui on 16/6/6.
//  Copyright © 2016年 it7090.com. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHPhoto


/*
 
 注意:请在info.plist
 添加相册、相机权限
 Privacy - Photo Library Usage Description
 Privacy - Camera Usage Description
 
 */

#import <UIKit/UIKit.h>

typedef void(^photoBlock)(UIImage *photo);

@interface UIViewController (XHPhoto)

/**
 *  使用系统ActionSheet来选择打开相机、相册
 *
 *  @param edit  照片是否需要裁剪,默认NO
 *  @param block 照片回调
 */
-(void)showCanEdit:(BOOL)edit photo:(photoBlock)block;

/**
 直接打开图库
 
 @param edit 照片是否需要裁剪,默认NO
 @param block 照片回调
 */
-(void)showPhotoLibraryCanEdit:(BOOL)edit photo:(photoBlock)block;

/**
 直接打开相机
 
 @param edit 照片是否需要裁剪,默认NO
 @param block 照片回调
 */
-(void)showCameraCanEdit:(BOOL)edit photo:(photoBlock)block;

@end
