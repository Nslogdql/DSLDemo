//
//  CustomCollectionViewCell.m
//  ComponentKitDemo
//
//  Created by 董其林 on 2024/10/21.
//

#import "CustomCollectionViewCell.h"

@implementation CustomCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // 初始化子视图
        self.titleLabel = [[UILabel alloc] initWithFrame:self.contentView.bounds];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self.contentView addSubview:self.titleLabel];
        
        self.contengIMG = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
        self.contengIMG .contentMode = UIViewContentModeScaleToFill;
        self.contengIMG .backgroundColor = [UIColor clearColor];
        
        [self.contentView addSubview:self.contengIMG ];
        
        // 设置背景色
        self.contentView.backgroundColor = [UIColor clearColor];
    }
    return self;
}
@end
