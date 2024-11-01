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
+ (NSString *)parseExpression:(NSString *)expressionString with:(NSMutableDictionary *)params{
    // 定义模板字符串
        NSString *templateString = expressionString;
        // 创建一个上下文数据字典
    NSMutableDictionary *renderObject = [NSMutableDictionary dictionary];
    [renderObject setValue:params[@"name"] forKey:@"name"];
        // 使用 GRMustache 渲染模板
        NSError *error = nil;
        NSString *renderedString = [GRMustacheTemplate renderObject:renderObject fromString:templateString error:&error];
    if (error) {
        return expressionString;
    }
    return renderedString;
}
+(NSMutableArray *)extractVariableNames:(NSString *)templateString{
    NSError *error = nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\{\\{(.*?)\\}\\}"
                                                                       options:0
                                                                         error:&error];

    NSMutableArray *variableNames = [NSMutableArray array];
    NSArray *matches = [regex matchesInString:templateString options:0 range:NSMakeRange(0, templateString.length)];

    for (NSTextCheckingResult *match in matches) {
        NSRange matchRange = [match rangeAtIndex:1];
        NSString *variableName = [templateString substringWithRange:matchRange];
        [variableNames addObject:variableName];
    }

    return variableNames;
}

+(NSString *)evaluateScript:(NSString *)expressionString withjson:(NSDictionary *)jsonDic{
    JSContext *context = [[JSContext alloc] init];

   // 将 JSON 数据设置为 JavaScript 对象
   [context setObject:jsonDic forKeyedSubscript:@"data"];

   // 定义 JavaScript 表达式
   NSString *expression = [NSString stringWithFormat:@"data.%@",expressionString];

   // 执行 JavaScript 表达式
   JSValue *result = [context evaluateScript:expression];

   // 获取结果并输出
   NSLog(@"解析结果: %@", [result toString]); // 输出: 解析结果:
 
   return [result toString];
}

+(BOOL)ontainsGRMustacheTemplate:(NSString *)Mustachestring{
    // 正则表达式用于匹配 {{ ... }}
    NSString *pattern = @"\\$\\s*\\{\\{\\s*(.*?)\\s*\\}\\}";
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:nil];
    
    // 检查是否有匹配
    NSUInteger numberOfMatches = [regex numberOfMatchesInString:Mustachestring options:0 range:NSMakeRange(0, [Mustachestring length])];
    return numberOfMatches > 0;
}
@end
