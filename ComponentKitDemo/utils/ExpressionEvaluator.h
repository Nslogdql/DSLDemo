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

+ (NSString *)parseExpression:(NSString *)expressionString with:(NSMutableDictionary *)params;


/*
解析数据表达式的.语法
*/
+(NSString *)evaluateScript:(NSString *)expressionString withjson:(NSDictionary *)jsonDic;
/*
匹配${{variable}}
*/
+(BOOL)ontainsGRMustacheTemplate:(NSString *)Mustachestring;
@end

NS_ASSUME_NONNULL_END
