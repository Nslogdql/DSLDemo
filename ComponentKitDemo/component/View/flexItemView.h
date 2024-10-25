//
//  flexItemView.h
//  ComponentKitDemo
//
//  Created by 董其林 on 2024/10/16.
//

#import <UIKit/UIKit.h>
#import "Flex.h"
NS_ASSUME_NONNULL_BEGIN

@interface flexItemView : UIView
@property(nonatomic,strong)Flex *flexModel;
@property(nonatomic,strong)UIViewController *actionVC;
- (instancetype)initWith:(Flex *)FlexModel;
@end

NS_ASSUME_NONNULL_END
