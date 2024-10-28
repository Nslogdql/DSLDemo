//
//  NBData.h
//  NeoBank
//
//  Created by 王晓松 on 2018/5/24.
//  Copyright © 2018年 app. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "UIImage+SubImage.h"
@interface NBData : NSObject

+ (NBData *)shareInstance;
#pragma mark ===============数据转换================
//JSON字符串转化为字典
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
//字典转字符串
+ (NSString*)dictionaryToJson:(NSDictionary *)dic;
//数组转json
+ (NSString*)arrayToJson:(NSArray *)array;
//取字符串
+ (id)stringWithDictionary:(NSDictionary *)dic key:(NSString *)key;
#pragma mark ===============数据合法性检查================
//判断字符串空或nil
+ (BOOL)strNilOrEmpty:(NSString *)string;
//判断字典是否为空
+ (BOOL)dictNilOrEmpty:(NSDictionary *)dict;
// 正则表达式匹配
+ (BOOL)REM:(NSString *)regex str:(NSString *)str;
//TF字符串合法性检查
+ (BOOL)strIsLegal:(NSString *)type str:(NSString *)str;
//ColorRGB合法性检查
+ (BOOL)colorRGBIsLegal:(float)rgb;
//ColorA合法性检查
+ (BOOL)colorAsLegal:(float)alpha;
//#pragma mark ===============验证码随机数================
//
////获取验证码key及url
//+ (NSDictionary *)getCodeUrl;
////获取6位随机数(可以自动补位比如"0")
//+ (NSString *)getRadom6;
//#pragma mark ===============手机号================
//
////手机号码加* 脱敏
//+ (NSString *)getSafeMobileNo:(NSString *)mobileNo;
//#pragma mark ===============图片================
////身份证号加 * 脱敏
//+ (NSString *)getSafeIDCardNo:(NSString *)idCardNo;
///// 压缩图片
///// @param image 目标图片
///// @param wh 目标高/宽
//+ (UIImage *)compressImage:(UIImage *)image fit:(float)wh;
//
///// 压缩图片
///// @param image 目标图片
///// @param maxLength 最大大小
//+ (NSData *)compressWithImage:(UIImage *)image MaxLength:(NSUInteger)maxLength;
//
//// 把图片UIImage转换成base64字符串
//+ (NSString *)imageBase64StringWithImage:(UIImage *)image;
////base64串转UIImage
//+ (UIImage *)imageBase64StringWithBase64:(NSString *)Base64;
///**
//解析web参数color字符串组合为数组
// 
// @param colorString 前端传的颜色字符串(r,g,b,a)
// @return 颜色数组[r,g,b,a]
// */
//+ (NSArray *)getRGBAfromNSString:(NSString *)colorString;
//
//#pragma mark ===============布局================
//// 根据文字长度计算view 宽度
//+ (CGFloat)textWithWidth:(NSString *)text font:(UIFont *)font;
//// 根据文字长度计算view 高度
//+ (CGFloat)textWithHeight:(NSString *)text font:(UIFont *)font;
//#pragma mark -- 交互数据统一处理
//+ (NSDictionary *)H5DataReorgnized:(id)params;
//
//+ (NSString *)noWhiteSpaceString:(NSString *)json;
//#pragma mark - 火山数据签名
//+ (NSString *)signature:(NSString *)nonce timestamp:(NSString *)timestamp securityKey:(NSString *)securityKey uuid:(NSString *)uuid;




@end
