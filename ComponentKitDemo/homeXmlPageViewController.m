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
        //layout.flexDirection =  [self.rootFlex.flexDirection floatValue];
       // layout.width = YGPointValue(self.view.bounds.size.width);
        //layout.height = YGPointValue(self.view.bounds.size.height);
        layout.width = YGPercentValue(100);
        layout.height = YGPercentValue(100);
        //layout.alignItems = YGAlignCenter;
        layout.paddingBottom = YGPointValue([self.rootFlex.paddingBottom floatValue]);
        
    }];
    [scroll addSubview: contentView];
    
    
    if(self.rootFlex.FlexorderItem.count > 0){
        for (NSInteger i = 0; i < self.rootFlex.FlexorderItem.count; i++) {
            id itemModel  = self.rootFlex.FlexorderItem[i];
            if([itemModel isKindOfClass:[Imagecomponent class]]){
                Imagecomponent *Imagemodel = (Imagecomponent *)itemModel;
                UIImageView *flexIMG = [flexItemIMG initWith:Imagemodel];
                [flexIMG configureLayoutWithBlock:^(YGLayout * layout) {
                    layout.isEnabled = YES;
                    layout.marginTop = YGPointValue(20);
                    if (Imagemodel.marginLeft) {
                        layout.marginLeft = YGPointValue([Imagemodel.marginLeft floatValue]);
                    }
                    if (Imagemodel.width) {
                        layout.width = YGPointValue([Imagemodel.width floatValue]);
                    }
                    if (Imagemodel.height) {
                        layout.height = YGPointValue([Imagemodel.height floatValue]);
                    }
                    if (Imagemodel.alignItems) {
                        layout.alignItems = [self alignItems:Imagemodel.alignItems];
                    }
                    
                }];
                [contentView addSubview: flexIMG];
            }
            
            if([itemModel isKindOfClass:[Textcomponent class]]){
                Textcomponent *textmodel = (Textcomponent *)itemModel;
                UILabel *flexlab = [flexItemLab initWithText:textmodel];
                [flexlab configureLayoutWithBlock:^(YGLayout * layout) {
                    layout.isEnabled = YES;
                    if (textmodel.marginLeft) {
                        layout.marginLeft = YGPointValue([textmodel.marginLeft floatValue]);
                    }
                    if(textmodel.width){
                        layout.width = YGPointValue([textmodel.width floatValue]);
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
    }
   
//    if(self.rootFlex.Flex.count > 0){
//        //解析xml的model
//        [self flexBoxItem:self.rootFlex.Flex with:self.contentView];
//    }
    
    //[self.view.yoga applyLayoutPreservingOrigin:YES];
    [self.scroll.yoga applyLayoutPreservingOrigin:YES];
    // 设置 UIScrollView 的 contentSize
    self.scroll.contentSize = CGSizeMake(contentView.bounds.size.width, contentView.bounds.size.height+88); // 手动设置 contentSize
   
}

- (void)flexBoxItem:(NSMutableArray<Flex *> *)Flexmodelitem with:(UIView *)FlexView{
    for (NSInteger i = 0; i < Flexmodelitem.count; i++ ) {
        Flex *Flexmodel = Flexmodelitem[i];
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
            if(Flexmodel.marginLeft){
                layout.marginLeft = YGPointValue([Flexmodel.marginLeft floatValue]);
            }
            if(Flexmodel.width){
                layout.width = YGPointValue([Flexmodel.width floatValue]);
            }
            if(Flexmodel.height){
                layout.height = YGPointValue([Flexmodel.height floatValue]);
            }
//            layout.alignItems = [self alignItems:Flexmodel.alignItems];
        }];
        [FlexView addSubview: contentView];
    
        if(Flexmodel.FlexorderItem.count > 0){
            for (NSInteger i = 0; i < Flexmodel.FlexorderItem.count; i++) {
                id itemModel = Flexmodel.FlexorderItem[i];
                if([itemModel isKindOfClass:[Imagecomponent class]]){
                    Imagecomponent *Imagemodel = (Imagecomponent *)itemModel;
                    UIImageView *flexIMG = [flexItemIMG initWith:Imagemodel];
                    [flexIMG configureLayoutWithBlock:^(YGLayout * layout) {
                        layout.isEnabled = YES;
                        if (Imagemodel.marginLeft) {
                            layout.marginLeft = YGPointValue([Imagemodel.marginLeft floatValue]);
                        }
                        if (Imagemodel.width) {
                            layout.width = YGPointValue([Imagemodel.width floatValue]);
                        }
                        if (Imagemodel.height) {
                            layout.height = YGPointValue([Imagemodel.height floatValue]);
                        }
                        if (Imagemodel.alignItems) {
                            layout.alignItems = [self alignItems:Imagemodel.alignItems];
                        }
                    }];
                    [contentView addSubview: flexIMG];
                }
                if([itemModel isKindOfClass:[Textcomponent class]]){
                    Textcomponent *textmodel = (Textcomponent *)itemModel;
                    UILabel *flexlab = [flexItemLab initWithText:textmodel];
                    [flexlab configureLayoutWithBlock:^(YGLayout * layout) {
                        layout.isEnabled = YES;
                        if (textmodel.marginLeft) {
                            layout.marginLeft = YGPointValue([textmodel.marginLeft floatValue]);
                        }
                        if(textmodel.width){
                            layout.width = YGPointValue([textmodel.width floatValue]);
                        }
                        if(textmodel.height){
                            layout.height = YGPointValue([textmodel.height floatValue]);
                        }
                       
                    }];
                    [contentView addSubview: flexlab];
                }
                if([itemModel isKindOfClass:[Flex class]]){
                    Flex *newmodel = (Flex *)itemModel;
                    [self flexBoxItem:newmodel.Flex with:FlexView];
                }
            }
        }else{
        }
        if(Flexmodel.Flex.count > 0){
            [self flexBoxItem:Flexmodel.Flex with:contentView];
        }else{
            //[self.view.yoga applyLayoutPreservingOrigin:YES];
            [self.scroll.yoga applyLayoutPreservingOrigin:YES];
            // 设置 UIScrollView 的 contentSize
            self.scroll.contentSize = CGSizeMake(contentView.bounds.size.width, contentView.bounds.size.height+88); // 手动设置 contentSize
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
