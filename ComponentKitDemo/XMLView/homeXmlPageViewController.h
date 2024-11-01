//
//  homeXmlPageViewController.h
//  ComponentKitDemo
//
//  Created by 董其林 on 2024/10/11.
//

#import <UIKit/UIKit.h>
#import "Flex.h"
#import "FlexJson.h"
NS_ASSUME_NONNULL_BEGIN

@interface homeXmlPageViewController : UIViewController
@property(nonatomic,strong)Flex *rootFlex;
@property(nonatomic,strong)Flex *rootFlexCopy;
@property(nonatomic,assign)bool firstDraw;
@property(nonatomic,strong)UIScrollView *scroll;
@property(nonatomic,strong)UIView *contentView;

@property (nonatomic, strong) NSDictionary *homeJson;
- (void)actionMananger:(UITapGestureRecognizer *)gesture;
- (void)LabactionMananger:(UITapGestureRecognizer *)sender;
@end

NS_ASSUME_NONNULL_END
