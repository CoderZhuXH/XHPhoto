//
//  ViewController.m
//  XHPhotoExample
//
//  Created by xiaohui on 16/6/6.
//  Copyright © 2016年 it7090.com. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHPhoto

#import "ViewController.h"
#import "UIViewController+XHPhoto.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"照片-相机/相册";
    
}

- (IBAction)photoAction:(UIButton *)sender {
    
    //使用系统UIActionSheet来选择打开相机、相册
    //edit:照片需要裁剪:传YES,不需要裁剪传NO(默认NO)
    [self showCanEdit:YES photo:^(UIImage *photo) {
        
        [sender setBackgroundImage:photo forState:UIControlStateNormal];
        
    }];
    
}
- (IBAction)cameraAction:(UIButton *)sender {
    
    //直接打开相机
    //edit:照片需要裁剪:传YES,不需要裁剪传NO(默认NO)
    [self showCameraCanEdit:YES photo:^(UIImage *photo) {
        
        [sender setBackgroundImage:photo forState:UIControlStateNormal];
    }];
}
- (IBAction)photoLibraryAction:(UIButton *)sender {
    
    //直接打开相册
    //edit:照片需要裁剪:传YES,不需要裁剪传NO(默认NO)
    [self showPhotoLibraryCanEdit:YES photo:^(UIImage *photo) {
        
        [sender setBackgroundImage:photo forState:UIControlStateNormal];
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
