//
//  flexItemlist.m
//  ComponentKitDemo
//
//  Created by 董其林 on 2024/10/21.
//

#import "flexItemlist.h"
#import "UIColor+Hex.h"
#import <YGLayout.h>
#import "CustomCollectionViewCell.h"
@implementation flexItemlist
- (instancetype)init{
    if (self= [super init]) {
        
    }
    return self;
}
- (instancetype)initWithText:(Listcomponent *)ListModel{
    if (self= [super init]) {
        [self ItemLabinitWithText:ListModel];
    }
    return self;
}
- (void)ItemLabinitWithText:(Listcomponent *)ListModel{
    CGFloat widrh = 0.0;
    CGFloat height = 0.0;
    if (ListModel.width) {
        if ([ListModel.width containsString:@"%"]) {
            widrh = UIScreen.mainScreen.bounds.size.width*([ListModel.width floatValue]/100)  -40;
        }else{
            widrh = YGPointValue([ListModel.width floatValue]).value;
        }
    }else{
        
    }
    if (ListModel.height) {
        if ([ListModel.height containsString:@"%"]) {
            height = UIScreen.mainScreen.bounds.size.height*([ListModel.height floatValue]/100);
        }else{
            height = YGPointValue([ListModel.height floatValue]).value;
        }
    }else{
        
    }
    // 创建布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    if([ListModel.flexDirection isEqualToString: @"column"]){
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    }else{
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
    layout.itemSize = CGSizeMake(UIScreen.mainScreen.bounds.size.width-40, 150);
    layout.minimumLineSpacing = 0; // 行间距
    layout.minimumInteritemSpacing = 0; // 单元格间距
    self.frame = CGRectMake(0, 0, widrh, height);
    self.collectionView = [[flexItemUICollectionView alloc] initWithFrame:CGRectMake(0, 0, widrh, height) collectionViewLayout:layout];
    self.collectionView.listModel = ListModel;
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.pagingEnabled = YES;
    // 注册cell
    [self.collectionView registerClass:[CustomCollectionViewCell class] forCellWithReuseIdentifier:@"MyCell"];
    
    
    if (ListModel.background.length > 0) {
        self.collectionView.backgroundColor = [UIColor colorWithHexString_xt:ListModel.background];
    }else{
        self.collectionView.backgroundColor = [UIColor clearColor];
    }
    self.collectionView.userInteractionEnabled = YES;
    self.collectionView.scrollEnabled = NO;
    // 添加手势识别器
       UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
       [self.collectionView addGestureRecognizer:panGesture];
    
    [self addSubview:self.collectionView];
    
    
    
    
    
}

// 手势处理方法
- (void)handlePan:(UIPanGestureRecognizer *)panGesture {
    CGPoint translation = [panGesture translationInView:self.collectionView];
    
    // 只允许左右滑动
    if (fabs(translation.x) > fabs(translation.y)) {
        if (panGesture.state == UIGestureRecognizerStateEnded) {
            CGFloat cellWidth = UIScreen.mainScreen.bounds.size.width-40; // 单元格宽度
            CGFloat velocity = [panGesture velocityInView:self.collectionView].x;
            NSInteger currentIndex = self.collectionView.contentOffset.x / cellWidth;
            
            if (velocity < 0) {
                currentIndex++; // 向右滑动
            } else if (velocity > 0) {
                currentIndex--; // 向左滑动
            }
            
            // 确保不超出范围
            currentIndex = MAX(0, MIN(currentIndex, [self.collectionView numberOfItemsInSection:0] - 1));
            
            // 滚动到目标位置
            [self.collectionView setContentOffset:CGPointMake(currentIndex * cellWidth, 0) animated:YES];
        }
    }
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyCell" forIndexPath:indexPath];
    cell.titleLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    cell.titleLabel.textColor = [UIColor blackColor];
    cell.titleLabel.font = [UIFont systemFontOfSize:16];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}
@end
