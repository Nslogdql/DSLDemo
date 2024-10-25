//
//  ExpressionEvaluator.h
//  ComponentKitDemo
//
//  Created by 董其林 on 2024/10/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ExpressionEvaluator : NSObject
+ (BOOL)evaluateExpression:(NSString *)expressionString withArray:(NSMutableDictionary *)params;
@end

NS_ASSUME_NONNULL_END
