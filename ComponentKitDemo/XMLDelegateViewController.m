//
//  homeXmlPageViewController.m
//  ComponentKitDemo
//
//  Created by 董其林 on 2024/10/11.
//

#import "XMLDelegateViewController.h"
#import <YGLayout.h>
#import <UIView+Yoga.h>
#import "homepageViewController.h"
#import "contextLable.h"
#import "contextviewWithTextStr.h"
#import "UIColor+Hex.h"
#import "flexItemLab.h"
#import "flexItemIMG.h"
#import "UIColor+Hex.h"
#import <YGLayout.h>
#import <UIView+Yoga.h>
#import "homepageViewController.h"
#import "homeXmlPageViewController.h"
#import "XMLReader.h"
#import "NBData.h"
#import "XMLParserDelegate.h"
#import "XMLNodeParserDelegate.h"
@interface XMLDelegateViewController ()

@end

@implementation XMLDelegateViewController

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
    scroll.scrollEnabled = YES;
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
        layout.width = YGPercentValue(100);
        layout.height = YGPercentValue(100);
        layout.paddingBottom = YGPointValue([self.rootFlex.paddingBottom floatValue]);

    }];
    [scroll addSubview: contentView];
    
    
    NSString* path =[[NSBundle mainBundle] pathForResource:@"node.flexml" ofType:@""];
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    // 将 NSData 转换为 NSString
    NSString *xmlString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSData *xmldata =[xmlString dataUsingEncoding:NSUTF8StringEncoding];
    
    XMLNodeParserDelegate *parserDelegate = [[XMLNodeParserDelegate alloc] init];
    parserDelegate.contentView = self.contentView;
    parserDelegate.xmlContentVC = self;
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:xmldata];
    parser.delegate = parserDelegate;
    __weak typeof(parserDelegate) weakparserDelegate = parserDelegate;
    parserDelegate.endParse = ^{
        NSLog(@"解析结束");
        [self.scroll.yoga applyLayoutPreservingOrigin:YES];
        self.scroll.contentSize = CGSizeMake(self.contentView.bounds.size.width, self.contentView.bounds.size.height+388);
    };
    if ([parser parse]) {
        
    }else{
        
    }
}
- (void)clickMe:(UIButton *)sender{
    sender.backgroundColor = [UIColor blackColor];
//    sender.yoga.width = YGPointValue(80);
//    sender.yoga.height = YGPointValue(120);
    float oldheight2 = sender.superview.superview.superview.yoga.height.value;
    float heightvale = oldheight2 +70;
    sender.superview.superview.superview.yoga.height = YGPointValue(heightvale);
    
    [self.contentView.yoga applyLayoutPreservingOrigin:YES];
    self.scroll.contentSize = CGSizeMake(self.contentView.bounds.size.width, self.scroll.contentSize.height+70);
}
- (void)viewClick{
}
@end
