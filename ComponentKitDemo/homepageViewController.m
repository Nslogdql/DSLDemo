//
//  homepageViewController.m
//  ComponentKitDemo
//
//  Created by 董其林 on 2024/10/10.
//

#import "homepageViewController.h"
#import <YGLayout.h>
#import <UIView+Yoga.h>
#import "homepageViewController.h"
#import "contextLable.h"
#import "contextviewWithTextStr.h"
#import "UIColor+Hex.h"
@interface homepageViewController ()
@property (nonatomic, strong) YGLayout *yoga;
@end

@implementation homepageViewController

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
        layout.alignItems = YGAlignCenter;
    }];
    
    
    
    UIScrollView *scroll = [[UIScrollView alloc] init];
    //[scroll sizeToFit];
    scroll.scrollEnabled = YES;
    //scroll.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.width*5);
    [scroll configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = YES;
        layout.flexDirection =  YGFlexDirectionColumn;
        layout.marginTop = YGPointValue(0);
        layout.width = YGPointValue(self.view.bounds.size.width);
        layout.height = YGPointValue(self.view.bounds.size.height);
        layout.alignItems = YGAlignCenter;
    }];
    [self.view addSubview: scroll];
    
    UIView *contentView = [[UIView alloc]init];
    [contentView configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = YES;
        layout.flexDirection =  YGFlexDirectionColumn;
       // layout.width = YGPointValue(self.view.bounds.size.width);
        //layout.height = YGPointValue(self.view.bounds.size.height);
        layout.alignItems = YGAlignCenter;
    }];
    [scroll addSubview: contentView];
    
    UIView *banner = [[UIView alloc]init];
    banner.backgroundColor = [UIColor orangeColor];
    [banner configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = true;
        // 4
        layout.flexDirection =  YGFlexDirectionRow;
        layout.width = YGPointValue(self.view.frame.size.width);
        layout.height = YGPointValue(210);
        layout.marginTop = YGPointValue(0);
        layout.padding =  YGPointValue(0);//设置了全部子项目的填充值
    }];
    [contentView addSubview: banner];
    
    
    UIView *daikuan = [[UIView alloc]init];
    daikuan.backgroundColor = [UIColor colorWithRed:223.0/250.0 green:194.0/250.0 blue:173.0/250.0 alpha:1];
    daikuan.layer.cornerRadius = 10;
    [daikuan configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = true;
        layout.flexDirection =  YGFlexDirectionColumn;
        layout.width = YGPointValue(self.view.frame.size.width-50);
        layout.height = YGPointValue(210);
        layout.marginTop = YGPointValue(-45);
        layout.marginLeft = YGPointValue(25);
        layout.marginRight = YGPointValue(25);
        layout.padding =  YGPointValue(0);//设置了全部子项目的填充值
    }];
    [contentView addSubview: daikuan];
    
    UIView *daikuantop = [[UIView alloc]init];
    daikuantop.backgroundColor = [UIColor clearColor];
    daikuantop.layer.cornerRadius = 10;
    [daikuantop configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = true;
        layout.flexDirection =  YGFlexDirectionRow;
        layout.width = YGPercentValue(100);
        layout.height = YGPointValue(30);
        layout.marginTop = YGPointValue(0);
        layout.marginLeft = YGPointValue(0);
        layout.marginRight = YGPointValue(0);
        layout.padding =  YGPointValue(0);//设置了全部子项目的填充值
    }];
    [daikuan addSubview: daikuantop];
    
    UILabel *dmessage = [[UILabel alloc] init];
    dmessage.text = @"贷款";
    dmessage.textAlignment = NSTextAlignmentCenter;
    dmessage.font = [UIFont systemFontOfSize:18];
    dmessage.backgroundColor = [UIColor clearColor];
    dmessage.textColor = [UIColor orangeColor];
    [dmessage configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = true;
        layout.flexDirection =  YGFlexDirectionColumn;
        layout.height = YGPointValue(30);
        layout.width = YGPointValue(50);
        layout.marginTop = YGPointValue(0);
        layout.marginLeft = YGPointValue(5);
        layout.padding =  YGPointValue(0);//设置了全部子项目的填充值
    }];
    [daikuantop addSubview: dmessage];
    
    UILabel *d2message = [[UILabel alloc] init];
    d2message.text = @"让生活更美好";
    d2message.font = [UIFont systemFontOfSize:14];
    d2message.backgroundColor = [UIColor clearColor];
    d2message.textColor = [UIColor orangeColor];
    [d2message configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = true;
        layout.flexDirection =  YGFlexDirectionRow;
        layout.flexGrow = 1;
        layout.height = YGPointValue(30);
        layout.marginTop = YGPointValue(0);
        layout.marginLeft = YGPointValue(10);
        layout.padding =  YGPointValue(0);//设置了全部子项目的填充值
    }];
    [daikuantop addSubview: d2message];
    
    
    UIView *daikuancontent = [[UIView alloc]init];
    daikuancontent.backgroundColor = [UIColor whiteColor];
    daikuancontent.layer.cornerRadius = 10;
    [daikuancontent configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = true;
        layout.flexDirection =  YGFlexDirectionColumn;
        layout.width = YGPercentValue(90);
        layout.height = YGPointValue(150);
        layout.marginTop = YGPointValue(0);
        layout.marginLeft = YGPercentValue(5);
        layout.marginRight = YGPointValue(0);
        layout.padding =  YGPointValue(0);//设置了全部子项目的填充值
    }];
    [daikuan addSubview: daikuancontent];
    
    
    UIView *contenttop = [[UIView alloc]init];
    contenttop.backgroundColor = [UIColor whiteColor];
    contenttop.layer.cornerRadius = 10;
    [contenttop configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = true;
        layout.flexDirection =  YGFlexDirectionRow;
        layout.width = YGPercentValue(90);
        layout.height = YGPercentValue(50);
        layout.marginTop = YGPointValue(0);
        layout.marginLeft = YGPercentValue(0);
        layout.marginRight = YGPointValue(0);
        layout.padding =  YGPointValue(0);//设置了全部子项目的填充值
    }];
    [daikuancontent addSubview: contenttop];
    
    UIImageView *contenttopIccon = [[UIImageView alloc]init];
    contenttopIccon.backgroundColor = [UIColor clearColor];
    contenttopIccon.image = [UIImage imageNamed:@"logo_baiyedai.6e43a09"];
    contenttopIccon.contentMode = UIViewContentModeScaleAspectFill;
    [contenttopIccon configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = true;
        layout.flexDirection =  YGFlexDirectionColumn;
        layout.width = YGPointValue(25);
        layout.height = YGPointValue(25);
        layout.marginTop = YGPointValue(30);
        layout.marginLeft = YGPointValue(30);
        layout.padding =  YGPointValue(0);//设置了全部子项目的填充值
    }];
    [contenttop addSubview: contenttopIccon];
    
    
    UIView *contentmessage = [[UIView alloc]init];
    contentmessage.backgroundColor = [UIColor clearColor];
    [contentmessage configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = true;
        layout.flexDirection =  YGFlexDirectionColumn;
        layout.flexGrow = 1;
        layout.height = YGPointValue(120);
        layout.marginTop = YGPointValue(0);
        layout.marginLeft = YGPointValue(15);
        layout.padding =  YGPointValue(0);//设置了全部子项目的填充值
    }];
    [contenttop addSubview: contentmessage];
    
    UILabel *contenttip = [[UILabel alloc] init];
    contenttip.text = @"百业贷";
    contenttip.backgroundColor = [UIColor clearColor];
    contenttip.font = [UIFont systemFontOfSize:14];
    [contenttip configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = true;
        layout.flexDirection =  YGFlexDirectionColumn;
        layout.height = YGPointValue(20);
        layout.marginTop = YGPointValue(20);
        layout.marginLeft = YGPointValue(5);
        layout.padding =  YGPointValue(0);//设置了全部子项目的填充值
    }];
    [contentmessage addSubview: contenttip];
    
    UILabel *contenttipmessage = [[UILabel alloc] init];
//    contenttipmessage.numberOfLines = 0;
    contenttipmessage.text = @"企业信用借款，最高授信100万元";
    contenttipmessage.font = [UIFont systemFontOfSize:15];
    contenttipmessage.backgroundColor = [UIColor clearColor];
    [contenttipmessage configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = true;
        layout.flexDirection =  YGFlexDirectionColumn;
//        layout.height = YGPointValue(20);
        layout.flexGrow = 0.5;
        layout.width = YGPercentValue(90);
        layout.marginTop = YGPointValue(0);
        layout.marginLeft = YGPointValue(5);
        layout.padding =  YGPointValue(0);//设置了全部子项目的填充值
    }];
    [contentmessage addSubview: contenttipmessage];
    
    
    
    
    
    UIView *contentbottom = [[UIView alloc]init];
    contentbottom.backgroundColor = [UIColor whiteColor];
    contentbottom.layer.cornerRadius = 10;
    [contentbottom configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = true;
        layout.flexDirection =  YGFlexDirectionRow;
        layout.width = YGPercentValue(90);
        layout.height = YGPercentValue(50);
        layout.marginTop = YGPointValue(0);
        layout.marginLeft = YGPercentValue(0);
        layout.marginRight = YGPointValue(0);
        layout.padding =  YGPointValue(0);//设置了全部子项目的填充值
    }];
    [daikuancontent addSubview: contentbottom];
    
    UIImageView *contentbottomIccon = [[UIImageView alloc]init];
    contentbottomIccon.backgroundColor = [UIColor clearColor];
    contentbottomIccon.image = [UIImage imageNamed:@"logo_baoshidai.116d1c6"];
    contentbottomIccon.contentMode = UIViewContentModeScaleAspectFill;
    [contentbottomIccon configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = true;
        layout.flexDirection =  YGFlexDirectionColumn;
        layout.width = YGPointValue(25);
        layout.height = YGPointValue(25);
        layout.marginTop = YGPointValue(30);
        layout.marginLeft = YGPointValue(30);
        layout.padding =  YGPointValue(0);//设置了全部子项目的填充值
    }];
    [contentbottom addSubview: contentbottomIccon];

    
    UIView *contentbottommessage = [[UIView alloc]init];
    contentbottommessage.backgroundColor = [UIColor clearColor];
    [contentbottommessage configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = true;
        layout.flexDirection =  YGFlexDirectionColumn;
        layout.height = YGPercentValue(100);
        layout.marginTop = YGPointValue(0);
        layout.marginLeft = YGPointValue(15);
        layout.padding =  YGPointValue(0);//设置了全部子项目的填充值
    }];
    [contentbottom addSubview: contentbottommessage];

    UILabel *contentbottomtip = [[UILabel alloc] init];
    contentbottomtip.text = @"宝石贷";
    contentbottomtip.backgroundColor = [UIColor clearColor];
    contentbottomtip.font = [UIFont systemFontOfSize:14];
    [contentbottomtip configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = true;
        layout.flexDirection =  YGFlexDirectionColumn;
        layout.height = YGPointValue(15);
        layout.marginTop = YGPointValue(20);
        layout.marginLeft = YGPointValue(5);
        layout.padding =  YGPointValue(0);//设置了全部子项目的填充值
    }];
    [contentbottommessage addSubview: contentbottomtip];

    UILabel *contentbottomtipmessage = [[UILabel alloc] init];
    contentbottomtipmessage.text = @"个人信用借款，最高授信20万元";
    contentbottomtipmessage.numberOfLines = 0;
    contentbottomtipmessage.font = [UIFont systemFontOfSize:15];
    contentbottomtipmessage.backgroundColor = [UIColor clearColor];
    [contentbottomtipmessage configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = true;
        layout.flexDirection =  YGFlexDirectionColumn;
//        layout.height = YGPointValue(20);
        layout.flexGrow = 1;
        layout.width = YGPercentValue(90);
        layout.marginTop = YGPointValue(0);
        layout.marginLeft = YGPointValue(5);
        layout.padding =  YGPointValue(0);//设置了全部子项目的填充值
    }];
    [contentbottommessage addSubview: contentbottomtipmessage];
    
    
    
    
    
#pragma mark--杭小宝
    
    UIView *hangxiaobao = [[UIView alloc]init];
    hangxiaobao.backgroundColor = [UIColor colorWithRed:202.0/250.0 green:222.0/250.0 blue:231.0/250.0 alpha:1];
    hangxiaobao.layer.cornerRadius = 10;
    [hangxiaobao configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = true;
        layout.flexDirection =  YGFlexDirectionRow;
        layout.width = YGPointValue(self.view.frame.size.width-50);
        layout.height = YGPointValue(120);
        layout.marginTop = YGPointValue(20);
        layout.marginLeft = YGPointValue(25);
        layout.marginRight = YGPointValue(25);
        layout.padding =  YGPointValue(0);//设置了全部子项目的填充值
    }];
    [contentView addSubview: hangxiaobao];
    
    UIImageView *hangIccon = [[UIImageView alloc]init];
    hangIccon.backgroundColor = [UIColor clearColor];
    hangIccon.image = [UIImage imageNamed:@"hangxiaobao_logo"];
    hangIccon.contentMode = UIViewContentModeScaleAspectFill;
    [hangIccon configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = true;
        layout.flexDirection =  YGFlexDirectionColumn;
        layout.width = YGPointValue(60);
        layout.height = YGPointValue(60);
        layout.marginTop = YGPointValue(30);
        layout.marginLeft = YGPointValue(30);
        layout.padding =  YGPointValue(0);//设置了全部子项目的填充值
    }];
    [hangxiaobao addSubview: hangIccon];
    
    
    UIView *hangcontent = [[UIView alloc]init];
    hangcontent.backgroundColor = [UIColor clearColor];
    [hangcontent configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = true;
        layout.flexDirection =  YGFlexDirectionColumn;
        layout.flexGrow = 1;
        layout.height = YGPointValue(120);
        layout.marginTop = YGPointValue(0);
        layout.marginLeft = YGPointValue(15);
        layout.padding =  YGPointValue(0);//设置了全部子项目的填充值
    }];
    [hangxiaobao addSubview: hangcontent];
    
    UILabel *tip = [[UILabel alloc] init];
    tip.text = @"下午好~";
    tip.backgroundColor = [UIColor clearColor];
    tip.font = [UIFont systemFontOfSize:14];
    [tip configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = true;
        layout.flexDirection =  YGFlexDirectionColumn;
        layout.flexGrow = 1;
        layout.height = YGPointValue(15);
        layout.marginTop = YGPointValue(20);
        layout.marginLeft = YGPointValue(5);
        layout.padding =  YGPointValue(0);//设置了全部子项目的填充值
    }];
    [hangcontent addSubview: tip];
    
    UILabel *tipmessage = [[UILabel alloc] init];
    tipmessage.text = @"杭小宝给您发了一条信息";
    tipmessage.font = [UIFont systemFontOfSize:15];
    tipmessage.backgroundColor = [UIColor clearColor];
    [tipmessage configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = true;
        layout.flexDirection =  YGFlexDirectionColumn;
        layout.flexGrow = 1;
        layout.height = YGPointValue(20);
        layout.marginTop = YGPointValue(0);
        layout.marginLeft = YGPointValue(5);
        layout.padding =  YGPointValue(0);//设置了全部子项目的填充值
    }];
    [hangcontent addSubview: tipmessage];
    
    
#pragma mark--大家都在买
    
    UIView *licai = [[UIView alloc]init];
    licai.backgroundColor = [UIColor whiteColor];
    licai.layer.cornerRadius = 10;
    [licai configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = true;
        layout.flexDirection =  YGFlexDirectionRow;
        layout.width = YGPointValue(self.view.frame.size.width);
        layout.height = YGPointValue(210);
        layout.marginTop = YGPointValue(20);
        layout.marginLeft = YGPointValue(0);
        layout.marginRight = YGPointValue(0);
        layout.padding =  YGPointValue(0);//设置了全部子项目的填充值
    }];
    [contentView addSubview: licai];
    
    
    
    UIView *usbuy = [[UIView alloc]init];
    usbuy.backgroundColor = [UIColor whiteColor];
    [usbuy configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = true;
        layout.flexDirection =  YGFlexDirectionColumn;
        layout.width = YGPointValue(self.view.frame.size.width/2);
        layout.height = YGPointValue(200);
        layout.marginTop = YGPointValue(10);
        layout.marginLeft = YGPointValue(0);
        layout.padding =  YGPointValue(0);//设置了全部子项目的填充值
    }];
    [licai addSubview: usbuy];
    
    
    UIView *star = [[UIView alloc]init];
    star.backgroundColor = [UIColor whiteColor];
    [star configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = true;
        layout.flexDirection =  YGFlexDirectionColumn;
        layout.width = YGPointValue(self.view.frame.size.width/2);
        layout.height = YGPointValue(200);
        layout.marginTop = YGPointValue(10);
        layout.marginRight = YGPointValue(0);
        layout.padding =  YGPointValue(0);//设置了全部子项目的填充值
    }];
    [licai addSubview: star];
    
    
    
    
    
    UIView *usbuycontent = [[UIView alloc]init];
    usbuycontent.backgroundColor = [UIColor colorWithRed:202.0/250.0 green:222.0/250.0 blue:231.0/250.0 alpha:1];
    [usbuycontent configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = true;
        layout.flexDirection =  YGFlexDirectionColumn;
        layout.width = YGPointValue(self.view.frame.size.width/2-35);
        layout.height = YGPointValue(180);
        layout.marginTop = YGPointValue(10);
        layout.marginLeft = YGPointValue(25);
        layout.padding =  YGPointValue(0);//设置了全部子项目的填充值
    }];
    [usbuy addSubview: usbuycontent];
    
    contextviewWithTextStr *usbuytitle = [[contextviewWithTextStr alloc]init];
    usbuytitle.label.text = @"大家都在买";
    usbuytitle.backgroundColor = [UIColor blueColor];
    usbuytitle.label.textAlignment = NSTextAlignmentCenter;
    usbuytitle.label.textColor = [UIColor whiteColor];
    usbuytitle.label.font = [UIFont systemFontOfSize:16];
    [usbuytitle configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = true;
        layout.flexDirection =  YGFlexDirectionRow;
        layout.width = YGPointValue(100);
        layout.height = YGPointValue(30);
        layout.marginTop = YGPointValue(-20);
        layout.marginLeft = YGPointValue(20);
        layout.padding =  YGPointValue(0);//设置了全部子项目的填充值
    }];
    [usbuycontent addSubview: usbuytitle];
    
    
    
    
    
    UIView *starcontent = [[UIView alloc]init];
    starcontent.backgroundColor = [UIColor colorWithRed:202.0/250.0 green:222.0/250.0 blue:231.0/250.0 alpha:1];
    [starcontent configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = true;
        layout.flexDirection =  YGFlexDirectionColumn;
        layout.width = YGPointValue(self.view.frame.size.width/2-35);
        layout.height = YGPointValue(180);
        layout.marginTop = YGPointValue(10);
        layout.marginLeft = YGPointValue(10);
        layout.padding =  YGPointValue(0);//设置了全部子项目的填充值
    }];
    [star addSubview: starcontent];
    
    contextviewWithTextStr *startitle = [[contextviewWithTextStr alloc]init];
    startitle.label.text = @"明星理财榜";
    startitle.backgroundColor = [UIColor orangeColor];
    startitle.label.textAlignment = NSTextAlignmentCenter;
    startitle.label.textColor = [UIColor whiteColor];
    startitle.label.font = [UIFont systemFontOfSize:16];
    [startitle configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = true;
        layout.flexDirection =  YGFlexDirectionRow;
        layout.width = YGPointValue(100);
        layout.height = YGPointValue(30);
        layout.marginTop = YGPointValue(-20);
        layout.marginLeft = YGPointValue(20);
        layout.padding =  YGPointValue(0);//设置了全部子项目的填充值
    }];
    [starcontent addSubview: startitle];
    
#pragma mark--24小时导师
    
    UIImageView *daoshi = [[UIImageView alloc]init];
    daoshi.backgroundColor = [UIColor whiteColor];
    daoshi.image = [UIImage imageNamed:@"local-daoshi"];
    daoshi.contentMode = UIViewContentModeScaleAspectFill;
    [daoshi configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = true;
        layout.flexDirection =  YGFlexDirectionColumn;
        layout.width = YGPointValue(self.view.frame.size.width-100);
        layout.height = YGPointValue(80);
        layout.marginTop = YGPointValue(10);
        layout.marginLeft = YGPointValue(0);
        layout.padding =  YGPointValue(0);//设置了全部子项目的填充值
    }];
    [contentView addSubview: daoshi];
    
#pragma mark--热门活动
    UIView *remenhuodong = [[UIView alloc]init];
    remenhuodong.backgroundColor = [UIColor whiteColor];
    [remenhuodong configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = true;
        layout.flexDirection =  YGFlexDirectionColumn;
        layout.width = YGPointValue(self.view.frame.size.width);
        layout.height = YGPointValue(260);
        layout.marginTop = YGPointValue(20);
        layout.marginLeft = YGPointValue(0);
        layout.marginRight = YGPointValue(0);
        layout.padding =  YGPointValue(0);//设置了全部子项目的填充值
    }];
    [contentView addSubview: remenhuodong];
    
    
    UIView *remenhuodongtop = [[UIView alloc]init];
    remenhuodongtop.backgroundColor = [UIColor whiteColor];
    [remenhuodongtop configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = true;
        layout.flexDirection =  YGFlexDirectionRow;
        layout.width = YGPointValue(self.view.frame.size.width);
        layout.height = YGPointValue(80);
        layout.marginTop = YGPointValue(10);
        layout.marginLeft = YGPointValue(0);
        layout.marginRight = YGPointValue(0);
        layout.padding =  YGPointValue(0);//设置了全部子项目的填充值
    }];
    [remenhuodong addSubview: remenhuodongtop];
    
    UILabel *remenhuodongtitle = [contextLable initWithText:@"热门活动"];
    remenhuodongtitle.textColor = [UIColor blackColor];
    remenhuodongtitle.font = [UIFont systemFontOfSize:16];
    remenhuodongtitle.textAlignment = NSTextAlignmentLeft;
    remenhuodongtitle.backgroundColor = [UIColor whiteColor];
    [remenhuodongtitle configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = true;
        layout.flexDirection =  YGFlexDirectionColumn;
        layout.width = YGPointValue(self.view.frame.size.width/2-25);
        layout.height = YGPointValue(60);
        layout.marginTop = YGPointValue(20);
        layout.marginLeft = YGPointValue(25);
        layout.padding =  YGPointValue(0);//设置了全部子项目的填充值
    }];
    [remenhuodongtop addSubview: remenhuodongtitle];
    
    UILabel *remenhuodongmore = [contextLable initWithText:@"更多"];
    remenhuodongmore.textColor = [UIColor lightGrayColor];
    remenhuodongmore.font = [UIFont systemFontOfSize:14];
    remenhuodongmore.textAlignment = NSTextAlignmentRight;
    remenhuodongmore.backgroundColor = [UIColor whiteColor];
    [remenhuodongmore configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = true;
        layout.flexDirection =  YGFlexDirectionColumn;
        layout.width = YGPointValue(self.view.frame.size.width/2-25);
        layout.height = YGPointValue(60);
        layout.marginTop = YGPointValue(20);
        layout.marginRight = YGPointValue(25);
        layout.padding =  YGPointValue(0);//设置了全部子项目的填充值
    }];
    [remenhuodongtop addSubview: remenhuodongmore];
    
    
    
    NSArray *huodongarr = [NSArray arrayWithObjects:@[@"每日签到测试一下基础功能",@"每日签到获取1mg积分"],@[@"人脉财主",@"每邀请一位新朋友获取30积分"],@[@"宝石会员",@"购买任意理财产品获得30积分"] ,nil];
    
    for (int i = 0;i <huodongarr.count;i++ ) {
        NSArray *strarr = huodongarr[i];
        
        UIView *contentbox = [[UIView alloc]init];
        contentbox.backgroundColor = [UIColor whiteColor];
        [contentbox configureLayoutWithBlock:^(YGLayout * layout) {
            layout.isEnabled = true;
            layout.flexDirection =  YGFlexDirectionColumn;
            layout.width = YGPointValue(self.view.frame.size.width);
            layout.height = YGPointValue(50);
            layout.marginTop = YGPointValue(0);
            //layout.alignItems = YGAlignSpaceBetween;
            layout.justifyContent =YGJustifySpaceBetween;
            layout.marginLeft = YGPointValue(0);
            layout.marginRight = YGPointValue(0);
            layout.padding =  YGPointValue(0);//设置了全部子项目的填充值
        }];
        [remenhuodong addSubview: contentbox];
        
        UIView *contentView = [[UIView alloc]init];
        contentView.backgroundColor = [UIColor whiteColor];
        [contentView configureLayoutWithBlock:^(YGLayout * layout) {
            layout.isEnabled = true;
            layout.flexDirection =  YGFlexDirectionRow;
            layout.width = YGPercentValue(100);
            layout.height = YGPercentValue(99);
            layout.marginTop = YGPointValue(0);
            //layout.alignItems = YGAlignSpaceBetween;
            layout.marginLeft = YGPointValue(0);
            layout.marginRight = YGPointValue(0);
            layout.padding =  YGPointValue(0);//设置了全部子项目的填充值
        }];
        [contentbox addSubview: contentView];
        
        UIImageView *huodongicon = [[UIImageView alloc]init];
        huodongicon.backgroundColor = [UIColor whiteColor];
        huodongicon.image = [UIImage imageNamed:@"wERGk2MQI-GAPtjMAAAP3ZmTxIM649"];
        huodongicon.contentMode = UIViewContentModeScaleAspectFill;
        [huodongicon configureLayoutWithBlock:^(YGLayout * layout) {
            layout.isEnabled = true;
            layout.flexDirection =  YGFlexDirectionColumn;
            layout.width = YGPointValue(25);
            layout.height = YGPointValue(25);
            layout.marginTop = YGPointValue(10);
            layout.marginLeft = YGPointValue(10);
            layout.padding =  YGPointValue(0);//设置了全部子项目的填充值
        }];
        [contentView addSubview: huodongicon];
        
        
        UIView *contenthuodong = [[UIView alloc]init];
        contenthuodong.backgroundColor = [UIColor whiteColor];
        [contenthuodong configureLayoutWithBlock:^(YGLayout * layout) {
            layout.isEnabled = true;
            layout.flexDirection =  YGFlexDirectionColumn;
            layout.width = YGPercentValue(70);
            layout.height = YGPercentValue(99);
            layout.marginTop = YGPointValue(0);
            //layout.alignItems = YGAlignSpaceBetween;
            layout.marginLeft = YGPointValue(0);
            layout.marginRight = YGPointValue(0);
            layout.padding =  YGPointValue(0);//设置了全部子项目的填充值
        }];
        [contentView addSubview: contenthuodong];
        
        UILabel *huodongtitlename = [contextLable initWithText:strarr[0]];
        huodongtitlename.textColor = [UIColor blackColor];
        huodongtitlename.font = [UIFont systemFontOfSize:18];
        huodongtitlename.textAlignment = NSTextAlignmentLeft;
        huodongtitlename.backgroundColor = [UIColor clearColor];
        huodongtitlename.numberOfLines = 0;
        [huodongtitlename configureLayoutWithBlock:^(YGLayout * layout) {
            layout.isEnabled = true;
            layout.flexDirection =  YGFlexDirectionColumn;
            layout.width = YGPercentValue(100);
            layout.height = YGPercentValue(50);
            layout.marginTop = YGPointValue(0);
            layout.marginLeft = YGPointValue(10);
            layout.padding =  YGPointValue(0);//设置了全部子项目的填充值
        }];
        [contenthuodong addSubview: huodongtitlename];
        
        UILabel *huodongtitlenameB = [contextLable initWithText:strarr[1]];
        huodongtitlenameB.textColor = [UIColor grayColor];
        huodongtitlenameB.font = [UIFont systemFontOfSize:15];
        huodongtitlenameB.textAlignment = NSTextAlignmentLeft;
        huodongtitlenameB.backgroundColor = [UIColor clearColor];
        huodongtitlenameB.numberOfLines = 0;
        [huodongtitlenameB configureLayoutWithBlock:^(YGLayout * layout) {
            layout.isEnabled = true;
            layout.flexDirection =  YGFlexDirectionColumn;
            layout.width = YGPercentValue(100);
            layout.height = YGPercentValue(50);
            layout.marginTop = YGPointValue(0);
            layout.marginLeft = YGPointValue(10);
            layout.padding =  YGPointValue(0);//设置了全部子项目的填充值
        }];
        [contenthuodong addSubview: huodongtitlenameB];
        
        
        
        
        UIView *lineview = [[UIView alloc]init];
        lineview.backgroundColor = [UIColor whiteColor];
        [lineview configureLayoutWithBlock:^(YGLayout * layout) {
            layout.isEnabled = true;
            layout.flexDirection =  YGFlexDirectionColumn;
            layout.width = YGPercentValue(80);
            layout.height = YGPointValue(1);
            layout.marginTop = YGPercentValue(99);
            layout.justifyContent =YGJustifySpaceBetween;
            layout.marginLeft = YGPercentValue(20);
            layout.padding =  YGPointValue(0);//设置了全部子项目的填充值
        }];
        [contentbox addSubview: lineview];
        
        
        
    }
    
    
    
    
#pragma mark--工具箱
    
    
    
    UIView *gongjuxiang = [[UIView alloc]init];
    gongjuxiang.backgroundColor = [UIColor whiteColor];
    [gongjuxiang configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = true;
        layout.flexDirection =  YGFlexDirectionColumn;
        layout.width = YGPointValue(self.view.frame.size.width);
        layout.height = YGPointValue(350);
        layout.marginTop = YGPointValue(20);
        layout.marginLeft = YGPointValue(0);
        layout.marginRight = YGPointValue(0);
        layout.padding =  YGPointValue(0);//设置了全部子项目的填充值
    }];
    [contentView addSubview: gongjuxiang];
    
    
    UIView *top = [[UIView alloc]init];
    top.backgroundColor = [UIColor whiteColor];
    [top configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = true;
        layout.flexDirection =  YGFlexDirectionRow;
        layout.width = YGPointValue(self.view.frame.size.width);
        layout.height = YGPointValue(80);
        layout.marginTop = YGPointValue(10);
        layout.marginLeft = YGPointValue(0);
        layout.marginRight = YGPointValue(0);
        layout.padding =  YGPointValue(0);//设置了全部子项目的填充值
    }];
    [gongjuxiang addSubview: top];
    
    UILabel *title = [contextLable initWithText:@"宝石山工具箱"];
    title.textColor = [UIColor blackColor];
    title.font = [UIFont systemFontOfSize:16];
    title.textAlignment = NSTextAlignmentLeft;
    title.backgroundColor = [UIColor whiteColor];
    [title configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = true;
        layout.flexDirection =  YGFlexDirectionColumn;
        layout.width = YGPointValue(self.view.frame.size.width/2-25);
        layout.height = YGPointValue(60);
        layout.marginTop = YGPointValue(20);
        layout.marginLeft = YGPointValue(25);
        layout.padding =  YGPointValue(0);//设置了全部子项目的填充值
    }];
    [top addSubview: title];
    
    UILabel *more = [contextLable initWithText:@"更多工具"];
    more.textColor = [UIColor lightGrayColor];
    more.font = [UIFont systemFontOfSize:14];
    more.textAlignment = NSTextAlignmentRight;
    more.backgroundColor = [UIColor whiteColor];
    [more configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = true;
        layout.flexDirection =  YGFlexDirectionColumn;
        layout.width = YGPointValue(self.view.frame.size.width/2-25);
        layout.height = YGPointValue(60);
        layout.marginTop = YGPointValue(20);
        layout.marginRight = YGPointValue(25);
        layout.padding =  YGPointValue(0);//设置了全部子项目的填充值
    }];
    [top addSubview: more];
    NSArray *arr = [NSArray arrayWithObjects:@[@"购房保证金",@"房贷计算器"],@[@"公积金查询",@"信用卡还贷"],@[@"活动日历",@"小程序"] ,nil];
    
    for (int i = 0;i <arr.count;i++ ) {
        NSArray *strarr = arr[i];
        UIView *contentbox = [[UIView alloc]init];
        contentbox.backgroundColor = [UIColor whiteColor];
        [contentbox configureLayoutWithBlock:^(YGLayout * layout) {
            layout.isEnabled = true;
            layout.flexDirection =  YGFlexDirectionRow;
            layout.width = YGPointValue(self.view.frame.size.width);
            layout.height = YGPointValue(80);
            layout.marginTop = YGPointValue(0);
            //layout.alignItems = YGAlignSpaceBetween;
            layout.justifyContent =YGJustifySpaceBetween;
            layout.marginLeft = YGPointValue(0);
            layout.marginRight = YGPointValue(0);
            layout.padding =  YGPointValue(0);//设置了全部子项目的填充值
        }];
        [gongjuxiang addSubview: contentbox];
        
        
        UIView *contentbox1 = [[UIView alloc]init];
        contentbox1.backgroundColor = [UIColor grayColor];
        [contentbox1 configureLayoutWithBlock:^(YGLayout * layout) {
            layout.isEnabled = true;
            layout.flexDirection =  YGFlexDirectionRow;
            layout.width = YGPointValue(self.view.frame.size.width/2-25*2);
            layout.height = YGPointValue(80);
            layout.marginTop = YGPointValue(10);
            layout.marginLeft = YGPointValue(25);
            layout.marginRight = YGPointValue(25);
            layout.padding =  YGPointValue(0);//设置了全部子项目的填充值
        }];
        [contentbox addSubview: contentbox1];
        UILabel *titlename = [contextLable initWithText:strarr[0]];
        titlename.textColor = [UIColor blackColor];
        titlename.font = [UIFont systemFontOfSize:16];
        titlename.textAlignment = NSTextAlignmentLeft;
        titlename.backgroundColor = [UIColor clearColor];
        [titlename configureLayoutWithBlock:^(YGLayout * layout) {
            layout.isEnabled = true;
            layout.flexDirection =  YGFlexDirectionColumn;
            layout.width = YGPointValue(self.view.frame.size.width/2-25*2-20);
            layout.height = YGPointValue(80);
            layout.marginTop = YGPointValue(0);
            layout.marginLeft = YGPointValue(20);
            layout.padding =  YGPointValue(0);//设置了全部子项目的填充值
        }];
        [contentbox1 addSubview: titlename];
        
        UIView *contentbox2 = [[UIView alloc]init];
        contentbox2.backgroundColor = [UIColor grayColor];
        [contentbox2 configureLayoutWithBlock:^(YGLayout * layout) {
            layout.isEnabled = true;
            layout.flexDirection =  YGFlexDirectionRow;
            layout.width = YGPointValue(self.view.frame.size.width/2-25*2);
            layout.height = YGPointValue(80);
            layout.marginTop = YGPointValue(10);
            layout.marginRight = YGPointValue(25);
            layout.marginRight = YGPointValue(25);
            layout.padding =  YGPointValue(0);//设置了全部子项目的填充值
        }];
        [contentbox addSubview: contentbox2];
        UILabel *titlename2 = [contextLable initWithText:strarr[1]];
        titlename2.textColor = [UIColor blackColor];
        titlename2.font = [UIFont systemFontOfSize:16];
        titlename2.textAlignment = NSTextAlignmentLeft;
        titlename2.backgroundColor = [UIColor clearColor];
        [titlename2 configureLayoutWithBlock:^(YGLayout * layout) {
            layout.isEnabled = true;
            layout.flexDirection =  YGFlexDirectionColumn;
            layout.width = YGPointValue(self.view.frame.size.width/2-25*2-20);
            layout.height = YGPointValue(80);
            layout.marginTop = YGPointValue(0);
            layout.marginLeft = YGPointValue(20);
            layout.padding =  YGPointValue(0);//设置了全部子项目的填充值
        }];
        [contentbox2 addSubview: titlename2];
        
    }
    
    
    
    contextviewWithTextStr *tousutitle = [[contextviewWithTextStr alloc]init];
    tousutitle.bounds = CGRectMake(0, 0, self.view.frame.size.width-40, 30);
    tousutitle.label.text = @"客户投诉指南";
    tousutitle.backgroundColor = [UIColor orangeColor];
    tousutitle.label.textAlignment = NSTextAlignmentCenter;
    tousutitle.label.textColor = [UIColor whiteColor];
    tousutitle.label.font = [UIFont systemFontOfSize:18];
    [tousutitle configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = true;
        layout.flexDirection =  YGFlexDirectionRow;
        layout.width = YGPointValue(self.view.frame.size.width-40);
        layout.height = YGPointValue(30);
        layout.marginTop = YGPointValue(20);
        layout.marginLeft = YGPointValue(20);
        layout.padding =  YGPointValue(0);//设置了全部子项目的填充值
    }];
    [contentView addSubview: tousutitle];
    
    
    
    
    //[self.view.yoga applyLayoutPreservingOrigin:YES];
    [scroll.yoga applyLayoutPreservingOrigin:YES];
    // 设置 UIScrollView 的 contentSize
    scroll.contentSize = CGSizeMake(contentView.bounds.size.width, contentView.bounds.size.height+88); // 手动设置 contentSize
}



@end
