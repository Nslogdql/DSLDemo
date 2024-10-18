//
//  flexItemLab.m
//  ComponentKitDemo
//
//  Created by 董其林 on 2024/10/11.
//

#import "flexItemLab.h"
#import <UIKit/UIKit.h>
#import "UIColor+Hex.h"
@implementation flexItemLab
-(flexItemLable *)flexIteminitWithText:(Textcomponent *)TextModel{
    flexItemLable *lable = [[flexItemLable alloc] initWithFrame:CGRectMake(0, 0, [TextModel.width floatValue], [TextModel.height floatValue])];
    lable.textModel = TextModel;
    if (TextModel.background.length > 0) {
        lable.backgroundColor = [UIColor colorWithHexString_xt:TextModel.background];
    }else{
        lable.backgroundColor = [UIColor clearColor];
    }
    
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
    if (TextModel.onclick.allKeys.count > 0) {
        lable.userInteractionEnabled = YES;
        [lable addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self.actionVC action:@selector(actionMananger:)]];
    }
    
    self.Lab = lable;
    return self.Lab;
}
- (void)clickMe{
    self.Lab.backgroundColor = [UIColor blackColor];
}
@end
