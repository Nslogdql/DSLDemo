//
//  flexItemBtn.m
//  ComponentKitDemo
//
//  Created by 董其林 on 2024/10/16.
//

#import "flexItemBtn.h"

@implementation flexItemBtn
- (UIButton *)ItemLabinitWithText:(Buttoncomponent *)buttonModel{
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, [buttonModel.width floatValue], [buttonModel.height floatValue])];
    btn.backgroundColor = [UIColor whiteColor];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
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
    [btn addTarget:self action:@selector(clickMe:) forControlEvents:UIControlEventTouchUpInside];
    self.button = btn;
    return btn;
}
- (void)clickMe{
    self.button.backgroundColor = [UIColor blackColor];
}
@end
