//
//  ExpressionEvaluator.m
//  ComponentKitDemo
//
//  Created by 董其林 on 2024/10/25.
//

#import "ExpressionEvaluator.h"
#import <GRMustacheTemplate.h>
#import <JavaScriptCore/JavaScriptCore.h>
@implementation ExpressionEvaluator
+ (BOOL)evaluateExpression:(NSString *)paramexpressionString withArray:(NSMutableDictionary *)params {
    
    
    // 定义模板字符串
        NSString *templateString = paramexpressionString;
        // 创建一个上下文数据字典
        NSDictionary *data = @{
            @"login.count": @(params.count),
            @"login": @(params.count),
        };
        // 使用 GRMustache 渲染模板
        NSError *error = nil;
        NSString *renderedString = [GRMustacheTemplate renderObject:data fromString:templateString error:&error];

    

            // 创建表达式字符串
            NSString *expressionString = renderedString;
            // 创建 JSContext
            JSContext *context = [[JSContext alloc] init];
            
            // 定义要评估的表达式
            
            // 评估表达式
            JSValue *result = [context evaluateScript:expressionString];
            
            // 输出结果
            NSLog(@"The result of the expression '%@' is: %@", expressionString, [result toBool] ? @"true" : @"false");
        // 创建 NSExpression 对象来评估表达式
          // NSExpression *expression = [NSExpression expressionForEvaluatedObject];
           
           // 评估表达式，结果是一个 NSNumber
           //NSNumber *result = [expression expressionValueWithObject:nil context:nil];
            
            // 输出结果
           // if (result) {
             //   NSLog(@"Login dictionary is not empty.");
            //} else {
            //    NSLog(@"Login dictionary is empty.");
            //}
            return [result toBool];
}
@end
