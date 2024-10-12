//
//  contextLable.m
//  ComponentKitDemo
//
//  Created by 董其林 on 2024/10/10.
//

#import "contextLable.h"

@implementation contextLable
+ (UILabel *)initWithText:(NSString *)text{
    UILabel *lable = [[UILabel alloc] init];
    if(text.length > 0){
        lable.text = text;
    }
    return lable;
}
@end
