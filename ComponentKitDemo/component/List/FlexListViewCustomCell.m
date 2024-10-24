//
//  FlexListViewCustomCell.m
//  ComponentKitDemo
//
//  Created by 董其林 on 2024/10/23.
//

#import "FlexListViewCustomCell.h"
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
#import "flexItemBtn.h"
#import "flexItemButton.h"
#import "flexItemlist.h"
#import "flexItemUICollectionView.h"
#import "Flex.h"
#import "CustomCollectionViewCell.h"
#import "SecondCustomViewController.h"
#import "FlexListView.h"
#import <SDWebImage/UIImageView+WebCache.h>
@implementation FlexListViewCustomCell
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
- (void)setCellSource:(NSDictionary *)cellSource{
    _cellSource = cellSource;
    if([cellSource[@"image"] length] > 0){
         if([cellSource[@"image"] hasPrefix:@"http"]){
            [self.icon sd_setImageWithURL:[NSURL URLWithString:cellSource[@"image"]] placeholderImage:nil];
        }else{
            self.icon .image = [UIImage imageNamed:cellSource[@"image"]];
        }
    }
    
    self.contentname.text = cellSource[@"contenttitle"];
    self.contenttitle.text = cellSource[@"content"];
    self.canjialab.text = cellSource[@"click"];
}
- (void)setRootFlex:(Flex *)rootFlex{
    _rootFlex = rootFlex;
    // 初始化子视图
    [self onlayout];
}
- (void)onlayout{
    self.contentView.yoga.isEnabled = YES;
    UIView *contentview = [[UIView alloc]init];
    contentview.backgroundColor = [UIColor whiteColor];
    self.contentview = contentview;
    [contentview configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = YES;
        if([self.rootFlex.flexDirection isEqualToString: @"column"]){
            layout.flexDirection =  YGFlexDirectionColumn;
        }else{
            layout.flexDirection =  YGFlexDirectionRow;
        }
        if (self.rootFlex.marginLeft) {
            if ([self.rootFlex.marginLeft containsString:@"%"]) {
                layout.marginLeft = YGPercentValue([self.rootFlex.marginLeft floatValue]);
            }else{
                layout.marginLeft = YGPointValue([self.rootFlex.marginLeft floatValue]);
            }
        }
        if (self.rootFlex.marginRight) {
            if ([self.rootFlex.marginRight containsString:@"%"]) {
                layout.marginRight = YGPercentValue([self.rootFlex.marginRight floatValue]);
            }else{
                layout.marginRight = YGPointValue([self.rootFlex.marginRight floatValue]);
            }
        }
        if (self.rootFlex.justifyContent) {
            if ([self.rootFlex.justifyContent isEqualToString:@"spaceBetween"]) {
                layout.justifyContent = YGJustifySpaceBetween;
            }else if([self.rootFlex.justifyContent isEqualToString:@"FlexEnd"]){
                layout.justifyContent = YGJustifyFlexEnd;
            }else{
                layout.justifyContent = YGJustifyFlexStart;
            }
        }
        if (self.rootFlex.marginTop) {
            layout.marginTop = YGPointValue([self.rootFlex.marginTop floatValue]);
        }
        if (self.rootFlex.width) {
            if ([self.rootFlex.width containsString:@"%"]) {
                layout.width = YGPercentValue([self.rootFlex.width floatValue]);
            }else{
                layout.width = YGPointValue([self.rootFlex.width floatValue]);
            }
        }
        if(self.rootFlex.alignItems){
            layout.alignItems = [self alignItems:self.rootFlex.alignItems];
        }
        if(self.rootFlex.height){
            layout.height = YGPointValue([self.rootFlex.height floatValue]);
        }
        
        if(self.rootFlex.alignItems){
            layout.alignItems = [self alignItems:self.rootFlex.alignItems];
        }
        if (self.rootFlex.justifyContent) {
            layout.justifyContent = [self justify:self.rootFlex.justifyContent];
        }
        
    }];
    [self.contentView addSubview: contentview];
    
    [self createChildDg:self.rootFlex node:contentview];
    [contentview.yoga applyLayoutPreservingOrigin:YES];
    [self.contentView.yoga applyLayoutPreservingOrigin:YES];
    
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
        Flex *newmodel = (Flex *)model;
        if ([newmodel.style isEqual:@"List"]) {
            view = [self createListNode:newmodel];
        }else{
            view = [self createFlexNode:newmodel];
        }
        
    }else if ([model isMemberOfClass:[Buttoncomponent class]]) {
        view = [self createButtonNode:(Buttoncomponent *)model];
    }else if ([model isMemberOfClass:[Bannercomponent class]]) {
        view = [self createBannerNode:(Bannercomponent *)model];
    }
    [node addSubview:view];
    return view;
}
-(UIView *)createBannerNode:(Bannercomponent *)Flexmodel
{
    flexItemlist *listItem = [[flexItemlist alloc] initWithText:Flexmodel];
    listItem.actionVC = self.actionVC;
    
    [listItem configureLayoutWithBlock:^(YGLayout * layout) {
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
    return listItem;
}
-(UIView *)createListNode:(Flex *)Flexmodel
{
    FlexListView *listItem = [[FlexListView alloc] initWithText:Flexmodel];
    listItem.actionVC = self.actionVC;
    
    [listItem configureLayoutWithBlock:^(YGLayout * layout) {
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
    return listItem;
}
-(UIView *)createFlexNode:(Flex *)Flexmodel
{
    UIView *contentView = [[UIView alloc]init];
    if (Flexmodel.background) {
        contentView.backgroundColor = [UIColor colorWithHexString_xt:Flexmodel.background];
    }else{
        contentView.backgroundColor = [UIColor whiteColor];
    }
    if (![Flexmodel.key isEqualToString:@"flex"]) {
        NSString *tagvalue = Flexmodel.key;
        contentView.tag = [tagvalue floatValue];
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
//    flexItemLab *flexItem = [[flexItemLab alloc] init];
//    flexItem.actionVC = self;
    flexItemLab *flexlab = [[flexItemLab alloc] initWith:textmodel];
    if ([textmodel.key isEqualToString:@"contenttitle"]) {
        self.contentname = flexlab;
    }else if ([textmodel.key isEqualToString:@"content"]){
        self.contenttitle = flexlab;
    }else if ([textmodel.key isEqualToString:@"canjia"]){
        self.canjialab = flexlab;
    }
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
-(UIView *)createButtonNode:(Buttoncomponent *)textmodel
{
    flexItemBtn *flexItem = [[flexItemBtn alloc] init];
    flexItem.actionVC = self.actionVC;
    flexItemButton *flexlab = [flexItem ItemLabinitWithText:textmodel];
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


-(UIView *)createImageNode:(Imagecomponent *)Imagemodel
{
    UIImageView *flexIMG = [flexItemIMG initWith:Imagemodel];
    self.icon = flexIMG;
    [flexIMG configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = YES;
        if (Imagemodel.marginTop) {
            if ([Imagemodel.marginLeft containsString:@"%"]) {
                layout.marginTop = YGPercentValue([Imagemodel.marginTop floatValue]);
            }else{
                layout.marginTop = YGPointValue([Imagemodel.marginTop floatValue]);
            }
        }
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
