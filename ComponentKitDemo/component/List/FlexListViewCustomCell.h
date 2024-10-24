//
//  FlexListViewCustomCell.h
//  ComponentKitDemo
//
//  Created by 董其林 on 2024/10/23.
//

#import <UIKit/UIKit.h>
#import "Flex.h"
NS_ASSUME_NONNULL_BEGIN

@interface FlexListViewCustomCell : UICollectionViewCell
@property(nonatomic,strong)Flex *rootFlex;
@property(nonatomic,strong)UIView *contentview;
@property(nonatomic,strong)UIViewController *actionVC;
@property(nonatomic,strong)NSDictionary *cellSource;

@property(nonatomic,strong)UIImageView *icon;
@property(nonatomic,strong)UILabel *contentname;
@property(nonatomic,strong)UILabel *contenttitle;
@property(nonatomic,strong)UILabel *canjialab;
@end

NS_ASSUME_NONNULL_END
