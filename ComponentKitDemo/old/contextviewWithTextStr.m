//
//  contextviewWithTextStr.m
//  ComponentKitDemo
//
//  Created by 董其林 on 2024/10/10.
//

#import "contextviewWithTextStr.h"
#import <YGLayout.h>
#import <YGValue.h>
#import <UIView+Yoga.h>
@implementation contextviewWithTextStr

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupView];
    }
    return self;
}
- (void)setupView{
    UILabel *lable = [[UILabel alloc] init];
    self.label = lable;
    [self configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = true;
        layout.flexDirection =  YGFlexDirectionRow;
        layout.width = YGPointValue(self.frame.size.width);
        layout.height = YGPointValue(self.frame.size.height);
        layout.marginTop = YGPointValue(-20);
        layout.marginLeft = YGPointValue(20);
        layout.padding =  YGPointValue(0);//设置了全部子项目的填充值
        
    }];
    [lable configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = true;
        layout.flexDirection =  YGFlexDirectionColumn;
        layout.width = YGPercentValue(100);
        layout.height = YGPercentValue(100);
        layout.marginTop = YGPointValue(0);
        layout.marginLeft = YGPointValue(0);
        layout.padding =  YGPointValue(0);//设置了全部子项目的填充值
        layout.alignSelf = YGAlignCenter;
    }];
    [self addSubview:lable];
    [self.yoga applyLayoutPreservingOrigin:YES];
}
@end
