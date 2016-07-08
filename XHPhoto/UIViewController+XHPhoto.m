//
//  UIViewController+XHPhoto.m

//  XHPhotoExample
//
//  Created by xiaohui on 16/6/6.
//  Copyright © 2016年 qiantou. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHPhoto

#import "UIViewController+XHPhoto.h"
#import "objc/runtime.h"
#import <AssetsLibrary/ALAssetsLibrary.h>

#ifdef DEBUG
#define debugLog(...)    NSLog(__VA_ARGS__)
#else
#define debugLog(...)
#endif

static  BOOL canEdit = NO;
static  char blockKey;

@interface UIViewController()<UIActionSheetDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate,UIAlertViewDelegate>

@property (nonatomic,copy)photoBlock photoBlock;

@end

@implementation UIViewController (XHPhoto)

#pragma mark-set
-(void)setPhotoBlock:(photoBlock)photoBlock
{
    objc_setAssociatedObject(self, &blockKey, photoBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark-get
- (photoBlock )photoBlock
{
    return objc_getAssociatedObject(self, &blockKey);
}
-(void)showCanEdit:(BOOL)edit photo:(photoBlock)block
{
    if(edit) canEdit = edit;
    
    self.photoBlock = [block copy];
    UIActionSheet *sheet  = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照", @"相册中获取", nil];
    sheet.tag = 2599;
    [sheet showInView:self.view];
    
}
#pragma mark - action sheet delegte
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (actionSheet.tag==2599)
    {
        //权限
        ALAuthorizationStatus author = [ALAssetsLibrary authorizationStatus];
        if (author == ALAuthorizationStatusRestricted || author ==ALAuthorizationStatusDenied) {
            NSString *photoType = buttonIndex==0?@"相机":@"相册";
            NSString * title = [NSString stringWithFormat:@"%@权限未开启",photoType];
            NSString * msg = [NSString stringWithFormat:@"请在系统设置中开启该应用%@服务\n(设置->隐私->%@->开启)",photoType,photoType];
            NSString * cancelTitle = @"知道了";
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:msg delegate:self cancelButtonTitle:cancelTitle otherButtonTitles:nil, nil];
            [alertView show];
            debugLog(@"%@权限未开启",photoType);
            return;
        }
        //跳转到相机/相册页面
        UIImagePickerController* imagePickerController = [[UIImagePickerController alloc] init];
        imagePickerController.delegate = self;
        imagePickerController.allowsEditing = canEdit;
        switch (buttonIndex)
        {
            case 0:
                //拍照
                //是否支持相机
                if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
                {
                    imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
                    [self presentViewController:imagePickerController animated:YES completion:NULL];
                }
                else
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"该设备不支持相机" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                    [alert show];
                }
                break;
            case 1:
                //相册
                imagePickerController.sourceType =UIImagePickerControllerSourceTypePhotoLibrary;
                [self presentViewController:imagePickerController animated:YES completion:NULL];
            default:
                break;
        }
    }
}
#pragma mark - image picker delegte
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{}];
    
    UIImage *image;
    //是否要裁剪
    if ([picker allowsEditing]){
        
        //编辑之后的图像
        image = [info objectForKey:UIImagePickerControllerEditedImage];
        
    } else {
        
        image = [info objectForKey:UIImagePickerControllerOriginalImage];
    }
    
    if(self.photoBlock)
    {
        self.photoBlock(image);
    }
}
/*
 #pragma mark - UINavigationControllerDelegate
 - (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
 if ([navigationController isKindOfClass:[UIImagePickerController class]] &&
 ((UIImagePickerController *)navigationController).sourceType ==     UIImagePickerControllerSourceTypePhotoLibrary) {
 [[UIApplication sharedApplication] setStatusBarHidden:NO];
 
 [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
 }
 }
 */
@end
