//
//  Node.m
//  ComponentKitDemo
//
//  Created by 贺潇逸 on 2024/10/11.
//

#import "Node.h"

@implementation Node

- (NSMutableArray *)content
{
    if (!_content) {
        _content = [NSMutableArray array];
    }
    return _content;
}

- (NSMutableArray *)sons
{
    if (!_sons) {
        _sons = [NSMutableArray array];
    }
    return _sons;
}
@end
