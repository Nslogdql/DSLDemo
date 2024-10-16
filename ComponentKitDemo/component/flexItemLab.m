//
//  flexItemLab.m
//  ComponentKitDemo
//
//  Created by 董其林 on 2024/10/11.
//

#import "flexItemLab.h"
#import <UIKit/UIKit.h>
@implementation flexItemLab
-(UILabel *)flexIteminitWithText:(Textcomponent *)TextModel{
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [TextModel.width floatValue], [TextModel.height floatValue])];
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
    self.Lab = lable;
    return self.Lab;
}
- (void)clickMe{
    self.Lab.backgroundColor = [UIColor blackColor];
}
@end
