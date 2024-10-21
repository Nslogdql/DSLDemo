//
//  Flex.m
//  ComponentKitDemo
//
//  Created by 董其林 on 2024/10/11.
//

#import "Flex.h"
#import <YGLayout.h>
#import <UIView+Yoga.h>
@implementation Listcomponent
- (instancetype)init {
    self = [super init];
    if (self) {
        _onclick = [NSMutableDictionary dictionary];
        _source = [NSMutableArray array];
    }
    return self;
}
@end
@implementation Buttoncomponent
@end
@implementation Textcomponent
@end
@implementation Imagecomponent
@end
@implementation Flex
- (instancetype)init {
    self = [super init];
    if (self) {
        _images = [NSMutableArray array];
        _texts = [NSMutableArray array];
        _Flex = [NSMutableArray array];
        _buttons = [NSMutableArray array];
        _lists = [NSMutableArray array];
        //        _FlexorderItem = [NSMutableArray array];
    }
    return self;
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    Flex *Flex = [[[self class] alloc] init];
    if (Flex) {
        Flex.images = [self.images mutableCopy];
        Flex.key = [self.key mutableCopy];
        Flex.texts = [self.texts mutableCopy];
        Flex.Flex = [self.Flex mutableCopy];
        Flex.width = [self.width mutableCopy];
        
        Flex.height = [self.height mutableCopy];
        Flex.alignItems = [self.alignItems mutableCopy];
        Flex.background = [self.background mutableCopy];
        Flex.background = [self.background mutableCopy];
        Flex.flexDirection = [self.flexDirection mutableCopy];
        Flex.images = [self.images mutableCopy];
        Flex.paddingBottom = [self.paddingBottom mutableCopy];
        Flex.marginTop = [self.marginTop mutableCopy];
        Flex.marginLeft = [self.marginLeft mutableCopy];
        
        Flex.marginRight = [self.marginRight mutableCopy];
        Flex.flexGrow = [self.flexGrow mutableCopy];
        
        Flex.justifyContent = [self.justifyContent mutableCopy];
        Flex.padding = [self.padding mutableCopy];
        Flex.ParentFlex = [self.ParentFlex mutableCopy];
        Flex.FlexorderItem = [self.FlexorderItem mutableCopy];
    }
    return Flex;
}
- (id)copyWithZone:(NSZone *)zone {
    Flex *Flex = [[[self class] alloc] init];
    if (Flex) {
        Flex.images = [self.images mutableCopy];
        Flex.key = [self.key mutableCopy];
        Flex.texts = [self.texts mutableCopy];
        Flex.Flex = [self.Flex mutableCopy];
        Flex.width = [self.width mutableCopy];
        
        Flex.height = [self.height mutableCopy];
        Flex.alignItems = [self.alignItems mutableCopy];
        Flex.background = [self.background mutableCopy];
        Flex.background = [self.background mutableCopy];
        Flex.flexDirection = [self.flexDirection mutableCopy];
        Flex.images = [self.images mutableCopy];
        Flex.paddingBottom = [self.paddingBottom mutableCopy];
        Flex.marginTop = [self.marginTop mutableCopy];
        Flex.marginLeft = [self.marginLeft mutableCopy];
        
        Flex.marginRight = [self.marginRight mutableCopy];
        Flex.flexGrow = [self.flexGrow mutableCopy];
        
        Flex.justifyContent = [self.justifyContent mutableCopy];
        Flex.padding = [self.padding mutableCopy];
        Flex.ParentFlex = [self.ParentFlex mutableCopy];
        Flex.FlexorderItem = [self.FlexorderItem mutableCopy];
    }
    return Flex;
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
