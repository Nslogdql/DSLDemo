//
//  flexItemlist.h
//  ComponentKitDemo
//
//  Created by 董其林 on 2024/10/21.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Flex.h"
#import "flexItemUICollectionView.h"
NS_ASSUME_NONNULL_BEGIN

@interface flexItemlist : UIView<UICollectionViewDelegate, UICollectionViewDataSource>
@property(nonatomic,strong)flexItemUICollectionView *collectionView;
@property(nonatomic,strong)UIViewController *actionVC;
@property(nonatomic,strong)Bannercomponent *listModel;
@property(nonatomic,strong)NSMutableArray *listModelSource;
@property(nonatomic,strong)UIPageControl *pageControl;
- (instancetype)initWithText:(Bannercomponent *)ListModel;
@end

NS_ASSUME_NONNULL_END
