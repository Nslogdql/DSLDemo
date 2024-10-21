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
-(instancetype)initWith:(Textcomponent *)TextModel{
    if (self = [super init]) {
    }
    self.TextModel = TextModel;
    [self flexIteminitWithText:TextModel];
    return self;
}
-(void)flexIteminitWithText:(Textcomponent *)TextModel{
    
//    flexItemLable *lable = [[flexItemLable alloc] initWithFrame:CGRectMake(0, 0, [TextModel.width floatValue], [TextModel.height floatValue])];
//    
//    lable.textModel = TextModel;
    if (TextModel.background.length > 0) {
        self.backgroundColor = [UIColor colorWithHexString_xt:TextModel.background];
    }else{
        self.backgroundColor = [UIColor clearColor];
    }
    
    if ([TextModel.textAlignment isEqualToString:@"left"]) {
        self.textAlignment = NSTextAlignmentLeft;
    }else if ([TextModel.textAlignment isEqualToString:@"center"]){
        self.textAlignment = NSTextAlignmentCenter;
    }else if ([TextModel.textAlignment isEqualToString:@"right"]){
        self.textAlignment = NSTextAlignmentRight;
    }else{
        self.textAlignment = NSTextAlignmentLeft;
    }
    
    self.font = [UIFont systemFontOfSize:[TextModel.textSize floatValue]];
    if(TextModel.text.length > 0){
        self.text = TextModel.text;
    }
    [self.TextModel addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];
    
    if (TextModel.onclick.allKeys.count > 0) {
        self.userInteractionEnabled = YES;
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self.actionVC action:@selector(actionMananger:)]];
    }
    if ([TextModel.key integerValue] >0) {
        self.tag = [TextModel.key integerValue];
    }
}
// KVO 观察者方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"text"]) {
        if ([change[NSKeyValueChangeNewKey] length] > 0) {
            NSString *newName = change[NSKeyValueChangeNewKey];
            NSLog(@"Name changed to: %@", newName);
            [self nameDidChange:newName];
        }
        
    }
}

// 处理名称变化的方法
- (void)nameDidChange:(NSString *)newName {
    // 在这里处理名称变化逻辑
    NSLog(@"Updated name: %@", newName);
    self.text = newName;
}

- (void)dealloc {
    // 移除 KVO 观察者
    //[self.TextModel removeObserver:self forKeyPath:@"text"];
}
- (void)clickMe{
    self.backgroundColor = [UIColor blackColor];
}
@end
