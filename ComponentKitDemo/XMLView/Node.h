//
//  Node.h
//  ComponentKitDemo
//
//  Created by 贺潇逸 on 2024/10/11.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface Node : NSObject

@property (nonatomic, strong) NSString *key;
@property(nonatomic,strong) Node *parent;
@property(nonatomic,strong) NSMutableArray *sons;
@property(nonatomic,strong) NSMutableArray *content;
@property(nonatomic,strong) NSDictionary *data;
@property(nonatomic,assign) Boolean isRoot;

@end

NS_ASSUME_NONNULL_END
