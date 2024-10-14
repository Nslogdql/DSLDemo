//
//  flexItemLab.m
//  ComponentKitDemo
//
//  Created by 董其林 on 2024/10/11.
//

#import "flexItemLab.h"
#import <UIKit/UIKit.h>
@implementation flexItemLab
+ (UILabel *)initWithText:(Textcomponent *)TextModel{
    UILabel *lable = [[UILabel alloc] init];
    lable.backgroundColor = [UIColor clearColor];
    lable.textColor = [UIColor blackColor];
    if ([TextModel.textAlignment isEqualToString:@"left"]) {
        lable.textAlignment = NSTextAlignmentLeft;
    }else if ([TextModel.textAlignment isEqualToString:@"center"]){
        lable.textAlignment = NSTextAlignmentCenter;
    }else if ([TextModel.textAlignment isEqualToString:@"right"]){
        lable.textAlignment = NSTextAlignmentRight;
    }else{
        lable.textAlignment = NSTextAlignmentLeft;
    }
    
    lable.font = [UIFont systemFontOfSize:[TextModel.textSize floatValue]];
    if(TextModel.text.length > 0){
        lable.text = TextModel.text;
    }
    return lable;
}
@end
