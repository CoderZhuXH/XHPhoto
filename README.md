# XHPhoto
* 一行代码搞定照片选择,支持相册/相机及设置是否裁剪

### 技术交流群(群号:537476189).

## 效果
![image](http://c.hiphotos.baidu.com/image/pic/item/4afbfbedab64034fa246e436a7c379310a551d72.jpg)
## 使用方法
* 导入UIViewController+XHPhoto.h 头文件,在控制器中调用
```objc

    //edit:照片需要裁剪:传YES,不需要裁剪传NO(默认NO)
    [self showCanEdit:YES photo:^(UIImage *photo) {
        
    //TO TO...
        
    }];

```
## 注意

*	请在info.plist中添加
*	Privacy - Photo Library Usage Description
*	Privacy - Camera Usage Description

## Tips
*  将Info.plist   `Localization native development region`  值 设置 `china`  相册及相机界面即显示为中文<br>

##  安装
### 手动添加:<br>
*   1.将 XHPhoto 文件夹添加到工程目录中<br>
*   2.导入 UIViewController+XHPhoto.h.h

### CocoaPods:<br>
*   1.在 Podfile 中添加 pod 'XHPhoto'<br>
*   2.执行 pod install 或 pod update<br>
*   3.导入 UIViewController+XHPhoto.h.h

### Tips
*	如果你发现你执行pod install后,导入的不是最新版本,请删除Podfile.lock文件,在执行一次 pod install

##  系统要求
*   该项目最低支持 iOS 7.0 和 Xcode 7.0

##  许可证
XHPhoto 使用 MIT 许可证，详情见 LICENSE 文件