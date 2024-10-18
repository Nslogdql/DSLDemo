//
//  flexItemBtn.h
//  ComponentKitDemo
//
//  Created by 董其林 on 2024/10/16.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Flex.h"
NS_ASSUME_NONNULL_BEGIN

@interface flexItemBtn : NSObject
@property(nonatomic,strong)UIButton *button;
- (UIButton *)ItemLabinitWithText:(ButtonComponent *)buttonModel;
@end

NS_ASSUME_NONNULL_END
