//
//  FlexJson.m
//  ComponentKitDemo
//
//  Created by 董其林 on 2024/10/22.
//

#import "FlexJson.h"

@implementation FlexJson
- (instancetype)init {
    self = [super init];
    if (self) {
        _banner = [NSMutableArray array];
        _hangIocn = [NSMutableDictionary dictionary];
    }
    return self;
}
@end
