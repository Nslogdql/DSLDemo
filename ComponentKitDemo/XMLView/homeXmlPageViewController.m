//
//  homeXmlPageViewController.m
//  ComponentKitDemo
//
//  Created by 董其林 on 2024/10/11.
//

#import "homeXmlPageViewController.h"
#import <YGLayout.h>
#import <UIView+Yoga.h>
#import "homepageViewController.h"
#import "contextLable.h"
#import "contextviewWithTextStr.h"
#import "UIColor+Hex.h"
#import "flexItemLab.h"
#import "flexItemIMG.h"
#import "flexItemBtn.h"
#import "UIColor+Hex.h"
#import "flexItemLable.h"
#import "flexItemBtn.h"
#import "flexItemButton.h"
#import "flexItemlist.h"
#import "flexItemUICollectionView.h"
#import "Flex.h"
#import "CustomCollectionViewCell.h"
#import "SecondCustomViewController.h"
@interface homeXmlPageViewController ()

@end

@implementation homeXmlPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"首页";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = YES;
        layout.flexDirection =  YGFlexDirectionColumn;
        layout.width = YGPointValue(self.view.bounds.size.width);
        layout.height = YGPointValue(self.view.bounds.size.height);
        //layout.alignItems = YGAlignCenter;
    }];
    
    UIScrollView *scroll = [[UIScrollView alloc] init];
    self.scroll = scroll;
    //[scroll sizeToFit];
    scroll.scrollEnabled = YES;
    //scroll.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.width*5);
    [scroll configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = YES;
        layout.flexDirection =  YGFlexDirectionColumn;
        layout.marginTop = YGPointValue(0);
        layout.width = YGPointValue(self.view.bounds.size.width);
        layout.height = YGPointValue(self.view.bounds.size.height);
        //layout.alignItems = YGAlignCenter;
    }];
    [self.view addSubview: scroll];
    
    UIView *contentView = [[UIView alloc]init];
    contentView.backgroundColor = [UIColor whiteColor];
    self.contentView = contentView;
    [contentView configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = YES;
        layout.flexDirection = YGFlexDirectionColumn;
//        layout.alignItems = YGAlignCenter;
    }];
    [scroll addSubview: contentView];
    
//    UIImageView *imageView = [[UIImageView alloc]init];
//    imageView.backgroundColor = [UIColor purpleColor];
//    imageView.image = [UIImage imageNamed:@"logo_baiyedai"];
//    [contentView addSubview:imageView];
//    [imageView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
//        layout.isEnabled = YES;
//        
//        layout.width = YGPointValue(35);
//        layout.height = YGPointValue(35);;
//    }];
    

    [self createChildDg:self.rootFlex node:contentView];

    [contentView.yoga applyLayoutPreservingOrigin:YES];
    [self.scroll.yoga applyLayoutPreservingOrigin:YES];
    // 设置 UIScrollView 的 contentSize

    self.scroll.contentSize = CGSizeMake(contentView.bounds.size.width, contentView.bounds.size.height); // 手动设置 contentSize
   
}

- (void)createChildDg:(DataNode *)origin node:(UIView *)node
{
    for (Flex *model in origin.FlexorderItem) {
        NSArray *childList = model.FlexorderItem;
        if (childList == NULL  || childList.count == 0) {
            [self createChildNode:model node:node];
            
        } else {
            UIView *view = [self createFlexNode:model ];
            [node addSubview:view];
            [self createChildDg:model node:view];
        }
    }
}

- (UIView *)createChildNode:(DataNode *)model node:(UIView *)node
{
    UIView *view;
    if ([model isMemberOfClass:[Imagecomponent class]]) {
        view = [self createImageNode:(Imagecomponent *)model];
    } else if ([model isMemberOfClass:[Textcomponent class]]) {
        view = [self createTextNode:(Textcomponent *)model];
    } else if ([model isMemberOfClass:[Flex class]]) {
        view = [self createFlexNode:(Flex *)model];
    }else if ([model isMemberOfClass:[Listcomponent class]]) {
        view = [self createListNode:(Listcomponent *)model];
    }else if ([model isMemberOfClass:[Buttoncomponent class]]) {
        view = [self createButtonNode:(Buttoncomponent *)model];
    }else if ([model isMemberOfClass:[Bannercomponent class]]) {
        view = [self createBannerNode:(Bannercomponent *)model];
    }
    [node addSubview:view];
    return view;
}
-(UIView *)createBannerNode:(Bannercomponent *)Flexmodel
{
    flexItemlist *listItem = [[flexItemlist alloc] initWithText:Flexmodel];
    listItem.actionVC = self;
    
    [listItem configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = YES;
        if([Flexmodel.flexDirection isEqualToString: @"column"]){
            layout.flexDirection =  YGFlexDirectionColumn;
        }else{
            layout.flexDirection =  YGFlexDirectionRow;
        }
        if (Flexmodel.marginLeft) {
            if ([Flexmodel.marginLeft containsString:@"%"]) {
                layout.marginLeft = YGPercentValue([Flexmodel.marginLeft floatValue]);
            }else{
                layout.marginLeft = YGPointValue([Flexmodel.marginLeft floatValue]);
            }
        }
        if (Flexmodel.marginRight) {
            if ([Flexmodel.marginRight containsString:@"%"]) {
                layout.marginRight = YGPercentValue([Flexmodel.marginRight floatValue]);
            }else{
                layout.marginRight = YGPointValue([Flexmodel.marginRight floatValue]);
            }
        }
        if (Flexmodel.justifyContent) {
            if ([Flexmodel.justifyContent isEqualToString:@"spaceBetween"]) {
                layout.justifyContent = YGJustifySpaceBetween;
            }else if([Flexmodel.justifyContent isEqualToString:@"FlexEnd"]){
                layout.justifyContent = YGJustifyFlexEnd;
            }else{
                layout.justifyContent = YGJustifyFlexStart;
            }
        }
        if (Flexmodel.marginTop) {
            layout.marginTop = YGPointValue([Flexmodel.marginTop floatValue]);
        }
        if (Flexmodel.width) {
            if ([Flexmodel.width containsString:@"%"]) {
                layout.width = YGPercentValue([Flexmodel.width floatValue]);
            }else{
                layout.width = YGPointValue([Flexmodel.width floatValue]);
            }
        }
        if(Flexmodel.alignItems){
            layout.alignItems = [self alignItems:Flexmodel.alignItems];
        }
        if(Flexmodel.height){
            layout.height = YGPointValue([Flexmodel.height floatValue]);
        }
        
        if(Flexmodel.alignItems){
            layout.alignItems = [self alignItems:Flexmodel.alignItems];
        }
        if (Flexmodel.justifyContent) {
            layout.justifyContent = [self justify:Flexmodel.justifyContent];
        }
        
    }];
    return listItem;
}
-(UIView *)createListNode:(Listcomponent *)Flexmodel
{
    flexItemlist *listItem = [[flexItemlist alloc] initWithText:Flexmodel];
    listItem.actionVC = self;
    
    [listItem configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = YES;
        if([Flexmodel.flexDirection isEqualToString: @"column"]){
            layout.flexDirection =  YGFlexDirectionColumn;
        }else{
            layout.flexDirection =  YGFlexDirectionRow;
        }
        if (Flexmodel.marginLeft) {
            if ([Flexmodel.marginLeft containsString:@"%"]) {
                layout.marginLeft = YGPercentValue([Flexmodel.marginLeft floatValue]);
            }else{
                layout.marginLeft = YGPointValue([Flexmodel.marginLeft floatValue]);
            }
        }
        if (Flexmodel.marginRight) {
            if ([Flexmodel.marginRight containsString:@"%"]) {
                layout.marginRight = YGPercentValue([Flexmodel.marginRight floatValue]);
            }else{
                layout.marginRight = YGPointValue([Flexmodel.marginRight floatValue]);
            }
        }
        if (Flexmodel.justifyContent) {
            if ([Flexmodel.justifyContent isEqualToString:@"spaceBetween"]) {
                layout.justifyContent = YGJustifySpaceBetween;
            }else if([Flexmodel.justifyContent isEqualToString:@"FlexEnd"]){
                layout.justifyContent = YGJustifyFlexEnd;
            }else{
                layout.justifyContent = YGJustifyFlexStart;
            }
        }
        if (Flexmodel.marginTop) {
            layout.marginTop = YGPointValue([Flexmodel.marginTop floatValue]);
        }
        if (Flexmodel.width) {
            if ([Flexmodel.width containsString:@"%"]) {
                layout.width = YGPercentValue([Flexmodel.width floatValue]);
            }else{
                layout.width = YGPointValue([Flexmodel.width floatValue]);
            }
        }
        if(Flexmodel.alignItems){
            layout.alignItems = [self alignItems:Flexmodel.alignItems];
        }
        if(Flexmodel.height){
            layout.height = YGPointValue([Flexmodel.height floatValue]);
        }
        
        if(Flexmodel.alignItems){
            layout.alignItems = [self alignItems:Flexmodel.alignItems];
        }
        if (Flexmodel.justifyContent) {
            layout.justifyContent = [self justify:Flexmodel.justifyContent];
        }
        
    }];
    return listItem;
}
-(UIView *)createFlexNode:(Flex *)Flexmodel
{
    UIView *contentView = [[UIView alloc]init];
    if (Flexmodel.background) {
        contentView.backgroundColor = [UIColor colorWithHexString_xt:Flexmodel.background];
    }else{
        contentView.backgroundColor = [UIColor whiteColor];
    }
    if (![Flexmodel.key isEqualToString:@"flex"]) {
        NSString *tagvalue = Flexmodel.key;
        contentView.tag = [tagvalue floatValue];
    }
    
    [contentView configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = YES;
        if([Flexmodel.flexDirection isEqualToString: @"column"]){
            layout.flexDirection =  YGFlexDirectionColumn;
        }else{
            layout.flexDirection =  YGFlexDirectionRow;
        }
        if (Flexmodel.marginLeft) {
            if ([Flexmodel.marginLeft containsString:@"%"]) {
                layout.marginLeft = YGPercentValue([Flexmodel.marginLeft floatValue]);
            }else{
                layout.marginLeft = YGPointValue([Flexmodel.marginLeft floatValue]);
            }
        }
        if (Flexmodel.marginRight) {
            if ([Flexmodel.marginRight containsString:@"%"]) {
                layout.marginRight = YGPercentValue([Flexmodel.marginRight floatValue]);
            }else{
                layout.marginRight = YGPointValue([Flexmodel.marginRight floatValue]);
            }
        }
        if (Flexmodel.justifyContent) {
            if ([Flexmodel.justifyContent isEqualToString:@"spaceBetween"]) {
                layout.justifyContent = YGJustifySpaceBetween;
            }else if([Flexmodel.justifyContent isEqualToString:@"FlexEnd"]){
                layout.justifyContent = YGJustifyFlexEnd;
            }else{
                layout.justifyContent = YGJustifyFlexStart;
            }
        }
        if (Flexmodel.marginTop) {
            layout.marginTop = YGPointValue([Flexmodel.marginTop floatValue]);
        }
        if (Flexmodel.width) {
            if ([Flexmodel.width containsString:@"%"]) {
                layout.width = YGPercentValue([Flexmodel.width floatValue]);
            }else{
                layout.width = YGPointValue([Flexmodel.width floatValue]);
            }
        }
        if(Flexmodel.alignItems){
            layout.alignItems = [self alignItems:Flexmodel.alignItems];
        }
        if(Flexmodel.height){
            layout.height = YGPointValue([Flexmodel.height floatValue]);
        }
        
        if(Flexmodel.alignItems){
            layout.alignItems = [self alignItems:Flexmodel.alignItems];
        }
        if (Flexmodel.justifyContent) {
            layout.justifyContent = [self justify:Flexmodel.justifyContent];
        }
        
    }];
    return contentView;
}

-(UIView *)createTextNode:(Textcomponent *)textmodel
{
//    flexItemLab *flexItem = [[flexItemLab alloc] init];
//    flexItem.actionVC = self;
    flexItemLab *flexlab = [[flexItemLab alloc] initWith:textmodel];
    
    [flexlab configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = YES;
        if (textmodel.marginLeft) {
            layout.marginLeft = YGPointValue([textmodel.marginLeft floatValue]);
        }
        if (textmodel.marginRight) {
            layout.marginRight = YGPointValue([textmodel.marginRight floatValue]);
        }
        if (textmodel.marginTop) {
            layout.marginTop = YGPointValue([textmodel.marginTop floatValue]);
        }
        if (textmodel.width) {
            if ([textmodel.width containsString:@"%"]) {
                layout.width = YGPercentValue([textmodel.width floatValue]);
            }else{
                layout.width = YGPointValue([textmodel.width floatValue]);
            }
        }
        if(textmodel.height){
            layout.height = YGPointValue([textmodel.height floatValue]);
        }
    }];
    return flexlab;;
}
-(UIView *)createButtonNode:(Buttoncomponent *)textmodel
{
    flexItemBtn *flexItem = [[flexItemBtn alloc] init];
    flexItem.actionVC = self;
    flexItemButton *flexlab = [flexItem ItemLabinitWithText:textmodel];
    [flexlab configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = YES;
        if (textmodel.marginLeft) {
            layout.marginLeft = YGPointValue([textmodel.marginLeft floatValue]);
        }
        if (textmodel.marginRight) {
            layout.marginRight = YGPointValue([textmodel.marginRight floatValue]);
        }
        if (textmodel.marginTop) {
            layout.marginTop = YGPointValue([textmodel.marginTop floatValue]);
        }
        if (textmodel.width) {
            if ([textmodel.width containsString:@"%"]) {
                layout.width = YGPercentValue([textmodel.width floatValue]);
            }else{
                layout.width = YGPointValue([textmodel.width floatValue]);
            }
        }
        if(textmodel.height){
            layout.height = YGPointValue([textmodel.height floatValue]);
        }
    }];
    return flexlab;;
}


-(UIView *)createImageNode:(Imagecomponent *)Imagemodel
{
    UIImageView *flexIMG = [flexItemIMG initWith:Imagemodel with:self.homeJson];
    [flexIMG configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = YES;
        if (Imagemodel.marginTop) {
            if ([Imagemodel.marginLeft containsString:@"%"]) {
                layout.marginTop = YGPercentValue([Imagemodel.marginTop floatValue]);
            }else{
                layout.marginTop = YGPointValue([Imagemodel.marginTop floatValue]);
            }
        }
        if (Imagemodel.marginLeft) {
            if ([Imagemodel.marginLeft containsString:@"%"]) {
                layout.marginLeft = YGPercentValue([Imagemodel.marginLeft floatValue]);
            }else{
                layout.marginLeft = YGPointValue([Imagemodel.marginLeft floatValue]);
            }
        }
        
        if (Imagemodel.marginRight) {
            if ([Imagemodel.marginRight containsString:@"%"]) {
                layout.marginRight = YGPercentValue([Imagemodel.marginRight floatValue]);
            }else{
                layout.marginRight = YGPointValue([Imagemodel.marginRight floatValue]);
            }
        }
        
        if (Imagemodel.width) {
            if ([Imagemodel.width containsString:@"%"]) {
                layout.width = YGPercentValue([Imagemodel.width floatValue]);
            }else{
                layout.width = YGPointValue([Imagemodel.width floatValue]);
            }
        }
        if (Imagemodel.height) {
            layout.height = YGPointValue([Imagemodel.height floatValue]);
        }
        
        
    }];
    
    return flexIMG;
}

- (YGAlign)alignItems:(NSString *)alignItems{
    if([alignItems isEqualToString: @"center"]){
        return YGAlignCenter;
    }else if([alignItems isEqualToString: @"flexStart"]){
        return YGAlignFlexStart;
    }else if([alignItems isEqualToString: @"flexEnd"]){
        return YGAlignFlexEnd;
    }else {
        return YGAlignFlexStart;
    }
}
- (void)LabactionMananger:(UITapGestureRecognizer *)sender{
    flexItemLab *lab = (flexItemLab*)sender.view;
    Textcomponent *TextModel = lab.TextModel;
    NSDictionary *actionjson = TextModel.onclick;
    if ([actionjson[@"actionType"] isEqual:@"jump"]) {
        NSLog(@"跳转页面");
        
        SecondCustomViewController *xml = [[SecondCustomViewController alloc] init];
        [self.navigationController pushViewController:xml animated:YES];
    }
}
- (void)actionMananger:(UIButton *)sender{
    flexItemButton *flexItembtn = (flexItemButton *)(sender);
    flexItembtn.selected = !flexItembtn.selected;
    NSDictionary *actionjson = flexItembtn.buttonModel.onclick;
    if ([actionjson[@"actionType"] isEqual:@"click"]) {
        NSArray *clickJsonAray = actionjson[actionjson[@"actionType"]];
        //全部刷新
        if (flexItembtn.selected) {
            //Flex*Model = [self findcreateChildDg:self.rootFlex key:@"message"];
            for (int i=0;i < clickJsonAray.count; i++) {
                NSDictionary *clickJson= clickJsonAray[i];
                [self findcreateChildDg:self.rootFlex key:clickJson[@"key"] complete:^(DataNode *result) {
                    if (result != nil) {
                        
                        if ([result isMemberOfClass:[Imagecomponent class]]) {
                            
                        } else if ([result isMemberOfClass:[Textcomponent class]]) {
                            
                        } else if ([result isMemberOfClass:[Flex class]]) {
                            Flex *newmodel =  (Flex *)result;
                            float newheight = [newmodel.height floatValue] + [clickJson[clickJson[@"actionType"]] floatValue];
                            newmodel.height= [NSString stringWithFormat:@"%f",newheight];
                            NSString *tagvalue = clickJson[@"key"];
                            UIView *new = [self.view viewWithTag:[tagvalue floatValue]];
                            new.yoga.height = YGPointValue(newheight);
//                            for (UIView *view in self.contentView.subviews) {
//                                [view removeFromSuperview];
//                            }
//                            [self createChildDg:self.rootFlex node:self.contentView];
                            [self.contentView.yoga applyLayoutPreservingOrigin:YES];
                            // 设置 UIScrollView 的 contentSize
                            self.scroll.contentSize = CGSizeMake(self.contentView.bounds.size.width, self.contentView.bounds.size.height + [clickJson[clickJson[@"actionType"]] floatValue]);
                        }else if ([result isMemberOfClass:[DataNode class]]){
                            
                        }
                        
                    }
                }];
            }
            
        }else{
            //Flex*Model = [self findcreateChildDg:self.rootFlex key:@"message"];
            for (int i=0;i < clickJsonAray.count; i++) {
                NSDictionary *clickJson= clickJsonAray[i];
                [self findcreateChildDg:self.rootFlex key:clickJson[@"key"] complete:^(DataNode *result) {
                    if (result != nil) {
                        
                        if ([result isMemberOfClass:[Imagecomponent class]]) {
                            
                        } else if ([result isMemberOfClass:[Textcomponent class]]) {
                            
                        } else if ([result isMemberOfClass:[Flex class]]) {
                            Flex *newmodel =  (Flex *)result;
                            float newheight = [newmodel.height floatValue] - [clickJson[clickJson[@"actionType"]] floatValue];
                            newmodel.height= [NSString stringWithFormat:@"%f",newheight];
                            NSString *tagvalue = clickJson[@"key"];
                            UIView *new = [self.view viewWithTag:[tagvalue floatValue]];
                            new.yoga.height = YGPointValue(newheight);
//                            for (UIView *view in self.contentView.subviews) {
//                                [view removeFromSuperview];
//                            }
//                            [self createChildDg:self.rootFlex node:self.contentView];
                            [self.contentView.yoga applyLayoutPreservingOrigin:YES];
                            // 设置 UIScrollView 的 contentSize
                            self.scroll.contentSize = CGSizeMake(self.contentView.bounds.size.width, self.contentView.bounds.size.height);
                        }else if ([result isMemberOfClass:[DataNode class]]){
                            
                        }
                        
                    }
                }];
            }
            
        }
    }else if([actionjson[@"actionType"] isEqual:@"updatebanner"]){
        NSLog(@"更新banner");
        NSString *listkey = actionjson[@"key"];
        __weak typeof(self) weakself = self;
        [self findcreateChildDg:self.rootFlex key:listkey complete:^(DataNode *result) {
            //lis节点
            if (result) {
                if ([result isMemberOfClass:[Listcomponent class]]) {
                    Listcomponent *banner = (Listcomponent *)result;
                    banner.source = actionjson[@"updatebanner"];
                    flexItemlist *bannerview = (flexItemlist *)[weakself.view viewWithTag:[listkey integerValue]];
                    bannerview.listModelSource = actionjson[@"updatebanner"];
                }
            }
            
        }];
        
        [self findcreateChildDg:self.rootFlex key:@"2022040202" complete:^(DataNode *result) {
            //lis节点
            if (result) {
                if ([result isMemberOfClass:[Textcomponent class]]) {
                    Textcomponent *lab = (Textcomponent *)result;
                    lab.text = @"我要贷款!";
                    //flexItemLable *newlab = (flexItemLable *)[self.view viewWithTag:2022040202];
                    //newlab.text = @"我要贷款!"
                }
            }
            
        }];
    }else if([actionjson[@"actionType"] isEqual:@"jump"]){
        NSLog(@"跳转页面");
        
        SecondCustomViewController *xml = [[SecondCustomViewController alloc] init];
        [self.navigationController pushViewController:xml animated:YES];
        
    }
    
    
    

    
    //局部刷新
//    if ([flexItemLab.text isEqualToString:@"V"]) {
//        float orignHeight = flexItemLab.yoga.height.value;
//        flexItemLab.yoga.marginTop = YGPointValue(50);
//        
//        float superorignHeight = flexItemLab.superview.yoga.height.value;
//        flexItemLab.superview.yoga.height = YGPointValue(superorignHeight + 50);
//        
//        [self.contentView.yoga applyLayoutPreservingOrigin:YES];
//        // 设置 UIScrollView 的 contentSize
//        self.scroll.contentSize = CGSizeMake(self.contentView.bounds.size.width, self.scroll.contentSize.height + 50); // 手动设置 contentSize
//        flexItemLab.text = @"-";
//    }else{
//        float orignHeight = flexItemLab.yoga.height.value;
//        flexItemLab.yoga.height = YGPointValue(orignHeight - 50);
//        
//        float superorignHeight = flexItemLab.superview.yoga.height.value;
//        flexItemLab.yoga.marginTop = YGPointValue(0);
////        flexItemLab.superview.yoga.height = YGPointValue(superorignHeight - 50);
//        
//        [self.contentView.yoga applyLayoutPreservingOrigin:YES];
//        // 设置 UIScrollView 的 contentSize
//        self.scroll.contentSize = CGSizeMake(self.contentView.bounds.size.width, self.scroll.contentSize.height - 50); // 手动设置 contentSize
//        flexItemLab.text = @"V";
//    }
    
}

- (void)findcreateChildDg:(DataNode *)origin key:(NSString *)key complete: (void (^)(DataNode *result))completion {
    for (Flex *model in origin.FlexorderItem) {
        [self findcreateChildNode:model key:key complete:completion];
        [self findcreateChildDg:model key:key complete:completion];
        
    }
}

- (void)findcreateChildNode:(DataNode *)model key:(NSString *)key complete: (void (^)(DataNode *result))completion{
    if ([model isMemberOfClass:[Imagecomponent class]]) {
    } else if ([model isMemberOfClass:[Textcomponent class]]) {
        [self findcreateTextNode:(Textcomponent *)model key:key complete:completion];
    } else if ([model isMemberOfClass:[Flex class]]) {
        [self findcreateFlexNode:(Flex *)model key:key complete:completion];
    }else if ([model isMemberOfClass:[Listcomponent class]]) {
        [self findcreateListcomponentNode:(Listcomponent *)model key:key complete:completion];
    }
}
-(void)findcreateTextNode:(Textcomponent *)Flexmodel key:(NSString *)key complete: (void (^)(DataNode *result))completion{
    if ([Flexmodel.key isEqualToString:key]) {
        completion(Flexmodel);
    }
}
-(void)findcreateFlexNode:(Flex *)Flexmodel key:(NSString *)key complete: (void (^)(DataNode *result))completion{
    if ([Flexmodel.key isEqualToString:key]) {
        completion(Flexmodel);
    }
}
-(void)findcreateListcomponentNode:(Listcomponent *)Flexmodel key:(NSString *)key complete: (void (^)(DataNode *result))completion{
    if ([Flexmodel.key isEqualToString:key]) {
        completion(Flexmodel);
    }
}

- (YGJustify)justify:(NSString *)justify
{
    if ([justify isEqualToString:@"start"]) {
        return YGJustifyFlexStart;
    }
    else if ([justify isEqualToString:@"center"]) {
        return YGJustifyCenter;
    }
    else if ([justify isEqualToString:@"end"]) {
        return YGJustifyFlexEnd;
    }
    else if ([justify isEqualToString:@"space-between"]) {
        return YGJustifySpaceBetween;
    }
    else if ([justify isEqualToString:@"space-around"]) {
        return YGJustifySpaceAround;
    }
    else if ([justify isEqualToString:@"space-evenly"]) {
        return YGJustifySpaceEvenly;
    }
    else {
        return YGJustifyFlexStart;

    }
    
}

//-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
//    return 1;
//}
//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//    return 20;
//}
//- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
//    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyCell" forIndexPath:indexPath];
//    cell.titleLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
//    cell.titleLabel.textColor = [UIColor blackColor];
//    cell.titleLabel.font = [UIFont systemFontOfSize:16];
//    cell.backgroundColor = [UIColor redColor];
//    return cell;
//}
@end
