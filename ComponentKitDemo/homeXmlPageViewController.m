//
//  homeXmlPageViewController.m
//  ComponentKitDemo
//
//  Created by 董其林 on 2024/10/11.
//

#import "homeXmlPageViewController.h"
#import <YGLayout.h>
#import <UIView+Yoga.h>
#import "homepageViewController.h"
#import "contextLable.h"
#import "contextviewWithTextStr.h"
#import "UIColor+Hex.h"
#import "flexItemLab.h"
#import "flexItemIMG.h"
#import "flexItemBtn.h"
#import "UIColor+Hex.h"
#import "flexItemLable.h"
@interface homeXmlPageViewController ()

@end

@implementation homeXmlPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"首页";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = YES;
        layout.flexDirection =  YGFlexDirectionColumn;
        layout.width = YGPointValue(self.view.bounds.size.width);
        layout.height = YGPointValue(self.view.bounds.size.height);
        //layout.alignItems = YGAlignCenter;
    }];
    
    UIScrollView *scroll = [[UIScrollView alloc] init];
    self.scroll = scroll;
    //[scroll sizeToFit];
    scroll.scrollEnabled = YES;
    //scroll.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.width*5);
    [scroll configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = YES;
        layout.flexDirection =  YGFlexDirectionColumn;
        layout.marginTop = YGPointValue(0);
        layout.width = YGPointValue(self.view.bounds.size.width);
        layout.height = YGPointValue(self.view.bounds.size.height);
        //layout.alignItems = YGAlignCenter;
    }];
    [self.view addSubview: scroll];
    
    UIView *contentView = [[UIView alloc]init];
    contentView.backgroundColor = [UIColor whiteColor];
    self.contentView = contentView;
    [contentView configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = YES;
        layout.flexDirection = YGFlexDirectionColumn;
//        layout.alignItems = YGAlignCenter;
    }];
    [scroll addSubview: contentView];
    
//    UIImageView *imageView = [[UIImageView alloc]init];
//    imageView.backgroundColor = [UIColor purpleColor];
//    imageView.image = [UIImage imageNamed:@"logo_baiyedai"];
//    [contentView addSubview:imageView];
//    [imageView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
//        layout.isEnabled = YES;
//        
//        layout.width = YGPointValue(35);
//        layout.height = YGPointValue(35);;
//    }];
    

    [self createChildDg:self.rootFlex node:contentView];

    [contentView.yoga applyLayoutPreservingOrigin:YES];
    [self.scroll.yoga applyLayoutPreservingOrigin:YES];
    // 设置 UIScrollView 的 contentSize

    self.scroll.contentSize = CGSizeMake(contentView.bounds.size.width, contentView.bounds.size.height); // 手动设置 contentSize
   
}

- (void)createChildDg:(DataNode *)origin node:(UIView *)node
{
    for (Flex *model in origin.FlexorderItem) {
        NSArray *childList = model.FlexorderItem;
        if (childList == NULL  || childList.count == 0) {
            [self createChildNode:model node:node];
            
        } else {
            UIView *view = [self createFlexNode:model ];
            [node addSubview:view];
            [self createChildDg:model node:view];
        }
    }
}

- (UIView *)createChildNode:(DataNode *)model node:(UIView *)node
{
    UIView *view;
    if ([model isMemberOfClass:[Imagecomponent class]]) {
        view = [self createImageNode:(Imagecomponent *)model];
    } else if ([model isMemberOfClass:[Textcomponent class]]) {
        view = [self createTextNode:(Textcomponent *)model];
    } else if ([model isMemberOfClass:[Flex class]]) {
        view = [self createFlexNode:(Flex *)model];
    } else if ([model isMemberOfClass:[ButtonComponent class]]) {
        view = [self createButtonNode:(ButtonComponent *)model];
    }
    [node addSubview:view];
    return view;
}

-(UIView *)createFlexNode:(Flex *)Flexmodel
{
    UIView *contentView = [[UIView alloc]init];
    if (Flexmodel.background) {
        contentView.backgroundColor = [UIColor colorWithHexString_xt:Flexmodel.background];
    }else{
        contentView.backgroundColor = [UIColor whiteColor];
    }
    
    [contentView configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = YES;
        if([Flexmodel.flexDirection isEqualToString: @"column"]){
            layout.flexDirection =  YGFlexDirectionColumn;
        }else{
            layout.flexDirection =  YGFlexDirectionRow;
        }
        if (Flexmodel.marginLeft) {
            if ([Flexmodel.marginLeft containsString:@"%"]) {
                layout.marginLeft = YGPercentValue([Flexmodel.marginLeft floatValue]);
            }else{
                layout.marginLeft = YGPointValue([Flexmodel.marginLeft floatValue]);
            }
        }
        if (Flexmodel.marginRight) {
            if ([Flexmodel.marginRight containsString:@"%"]) {
                layout.marginRight = YGPercentValue([Flexmodel.marginRight floatValue]);
            }else{
                layout.marginRight = YGPointValue([Flexmodel.marginRight floatValue]);
            }
        }
        if (Flexmodel.justifyContent) {
            if ([Flexmodel.justifyContent isEqualToString:@"spaceBetween"]) {
                layout.justifyContent = YGJustifySpaceBetween;
            }else if([Flexmodel.justifyContent isEqualToString:@"FlexEnd"]){
                layout.justifyContent = YGJustifyFlexEnd;
            }else{
                layout.justifyContent = YGJustifyFlexStart;
            }
        }
        if (Flexmodel.marginTop) {
            layout.marginTop = YGPointValue([Flexmodel.marginTop floatValue]);
        }
        if (Flexmodel.width) {
            if ([Flexmodel.width containsString:@"%"]) {
                layout.width = YGPercentValue([Flexmodel.width floatValue]);
            }else{
                layout.width = YGPointValue([Flexmodel.width floatValue]);
            }
        }
        if(Flexmodel.alignItems){
            layout.alignItems = [self alignItems:Flexmodel.alignItems];
        }
        if(Flexmodel.height){
            layout.height = YGPointValue([Flexmodel.height floatValue]);
        }
        
        if(Flexmodel.alignItems){
            layout.alignItems = [self alignItems:Flexmodel.alignItems];
        }
        if (Flexmodel.justifyContent) {
            layout.justifyContent = [self justify:Flexmodel.justifyContent];
        }
        
    }];
    return contentView;
}

-(UIView *)createTextNode:(Textcomponent *)textmodel
{
    flexItemLab *flexItem = [[flexItemLab alloc] init];
    flexItem.actionVC = self;
    flexItemLable *flexlab = [flexItem flexIteminitWithText:textmodel];
    [flexlab configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = YES;
        if (textmodel.marginLeft) {
            layout.marginLeft = YGPointValue([textmodel.marginLeft floatValue]);
        }
        if (textmodel.marginRight) {
            layout.marginRight = YGPointValue([textmodel.marginRight floatValue]);
        }
        if (textmodel.marginTop) {
            layout.marginTop = YGPointValue([textmodel.marginTop floatValue]);
        }
        if (textmodel.width) {
            if ([textmodel.width containsString:@"%"]) {
                layout.width = YGPercentValue([textmodel.width floatValue]);
            }else{
                layout.width = YGPointValue([textmodel.width floatValue]);
            }
        }
        if(textmodel.height){
            layout.height = YGPointValue([textmodel.height floatValue]);
        }
    }];
    return flexlab;;
}

- (UIView *)createButtonNode:(ButtonComponent *)buttonModel
{
    flexItemBtn *flexBtn = [[flexItemBtn alloc] init];
    UIButton *button = [flexBtn ItemLabinitWithText:buttonModel];
    if (buttonModel.text != NULL && buttonModel.text.length > 0) {
        [button setTitle:buttonModel.text forState:UIControlStateNormal];
    }
    
    [button configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        if (buttonModel.marginLeft) {
            layout.marginLeft = YGPointValue([buttonModel.marginLeft floatValue]);
        }
        if (buttonModel.marginRight) {
            layout.marginRight = YGPointValue([buttonModel.marginRight floatValue]);
        }
        if (buttonModel.marginTop) {
            layout.marginTop = YGPointValue([buttonModel.marginTop floatValue]);
        }
        if (buttonModel.width) {
            if ([buttonModel.width containsString:@"%"]) {
                layout.width = YGPercentValue([buttonModel.width floatValue]);
            }else{
                layout.width = YGPointValue([buttonModel.width floatValue]);
            }
        }
        if(buttonModel.height){
            layout.height = YGPointValue([buttonModel.height floatValue]);
        }
    }];
    
    
    return button;
}

-(UIView *)createImageNode:(Imagecomponent *)Imagemodel
{
    UIImageView *flexIMG = [flexItemIMG initWith:Imagemodel];
    [flexIMG configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = YES;
        layout.marginTop = YGPointValue(20);
        if (Imagemodel.marginLeft) {
            if ([Imagemodel.marginLeft containsString:@"%"]) {
                layout.marginLeft = YGPercentValue([Imagemodel.marginLeft floatValue]);
            }else{
                layout.marginLeft = YGPointValue([Imagemodel.marginLeft floatValue]);
            }
        }
        
        if (Imagemodel.marginRight) {
            if ([Imagemodel.marginRight containsString:@"%"]) {
                layout.marginRight = YGPercentValue([Imagemodel.marginRight floatValue]);
            }else{
                layout.marginRight = YGPointValue([Imagemodel.marginRight floatValue]);
            }
        }
        
        if (Imagemodel.width) {
            if ([Imagemodel.width containsString:@"%"]) {
                layout.width = YGPercentValue([Imagemodel.width floatValue]);
            }else{
                layout.width = YGPointValue([Imagemodel.width floatValue]);
            }
        }
        if (Imagemodel.height) {
            layout.height = YGPointValue([Imagemodel.height floatValue]);
        }
        
        
    }];
    
    return flexIMG;
}

- (YGAlign)alignItems:(NSString *)alignItems{
    if([alignItems isEqualToString: @"center"]){
        return YGAlignCenter;
    }else if([alignItems isEqualToString: @"flexStart"]){
        return YGAlignFlexStart;
    }else if([alignItems isEqualToString: @"flexEnd"]){
        return YGAlignFlexEnd;
    }else {
        return YGAlignFlexStart;
    }
}
- (void)addheight:(UITapGestureRecognizer *)gesture{
    flexItemLable *flexItemLab = (flexItemLable *)gesture.view;
    if ([flexItemLab.text isEqualToString:@"V"]) {
        float orignHeight = flexItemLab.yoga.height.value;
        flexItemLab.yoga.marginTop = YGPointValue(50);
        
        float superorignHeight = flexItemLab.superview.yoga.height.value;
        flexItemLab.superview.yoga.height = YGPointValue(superorignHeight + 50);
        
        [self.contentView.yoga applyLayoutPreservingOrigin:YES];
        // 设置 UIScrollView 的 contentSize
        self.scroll.contentSize = CGSizeMake(self.contentView.bounds.size.width, self.scroll.contentSize.height + 50); // 手动设置 contentSize
        flexItemLab.text = @"-";
    }else{
        float orignHeight = flexItemLab.yoga.height.value;
        flexItemLab.yoga.height = YGPointValue(orignHeight - 50);
        
        float superorignHeight = flexItemLab.superview.yoga.height.value;
        flexItemLab.yoga.marginTop = YGPointValue(0);
//        flexItemLab.superview.yoga.height = YGPointValue(superorignHeight - 50);
        
        [self.contentView.yoga applyLayoutPreservingOrigin:YES];
        // 设置 UIScrollView 的 contentSize
        self.scroll.contentSize = CGSizeMake(self.contentView.bounds.size.width, self.scroll.contentSize.height - 50); // 手动设置 contentSize
        flexItemLab.text = @"V";
    }
    
}

- (YGJustify)justify:(NSString *)justify
{
    if ([justify isEqualToString:@"start"]) {
        return YGJustifyFlexStart;
    }
    else if ([justify isEqualToString:@"center"]) {
        return YGJustifyCenter;
    }
    else if ([justify isEqualToString:@"end"]) {
        return YGJustifyFlexEnd;
    }
    else if ([justify isEqualToString:@"space-between"]) {
        return YGJustifySpaceBetween;
    }
    else if ([justify isEqualToString:@"space-around"]) {
        return YGJustifySpaceAround;
    }
    else if ([justify isEqualToString:@"space-evenly"]) {
        return YGJustifySpaceEvenly;
    }
    else {
        return YGJustifyFlexStart;

    }
    
}
@end
