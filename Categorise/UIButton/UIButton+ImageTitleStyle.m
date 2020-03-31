//
//  UIButton+ImageTitleStyle.m
//  babyfs
//
//  Created by Minger on 2017/9/26.
//  Copyright © 2017年 Minger. All rights reserved.
//

#import "UIButton+ImageTitleStyle.h"

@implementation UIButton (ImageTitleStyle)

-(void)setUIButtonImageTitleStyle:(UIButtonImageTitleStyle)style padding:(CGFloat)padding{
    
    if (self.imageView.image != nil && self.titleLabel.text != nil) {
        
        // 强制布局方式为从左到右,适应阿拉伯地区造成的布局影响.
        self.semanticContentAttribute = UISemanticContentAttributeForceLeftToRight;
        //先还原,其默认属性也是UIEdgeInsetsZero
        self.titleEdgeInsets = UIEdgeInsetsZero;
        self.imageEdgeInsets = UIEdgeInsetsZero;
        
        CGRect imageRect = self.imageView.frame;
        CGRect titleRect = self.titleLabel.frame;
        
        CGFloat totalHeight = imageRect.size.height + padding + titleRect.size.height;
        CGFloat selfHeight = self.frame.size.height;
        CGFloat selfWidth = self.frame.size.width;
        
        // 思路:
        /*
         
         一: 没有paddding
         1.首先算好image和title的转换好位置的newx,newy
         2.让 newx - origin.x 得到 UIEdgeInsets.left , newy - origin.y = UIEdgeInsets.top
         3.当我们 UIEdgeInsets.left 和 UIEdgeInsets.top 内边距生效时,为了让控件显示出内容(因为当UIEdgeInsets.left偏移量超过了label的宽度时,文字是显示在label空间的外部,我们会看不到),所有我们要让
         UIEdgeInsets.right = - (UIEdgeInsets.left),  UIEdgeInsets.bottom = - (UIEdgeInsets.top)
         4.得到最终的titleEdgeInsets和imageEdgeInsets.
         
         二: 存在padding
         默认情况下image和title是紧挨着,没有间隙的.如果设置了padding,那么间隙就会存在两者之间.
         
         */
        
        float titleEdgeInsetsLeft;
        float titleEdgeInsetsTop;
        float imageEdgeInsetsLeft;
        float imageEdgeInsetsTop;
        
        switch (style) {
            case UIButtonImageTitleStyleDefault:
            {
                titleEdgeInsetsLeft = 0;
                titleEdgeInsetsTop  = 0;
                imageEdgeInsetsLeft = 0;
                imageEdgeInsetsTop = 0;
            
            }
                    break;
            case UIButtonImageTitleStyleImageLeftTitleRightTotalCenter:
            {
                
                titleEdgeInsetsTop = 0;
                titleEdgeInsetsLeft = padding / 2;
                imageEdgeInsetsTop = 0;
                imageEdgeInsetsLeft = - padding / 2;
                
            }
                break;
            case UIButtonImageTitleStyleImageRightTitleLeftTotalCenter:
            {
                titleEdgeInsetsTop = 0;
                titleEdgeInsetsLeft = -(imageRect.size.width + padding/2);
                imageEdgeInsetsTop = 0;
                imageEdgeInsetsLeft = (titleRect.size.width+ padding/2);
                
            }
                break;
            case UIButtonImageTitleStyleImageTopTitleBottomTotalCenter:
            {
                //图片在上，文字在下
                titleEdgeInsetsTop  = ((selfHeight - totalHeight)/2 + imageRect.size.height + padding) - titleRect.origin.y;
                titleEdgeInsetsLeft = (selfWidth -  titleRect.size.width)/2 - titleRect.origin.x;
                imageEdgeInsetsTop  = (selfHeight - totalHeight)/2 - imageRect.origin.y;
                imageEdgeInsetsLeft = (selfWidth -  imageRect.size.width)/2 - imageRect.origin.x;
                            
            }
                break;
            case UIButtonImageTitleStyleImageBottomTitleTopTotalCenter:
            {
                //图片在下，文字在上。
                titleEdgeInsetsTop  = (selfHeight - totalHeight)/2 - titleRect.origin.y;
                titleEdgeInsetsLeft = (selfWidth -  titleRect.size.width)/2 - titleRect.origin.x;
                imageEdgeInsetsTop  = ((selfHeight - totalHeight)/2 + titleRect.size.height + padding) - imageRect.origin.y;
                imageEdgeInsetsLeft = (selfWidth -  imageRect.size.width)/2 - imageRect.origin.x;
            
            }
                break;
            default:
                break;
        }
        
        self.titleEdgeInsets = UIEdgeInsetsMake(titleEdgeInsetsTop,
                                                titleEdgeInsetsLeft,
                                                -titleEdgeInsetsTop,
                                                -titleEdgeInsetsLeft);
        
        self.imageEdgeInsets = UIEdgeInsetsMake(imageEdgeInsetsTop,
                                                imageEdgeInsetsLeft,
                                                -imageEdgeInsetsTop,
                                                -imageEdgeInsetsLeft);
    }
    else {
        self.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    
}
@end
