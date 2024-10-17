//
//  homeXmlPageViewController.h
//  ComponentKitDemo
//
//  Created by 董其林 on 2024/10/11.
//

#import <UIKit/UIKit.h>
#import "Flex.h"
NS_ASSUME_NONNULL_BEGIN

@interface homeXmlPageViewController : UIViewController
@property(nonatomic,strong)Flex *rootFlex;
@property(nonatomic,strong)UIScrollView *scroll;
@property(nonatomic,strong)UIView *contentView;
- (void)addheight:(UITapGestureRecognizer *)gesture;
@end

NS_ASSUME_NONNULL_END
