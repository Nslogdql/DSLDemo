//
//  FlexListView.h
//  ComponentKitDemo
//
//  Created by 董其林 on 2024/10/23.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Flex.h"
#import "FlexListViewCollectionView.h"
#import "FlexListViewCustomCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface FlexListView :UIView<UICollectionViewDelegate, UICollectionViewDataSource>
@property(nonatomic,strong)FlexListViewCollectionView *collectionView;
@property(nonatomic,strong)UIViewController *actionVC;
@property(nonatomic,strong)Listcomponent *listModel;
@property(nonatomic,strong)NSMutableArray *listModelSource;
@property(nonatomic,strong)UIPageControl *pageControl;
- (instancetype)initWithText:(Listcomponent *)ListModel;

@end

NS_ASSUME_NONNULL_END
