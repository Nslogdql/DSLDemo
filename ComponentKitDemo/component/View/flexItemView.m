//
//  flexItemView.m
//  ComponentKitDemo
//
//  Created by 董其林 on 2024/10/16.
//

#import "flexItemView.h"

@implementation flexItemView
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}
- (id)init{
    if(self=[super init]){
        
    }
    return self;
}
- (instancetype)initWith:(Flex *)FlexModel{
    if(self=[super init]){
    }
    self.flexModel = FlexModel;
    
    return self;
}
@end
