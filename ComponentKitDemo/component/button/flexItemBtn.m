//
//  flexItemBtn.m
//  ComponentKitDemo
//
//  Created by 董其林 on 2024/10/16.
//

#import "flexItemBtn.h"
#import "UIColor+Hex.h"
#import "flexItemButton.h"
@implementation flexItemBtn
- (flexItemButton *)ItemLabinitWithText:(Buttoncomponent *)buttonModel{
    flexItemButton *btn = [[flexItemButton alloc] initWithFrame:CGRectMake(0, 0, [buttonModel.width floatValue], [buttonModel.height floatValue])];
    btn.buttonModel = buttonModel;
    if (buttonModel.background.length > 0) {
        btn.backgroundColor = [UIColor colorWithHexString_xt:buttonModel.background];
    }else{
        btn.backgroundColor = [UIColor clearColor];
    }
    if (buttonModel.titleColor.length > 0) {
        [btn setTitleColor:[UIColor colorWithHexString_xt:buttonModel.titleColor] forState:UIControlStateNormal];
    }else{
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    
    if ([buttonModel.textAlignment isEqualToString:@"left"]) {
        btn.titleLabel.textAlignment = NSTextAlignmentLeft;
    }else if ([buttonModel.textAlignment isEqualToString:@"center"]){
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    }else if ([buttonModel.textAlignment isEqualToString:@"right"]){
        btn.titleLabel.textAlignment = NSTextAlignmentRight;
    }else{
        btn.titleLabel.textAlignment = NSTextAlignmentLeft;
    }
    
    btn.titleLabel.font = [UIFont systemFontOfSize:[buttonModel.textSize floatValue]];
    if(buttonModel.text.length > 0){
        [btn setTitle:buttonModel.text forState:UIControlStateNormal];
    }
    if(buttonModel.cornerRadius.length > 0){
        btn.layer.cornerRadius = [buttonModel.cornerRadius floatValue];
    }
    
    if(buttonModel.selecttext.length > 0){
        [btn setTitle:buttonModel.selecttext forState:UIControlStateSelected];
    }
    [btn addTarget:self.actionVC action:@selector(actionMananger:) forControlEvents:UIControlEventTouchUpInside];
    self.button = btn;
    return btn;
}
- (void)clickMe{
    self.button.backgroundColor = [UIColor blackColor];
}
@end
