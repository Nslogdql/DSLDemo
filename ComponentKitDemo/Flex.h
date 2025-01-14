//
//  Flex.h
//  ComponentKitDemo
//
//  Created by 董其林 on 2024/10/11.
//

#import <Foundation/Foundation.h>
#import "YGLayout.h"
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface Buttoncomponent : NSObject

@property (nonatomic, strong) NSString *textSize;
@property (nonatomic, strong) NSString *textStyle;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *marginTop;
@property (nonatomic, strong) NSString *marginLeft;
@property (nonatomic, strong) NSString *marginRight;
@property (nonatomic, strong) NSString *width;
@property (nonatomic, strong) NSString *height;
@property (nonatomic, strong) NSString *FlexEvent;
@property (nonatomic, strong) NSString *textAlignment;

@end
@interface Textcomponent : NSObject

@property (nonatomic, strong) NSString *textSize;
@property (nonatomic, strong) NSString *textStyle;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *marginTop;
@property (nonatomic, strong) NSString *marginLeft;
@property (nonatomic, strong) NSString *marginRight;
@property (nonatomic, strong) NSString *width;
@property (nonatomic, strong) NSString *height;
@property (nonatomic, strong) NSString *FlexEvent;
@property (nonatomic, strong) NSString *textAlignment;

@end
@interface Imagecomponent : NSObject

@property (nonatomic, strong) NSString *src;
@property (nonatomic, strong) NSString *height;
@property (nonatomic, strong) NSString *width;
@property (nonatomic, strong) NSString *clickUrl;
@property (nonatomic, strong) NSString *marginTop;
@property (nonatomic, strong) NSString *marginLeft;
@property (nonatomic, strong) NSString *marginRight;
@property (nonatomic, strong) NSString *alignItems;
@end
@interface Flex : NSObject
@property (nonatomic, strong) NSMutableArray<Imagecomponent *> *images;
@property (nonatomic, strong) NSMutableArray<Textcomponent *> *texts;
@property (nonatomic, strong) NSMutableArray<Buttoncomponent *> *buttons;
@property (nonatomic, strong) NSMutableArray<Flex *> *Flex;
@property (nonatomic, strong) NSString *key;
@property (nonatomic, strong) NSString *width;
@property (nonatomic, strong) NSString *height;
@property (nonatomic, strong) NSString *alignItems;
@property (nonatomic, strong) NSString *background;
@property (nonatomic, strong) NSString *flexDirection;
@property (nonatomic, strong) NSString *paddingBottom;
@property (nonatomic, strong) NSString *marginTop;
@property (nonatomic, strong) NSString *marginLeft;
@property (nonatomic, strong) NSString *marginRight;
@property (nonatomic, strong) NSString *flexGrow;
@property (nonatomic, strong) NSString *FlexEvent;

@property (nonatomic, strong) NSString *padding;
@property (nonatomic, strong) NSMutableArray *FlexorderItem;
// 其他属性...
//父节点
@property (nonatomic, strong) Flex *ParentFlex;
@property (nonatomic, strong) UIView *ParentFlexView;
@end

NS_ASSUME_NONNULL_END
