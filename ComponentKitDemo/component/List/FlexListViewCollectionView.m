//
//  FlexListViewCollectionView.m
//  ComponentKitDemo
//
//  Created by 董其林 on 2024/10/23.
//

#import "FlexListViewCollectionView.h"

@interface FlexListViewCollectionView ()

@end

@implementation FlexListViewCollectionView

static NSString * const reuseIdentifier = @"Cell";

// 重写初始化方法
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        // 进行自定义配置
        [self setup];
    }
    return self;
}
// 重写初始化方法
- (instancetype)init{
    self = [super init];
    if (self) {
        // 进行自定义配置
        [self setup];
    }
    return self;
}
// 设置自定义配置
- (void)setup {
    //self.backgroundColor = [UIColor lightGrayColor];
    // 其他自定义代码
}

// 可以重写其他方法，例如layoutSubviews
- (void)layoutSubviews {
    [super layoutSubviews];
    // 在这里进行布局调整
}

@end
