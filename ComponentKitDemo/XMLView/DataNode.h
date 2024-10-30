//
//  DataNode.h
//  ComponentKitDemo
//
//  Created by 贺潇逸 on 2024/10/11.
//

#import <Foundation/Foundation.h>
#import "Node.h"
NS_ASSUME_NONNULL_BEGIN

@interface DataNode : Node<NSCopying>
@property (nonatomic, strong) NSMutableArray *FlexorderItem;



@property (nonatomic, strong) NSString *style;
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
@property (nonatomic, strong) NSString *justifyContent;

@property (nonatomic, strong) NSString *padding;


@property (nonatomic, strong) NSString *src;
@property (nonatomic, strong) NSString *clickUrl;

@property (nonatomic, strong) NSString *textSize;
@property (nonatomic, strong) NSString *textStyle;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *textAlignment;
@property (nonatomic, strong) NSDictionary *onclick;


@property (nonatomic, strong) NSString *selecttext;
@property (nonatomic, strong) NSString *cornerRadius;
@property (nonatomic, strong) NSString *titleColor;

@property (nonatomic, strong) NSMutableArray *source;
@property (nonatomic, strong) NSString *condition;


@end

NS_ASSUME_NONNULL_END
