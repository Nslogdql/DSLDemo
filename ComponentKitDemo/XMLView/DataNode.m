//
//  DataNode.m
//  ComponentKitDemo
//
//  Created by 贺潇逸 on 2024/10/11.
//

#import "DataNode.h"

@implementation DataNode
- (instancetype)init {
    self = [super init];
    if (self) {
        _source = [NSMutableArray array];
        _onclick = [NSMutableDictionary dictionary];
        //        _FlexorderItem = [NSMutableArray array];
    }
    return self;
}
- (NSMutableArray *)FlexorderItem {
    if (!_FlexorderItem) {
        _FlexorderItem = [NSMutableArray array];
    }
    return _FlexorderItem;
}
- (id)mutableCopyWithZone:(NSZone *)zone {
    DataNode *DataNode = [[[self class] alloc] init];
    if (DataNode) {
        DataNode.FlexorderItem = [self.FlexorderItem mutableCopy];
    }
    return DataNode;
}
@end
