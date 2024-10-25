//
//  flexItemLab.h
//  ComponentKitDemo
//
//  Created by 董其林 on 2024/10/11.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Flex.h"
#import "flexItemLable.h"
NS_ASSUME_NONNULL_BEGIN

@interface flexItemLab : UILabel
//@property(nonatomic,strong)flexItemLable *Lab;
@property(nonatomic,strong)UIViewController *actionVC;
@property(nonatomic,strong)Textcomponent *TextModel;
-(instancetype)initWith:(Textcomponent *)TextModel;
@end

NS_ASSUME_NONNULL_END