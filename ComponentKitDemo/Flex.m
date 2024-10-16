//
//  Flex.m
//  ComponentKitDemo
//
//  Created by 董其林 on 2024/10/11.
//

#import "Flex.h"
#import <YGLayout.h>
#import <UIView+Yoga.h>
@implementation Textcomponent
@end
@implementation Imagecomponent
//- (NSString *)alignItems{
//    if([_alignItems isEqualToString: @"center"]){
//        return [NSString stringWithFormat:@"%d",3];
//    }else if([_alignItems isEqualToString: @"flexStart"]){
//        return [NSString stringWithFormat:@"%d",2];
//    }else if([_alignItems isEqualToString: @"flexEnd"]){
//        return [NSString stringWithFormat:@"%d",4];
//    }else {
//        
//        return [NSString stringWithFormat:@"%d",1];
//    }
//}
@end
@implementation Flex
- (instancetype)init {
    self = [super init];
    if (self) {
        _images = [NSMutableArray array];
        _texts = [NSMutableArray array];
        _Flex = [NSMutableArray array];
        _FlexorderItem = [NSMutableArray array];
        _ParentFlexView = [UIView new];
    }
    return self;
}
//- (NSString *)flexDirection{
//    if([_flexDirection isEqualToString: @"column"]){
//        return [NSString stringWithFormat:@"%d",1];
//    }else{
//        return [NSString stringWithFormat:@"%d",3];
//    }
//}
//- (NSString *)alignItems{
//    if([_alignItems isEqualToString: @"center"]){
//        return [NSString stringWithFormat:@"%d",3];
//    }else if([_alignItems isEqualToString: @"flexStart"]){
//        return [NSString stringWithFormat:@"%d",2];
//    }else if([_alignItems isEqualToString: @"flexEnd"]){
//        return [NSString stringWithFormat:@"%d",4];
//    }else {
//        
//        return [NSString stringWithFormat:@"%d",0];
//    }
//}

@end
