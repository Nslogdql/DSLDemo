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
#import "UIColor+Hex.h"
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
        //layout.flexDirection =  [self.rootFlex.flexDirection floatValue];
       // layout.width = YGPointValue(self.view.bounds.size.width);
        //layout.height = YGPointValue(self.view.bounds.size.height);
//        layout.width = YGPercentValue(100);
//        layout.height = YGPercentValue(100);
        //layout.alignItems = YGAlignCenter;
        layout.paddingBottom = YGPointValue([self.rootFlex.paddingBottom floatValue]);
    }];
    [scroll addSubview: contentView];

    [self createChildDg:self.rootFlex node:contentView];
    [contentView.yoga applyLayoutPreservingOrigin:YES];
    [self.scroll.yoga applyLayoutPreservingOrigin:YES];
    // 设置 UIScrollView 的 contentSize
    self.scroll.contentSize = CGSizeMake(contentView.bounds.size.width, contentView.bounds.size.height+88); // 手动设置 contentSize
   
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
    }];
    return contentView;
}

-(UIView *)createTextNode:(Textcomponent *)textmodel
{
    flexItemLab *flexItem = [[flexItemLab alloc] init];
    UILabel *flexlab = [flexItem flexIteminitWithText:textmodel];
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
        if (Imagemodel.alignItems) {
            layout.alignItems = [self alignItems:Imagemodel.alignItems];
        }
        
    }];
    
    return flexIMG;
}



- (void)flexBoxItem:(NSMutableArray<Flex *> *)sonFlex with:(UIView *)FlexView{
    for (NSInteger i = 0; i < sonFlex.count; i++ ) {
        Flex *Flexmodel = sonFlex[i];
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
            if(Flexmodel.height){
                layout.height = YGPointValue([Flexmodel.height floatValue]);
            }
        }];
        [FlexView addSubview: contentView];
    
        if(Flexmodel.FlexorderItem.count > 0){
            for (NSInteger i = 0; i < Flexmodel.FlexorderItem.count; i++) {
                id itemModel = Flexmodel.FlexorderItem[i];
                if([itemModel isMemberOfClass:[Imagecomponent class]]){
                    Imagecomponent *Imagemodel = (Imagecomponent *)itemModel;
                    UIImageView *flexIMG = [flexItemIMG initWith:Imagemodel];
                    [flexIMG configureLayoutWithBlock:^(YGLayout * layout) {
                        layout.isEnabled = YES;
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
                        if (Imagemodel.marginTop) {
                            layout.marginTop = YGPointValue([Imagemodel.marginTop floatValue]);
                        }
                        if (Imagemodel.alignItems) {
                            layout.alignItems = [self alignItems:Imagemodel.alignItems];
                        }
                    }];
                    [contentView addSubview: flexIMG];
                }
                if([itemModel isKindOfClass:[Textcomponent class]]){
                    Textcomponent *textmodel = (Textcomponent *)itemModel;
                    flexItemLab *flexItem = [[flexItemLab alloc] init];
                    UILabel *flexlab =[flexItem flexIteminitWithText:itemModel];
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
                    [contentView addSubview: flexlab];
                }
                if([itemModel isKindOfClass:[Flex class]]){
                    Flex *newmodel = (Flex *)itemModel;
                    [self flexBoxItem:newmodel.Flex with:contentView];
                }
            }
        }else{
            
        }
    }
    
    
    
    
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
@end
