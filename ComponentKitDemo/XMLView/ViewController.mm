//
//  ViewController.m
//  ComponentKitDemo
//
//  Created by 董其林 on 2024/10/9.
//

#import "ViewController.h"
#import <YGLayout.h>
#import <UIView+Yoga.h>
#import "homepageViewController.h"
#import "homeXmlPageViewController.h"
#import "XMLReader.h"
#import "NBData.h"
#import "XMLParserDelegate.h"
@interface ViewController ()
@property (nonatomic, strong) YGLayout *yoga;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(self.view.bounds.size.width);
        layout.height = YGPointValue(self.view.bounds.size.height);
        layout.alignItems = YGAlignCenter;
    }];
    
    UIView *contentView = [[UIView alloc]init];
    contentView.backgroundColor = [UIColor lightGrayColor];
    [contentView configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = true;
        // 4
        layout.flexDirection =  YGFlexDirectionRow;
        layout.width = YGPointValue(320);
        layout.height = YGPointValue(80);
        layout.marginTop = YGPointValue(100);
        
        layout.padding =  YGPointValue(10);//设置了全部子项目的填充值
    }];
    
    UIView *child1 = [[UIView alloc]init];
    child1.backgroundColor = [UIColor redColor];
    [child1 configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(80);
        layout.marginRight = YGPointValue(10);
    }];
    [child1 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tohome)]];
    
    UIView *child2 = [[UIView alloc]init];
    child2.backgroundColor = [UIColor blueColor];
    [child2 configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(80);
        layout.flexGrow = 1;
        layout.height = YGPointValue(20);
        layout.alignSelf = YGAlignCenter;
        
    }];
    [child2 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tohome2)]];
    
    [contentView addSubview:child1];
    [contentView addSubview:child2];
    [self.view addSubview:contentView];
    [self.view.yoga applyLayoutPreservingOrigin:YES];
    
    
    
    
    
}
- (void)tohome2{
    homepageViewController *xml = [[homepageViewController alloc] init];
    [self.navigationController pushViewController:xml animated:YES];
}
- (void)tohome{
    
    
    NSString* path =[[NSBundle mainBundle] pathForResource:@"local.flexml" ofType:@""];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSError *error;
   NSDictionary *dic = [XMLReader dictionaryForXMLData:data error:&error];
    if (error) {
        NSLog(@"%@",error);
    } else {
        NSLog(@"%@",dic);
        NSString *result = [NBData dictionaryToJson:dic];
        
    }
    
    // 将 NSData 转换为 NSString
    NSString *xmlString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//    NSString *xmlString = @"";
    NSData *xmldata =[xmlString dataUsingEncoding:NSUTF8StringEncoding];
    XMLParserDelegate *parserDelegate = [[XMLParserDelegate alloc] init];
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:xmldata];
    parser.delegate = parserDelegate;
    
    if ([parser parse]) {
        // 解析成功，可以访问 parserDelegate.rootFlex
        NSLog(@"Successfully parsed XML.%@---%@",parserDelegate.FatherrootFlex,parserDelegate.currentElementValue);
        homeXmlPageViewController *xml = [[homeXmlPageViewController alloc] init];
        xml.rootFlex =parserDelegate.FatherrootFlex;
        xml.rootFlexCopy = parserDelegate.FatherrootFlexCopy;
        [self.navigationController pushViewController:xml animated:YES];
    } else {
        NSLog(@"Failed to parse XML.");
    }
        
    
    
}
@end
