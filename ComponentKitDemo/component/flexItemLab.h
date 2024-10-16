//
//  flexItemLab.h
//  ComponentKitDemo
//
//  Created by 董其林 on 2024/10/11.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Flex.h"
NS_ASSUME_NONNULL_BEGIN

@interface flexItemLab : NSObject
@property(nonatomic,strong)UILabel *Lab;
- (UILabel *)ItemLabinitWithText:(Textcomponent *)TextModel;
@end

NS_ASSUME_NONNULL_END
