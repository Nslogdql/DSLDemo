//
//  FlexListView.m
//  ComponentKitDemo
//
//  Created by 董其林 on 2024/10/23.
//

#import "FlexListView.h"
#import "UIColor+Hex.h"
#import <YGLayout.h>
#import "FlexListViewCustomCell.h"
#import <SDWebImage/SDWebImage.h>
#import <SDWebImage/UIImageView+WebCache.h>
@implementation FlexListView
- (instancetype)init{
    if (self= [super init]) {
        
    }
    return self;
}
- (instancetype)initWithText:(Flex *)ListModel{
    if (self= [super init]) {
        [self ItemLabinitWithText:ListModel];
//        _listModelSource = [NSMutableArray array];
    }
    return self;
}
//- (void)setListModelSource:(NSMutableArray *)listModelSource{
//    _listModelSource = listModelSource;
//    [self.collectionView reloadData];
//}
- (void)ItemLabinitWithText:(Flex *)ListModel{
    self.listModel = ListModel;
    self.tag = [ListModel.key integerValue];
//    self.listModelSource = [NSMutableArray arrayWithArray:ListModel.source];
    CGFloat widrh = 0.0;
    CGFloat height = 0.0;
    if (ListModel.width) {
        if ([ListModel.width containsString:@"%"]) {
            widrh = UIScreen.mainScreen.bounds.size.width*([ListModel.width floatValue]/100);
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
    layout.itemSize = CGSizeMake(UIScreen.mainScreen.bounds.size.width, 61);
    layout.minimumLineSpacing = 0; // 行间距
    layout.minimumInteritemSpacing = 0; // 单元格间距
    self.frame = CGRectMake(0, 0, widrh, height);
    self.collectionView = [[FlexListViewCollectionView alloc] initWithFrame:CGRectMake(0, 0, widrh, height) collectionViewLayout:layout];
    self.collectionView.listModel = ListModel;
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.scrollEnabled = NO;
    // 注册cell
    [self.collectionView registerClass:[FlexListViewCustomCell class] forCellWithReuseIdentifier:@"FlexListViewCustomCell"];
    
    
    if (ListModel.background.length > 0) {
        self.collectionView.backgroundColor = [UIColor colorWithHexString_xt:ListModel.background];
    }else{
        self.collectionView.backgroundColor = [UIColor clearColor];
    }
    self.collectionView.userInteractionEnabled = YES;
    self.collectionView.scrollEnabled = NO;
    
    [self addSubview:self.collectionView];
    [self.collectionView registerClass:[FlexListViewCustomCell class] forCellWithReuseIdentifier:@"FlexListViewCustomCell"];
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (self.listModel.source.count > 0) {
        return self.listModel.source.count;
    }
    return 0;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    FlexListViewCustomCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FlexListViewCustomCell" forIndexPath:indexPath];
    cell.rootFlex = self.listModel.FlexorderItem.firstObject;
    cell.cellSource = self.listModel.source[indexPath.row];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了第几个");
}
@end
