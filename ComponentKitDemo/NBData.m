//
//  NBData.m
//  NeoBank
//
//  Created by 王晓松 on 2018/5/24.
//  Copyright © 2018年 app. All rights reserved.
//

#import "NBData.h"
#import <CommonCrypto/CommonHMAC.h>
#include <stdlib.h>

@implementation NBData

+ (NBData *)shareInstance{
    static  NBData *share = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //        share = [[NBGlobalV alloc]init];
        share = [[NBData alloc]init];
    });
    return share;
}
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err)
    {
        return [NSDictionary new];
    }
    return dic;
}
//字典转字符串
+ (NSString*)dictionaryToJson:(NSDictionary *)dic{
    
    NSError *parseError = nil;
    if ([NSJSONSerialization isValidJSONObject:dic]) {
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return @"";
}

//数组转字符串
+ (NSString*)arrayToJson:(NSArray *)array{
    NSError *parseError = nil;
    
    if ([NSJSONSerialization isValidJSONObject:array]) {
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:array options:NSJSONWritingPrettyPrinted error:&parseError];
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return @"";
}


+ (id)stringWithDictionary:(NSDictionary *)dic key:(NSString *)key{
    id value = [dic objectForKey:key];
    return value;
}
//判断字符串空或nil
+ (BOOL)strNilOrEmpty:(NSString *)string {
    if ([string isKindOfClass:[NSString class]]) {
        if([string isEqualToString:@"null"]){
            return YES;
        }else if (string.length > 0) {
            return NO;
        }else{
            return YES;
        }
    }
    else {
        return YES;
    }
} 
+ (NSString *)noWhiteSpaceString:(NSString *)json {
    NSString *newString;
  //去除掉首尾的空白字符和换行字符
    newString = [json stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    newString = [json stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    newString = [json stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];  //去除掉首尾的空白字符和换行字符使用
    newString = [json stringByReplacingOccurrencesOfString:@" " withString:@""];
//    可以去掉空格，注意此时生成的strUrl是autorelease属性的，所以不必对strUrl进行release操作！
    return newString;
}
//判断字典是否为空
+ (BOOL)dictNilOrEmpty:(NSDictionary *)dict{
    if ([dict isKindOfClass:[NSDictionary class]]) {
        if ([dict isEqual:[NSNull null]]) {
            return YES;
        }else if(dict.allKeys.count > 0){
            return NO;
        }else{
            return YES;
        }
    }else{
        return YES;
    }
}
+ (NSString *)getRadom6{
    int a = arc4random() % 100000;
    NSString *str = [NSString stringWithFormat:@"%06d", a];
    return str;
}
//+ (NSDictionary *)getCodeUrl{
//    NSString *codeKey = [NSString stringWithFormat:@"ZXCK%@%@",[NBEnvir getNowTimeTimestamp3],[NBData getRadom6]];
//    NSString *imagesURLStrings = [NSString stringWithFormat:@"/service/userSign/imageCode?key=%@",codeKey];
//    NSString *imagesURL = [NBServer getServerURL:imagesURLStrings];
//    NSDictionary *codeDict = @{@"key":codeKey,@"url":imagesURL};
//    return codeDict;
//}
//// 正则表达式匹配
//+ (BOOL)REM:(NSString *)regex str:(NSString *)str{
//    if (regex) {
//        NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
//        return [passWordPredicate evaluateWithObject:str];
//    }
//    return NO;
//}
//// 判断字符串是否合法
////-- 密码登录（user,pwd,code）是输入中的逻辑,只能控制最大位数
//+ (BOOL)strIsLegal:(NSString *)type str:(NSString *)str{
//    NSString *REGEX = @"";//正则表达式
//    //用户名
//    if ([type isEqual:@"user"]) {
//        if (str.length >= 1 && str.length <= 20) {
//            return YES;
//        }else{
//            return NO;
//        }
//    }
//    //密码
//    if ([type isEqual:@"pwd"]) {
//        /**
//         /^    匹配输入字符串的开始位置
//         (
//         [A-Za-z0-9]     大小写字母和数字任选
//         {6,20}    长度大于6小于20
//         )
//         $/    匹配输入字符串的结束位置
//         */
////        REGEX = @"^[A-Za-z0-9]{6,20}$";
////        return [NBData REM:REGEX str:str];
//// 由于微通键盘无法获取明文密码，因此只能根据长度匹配
//        if (str.length >= 6 && str.length <= 20) {
//            return YES;
//        }else{
//            return NO;
//        }
//    }
//    //验证码
//    if ([type isEqual:@"code"]) {
//        if (str.length == 4) {
//            return YES;
//        }else{
//            return NO;
//        }
//    }
//    // 手机号
//    if ([type isEqual:@"mobileNo"]) {
//        //手机号以13,14,15,18,17开头，八个 \d 数字字符
//        //更新16 19段位号码
//        REGEX = @"^1(3[0-9]|4[579]|5[0-35-9]|6[6]|7[0-35-9]|8[0-9]|9[89])\\d{8}$";
//        return [NBData REM:REGEX str:str];
//    }
//    // 姓名中文
//    if ([type isEqual:@"nameCHN"]) {
////        REGEX = @"[\u4E00-\u9FA5]{2,5}(?:·[\u4E00-\u9FA5]{2,5})*";
//        REGEX = @"^[\u4e00-\u9fa5]+(·[\u4e00-\u9fa5]+)*$";
//        return [NBData REM:REGEX str:str];
//    }
//    // 身份证
//    if ([type isEqual:@"identityCard"]) {
//        if (str.length <= 0) {
//            return NO;
//        }
//        REGEX = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
//        return [NBData REM:REGEX str:str];
//    }
//    
//    // 车牌号
//    if ([type isEqual:@"carNo"]) {
//        REGEX = @"^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{4}[a-zA-Z_0-9_\u4e00-\u9fa5]$";
//        return [NBData REM:REGEX str:str];
//    }
//    // 昵称
//    if ([type isEqual:@"nickName"]) {
//        // NSString *nicknameRegex = @"^[\u4e00-\u9fa5]{4,8}$";//这个是昵称只能为中文的正则判断，长度大于4小于8
//        /**
//         ^ 以后面的为开头
//         $ 以前面的为结尾
//         \w 数字，字母，下划线，.
//         \u4E00-\u9FA5 中文
//         * 代表前面出现0次或多次
//         | 或者
//         */
//        REGEX = @"^(\w|-|[\u4E00-\u9FA5])*$";//昵称可以是中文、字母、数字、下划线，这里不做字符长度限制
//        return [NBData REM:REGEX str:str];
//    }
//    // 年
//    if ([type isEqual:@"year"]) {
//        REGEX = @"^(19[3-9]\d|20[01]\d|2020)$";//1930-2020
//        return [NBData REM:REGEX str:str];
//    }
//    // 月
//    if ([type isEqual:@"month"]) {
//        REGEX = @"^(0?[1-9]|1[0-2])$";//1-12
//        return [NBData REM:REGEX str:str];
//    }
//    // 日
//    if ([type isEqual:@"day"]) {
//        REGEX = @"^(0[1-9]|[1-2][0-9]|3[0-1])$";//01-31
//        return [NBData REM:REGEX str:str];
//    }
//    return NO;
//}
////ColorRGV合法性检查
//+ (BOOL)colorRGBIsLegal:(float)rgb{
//    if (rgb >= 0.0 && rgb <= 255.0) {
//        return YES;
//    }else{
//        return NO;
//    }
//}
////ColorA合法性检查
//+ (BOOL)colorAsLegal:(float)alpha{
//    if (alpha >= 0.0 && alpha <= 1.0) {
//        return YES;
//    }else{
//        return NO;
//    }
//}
//+ (NSString *)getSafeMobileNo:(NSString *)mobileNo{
//    NSString *safeNo = @"";
//    if (mobileNo && mobileNo.length > 7) {
//        safeNo = [mobileNo stringByReplacingCharactersInRange:NSMakeRange(mobileNo.length -8, 4) withString:@"****"];
//    }else{
//        safeNo = mobileNo;
//    }
//    return safeNo;
//}
//
//+ (NSString *)getSafeIDCardNo:(NSString *)idCardNo{
//    NSString *safeNo = @"";
//    if (idCardNo && (idCardNo.length > 14)) {
//        NSInteger len = idCardNo.length;
//        switch (len) {
//            case 15:{
//                safeNo = [idCardNo stringByReplacingCharactersInRange:NSMakeRange(len-9, 6) withString:@"******"];
//            }
//                break;
//                
//            case 18:{
//                safeNo = [idCardNo stringByReplacingCharactersInRange:NSMakeRange(len-12, 8) withString:@"********"];
//            }
//                break;;
//            default:
//                break;
//        }
//    }else{
//        safeNo = idCardNo;
//    }
//    return safeNo;
//}
////图片压缩处理
//+ (UIImage *)compressImage:(UIImage *)image fit:(float)wh{
//    
//    CGSize originalSize = image.size;//获取原始图片size
//    CGFloat originalWidth = originalSize.width;//宽
//    CGFloat originalHeight = originalSize.height;//高
//    float scale = originalHeight/originalWidth;
//    int h = wh;
//    if (originalWidth < originalHeight) {
//       //竖屏处理
//       h = (int)(wh*scale);
//    }
//    int w = (int)(h / scale);
//
//    CGSize newImageSize = CGSizeMake(w , h);
//    UIGraphicsBeginImageContextWithOptions(CGSizeMake(newImageSize.width , newImageSize.height ), NO, 0);
//    [image drawInRect:CGRectMake(0, 0, newImageSize.width, newImageSize.height) blendMode:kCGBlendModeNormal alpha:1.0];
//    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
//    if (newImage == nil) {
//       
//       NSLog(@"image ");
//    }
//
//    UIGraphicsEndImageContext();
//    return newImage;
//}
//
//// 把图片UIImage转换成base64字符串
//+ (NSString *)imageBase64StringWithImage:(UIImage *)image{
//    NSData *data = UIImageJPEGRepresentation(image, 1.0f);
//    return [NBEncryptPlugin encodeByBase64FromData:data];
//}
//
////base64串转UIImage
//+ (UIImage *)imageBase64StringWithBase64:(NSString *)Base64{
//    NSData *imageData = [[NSData alloc] initWithBase64EncodedString:Base64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
//    UIImage *image = [UIImage imageWithData:imageData];
//    return image;
//}
//
////压缩到maxLength以内：maxLength = 1024 * 1024 * 5 即5兆以内
//+ (NSData *)compressWithImage:(UIImage *)image MaxLength:(NSUInteger)maxLength{
//    // Compress by quality
//    CGFloat compression = 1;
//    NSData *data = UIImageJPEGRepresentation(image, compression);
//    //NSLog(@"Before compressing quality, image size = %ld KB",data.length/1024);
//    if (data.length < maxLength) return data;
//    
//    CGFloat max = 1;
//    CGFloat min = 0;
//    for (int i = 0; i < 6; ++i) {
//        compression = (max + min) / 2;
//        data = UIImageJPEGRepresentation(image, compression);
//        //NSLog(@"Compression = %.1f", compression);
//        //NSLog(@"In compressing quality loop, image size = %ld KB", data.length / 1024);
//        if (data.length < maxLength * 0.9) {
//            min = compression;
//        } else if (data.length > maxLength) {
//            max = compression;
//        } else {
//            break;
//        }
//    }
//    //NSLog(@"After compressing quality, image size = %ld KB", data.length / 1024);
//    if (data.length < maxLength) return data;
//    UIImage *resultImage = [UIImage imageWithData:data];
//    // Compress by size
//    NSUInteger lastDataLength = 0;
//    while (data.length > maxLength && data.length != lastDataLength) {
//        lastDataLength = data.length;
//        CGFloat ratio = (CGFloat)maxLength / data.length;
//        //NSLog(@"Ratio = %.1f", ratio);
//        CGSize size = CGSizeMake((NSUInteger)(resultImage.size.width * sqrtf(ratio)),
//                                 (NSUInteger)(resultImage.size.height * sqrtf(ratio))); // Use NSUInteger to prevent white blank
//        UIGraphicsBeginImageContext(size);
//        [resultImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
//        resultImage = UIGraphicsGetImageFromCurrentImageContext();
//        UIGraphicsEndImageContext();
//        data = UIImageJPEGRepresentation(resultImage, compression);
//        //NSLog(@"In compressing size loop, image size = %ld KB", data.length / 1024);
//    }
//    //NSLog(@"After compressing size loop, image size = %ld KB", data.length / 1024);
//    return data;
//}
//
//// 解析web参数color字符串组合为数组
//+ (NSArray *)getRGBAfromNSString:(NSString *)colorString{
//    NSArray *rgbaArr;
//    NSString *rgbaStr = colorString;
//    if (![NBData strNilOrEmpty:rgbaStr]) {
//        //colorString r,g,b,a
//        //,分隔获得数组[r,g,b,a]
//        rgbaArr = [rgbaStr componentsSeparatedByString:@","];
//    }else{
////        rgbaArr = @[@"255",@"255",@"255",@"1"];
//    }
//    return rgbaArr;
//}
//
//// 根据文字长度计算view 宽度
//+ (CGFloat)textWithWidth:(NSString *)text font:(UIFont *)font{
//    CGFloat stringWidth = 0;
//    CGSize size = CGSizeMake(MAXFLOAT, MAXFLOAT);
//    if (text.length > 0) {
//#if defined(__IPHONE_OS_VERSION_MAX_ALLOWED) && __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
//        stringWidth = [text
//                       boundingRectWithSize:size
//                       options:NSStringDrawingUsesLineFragmentOrigin
//                       attributes:@{NSFontAttributeName:font}
//                       context:nil].size.width;
//        
//#else
//        stringWidth = [text sizeWithFont:font constrainedToSize:size
//                           lineBreakMode:NSLineBreakByCharWrapping].width;
//        
//#endif
//    }
//    return stringWidth;
//}
//
//// 根据文字长度计算view 高度
//+ (CGFloat)textWithHeight:(NSString *)text font:(UIFont *)font{
//    CGFloat stringHeight = 0;
//    CGSize size = CGSizeMake(MAXFLOAT, MAXFLOAT);
//    if (text.length > 0) {
//#if defined(__IPHONE_OS_VERSION_MAX_ALLOWED) && __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
//        stringHeight =[text
//                       boundingRectWithSize:size
//                       options:NSStringDrawingUsesLineFragmentOrigin
//                       attributes:@{NSFontAttributeName:font}
//                       context:nil].size.height;
//#else
//        
//        stringHeight = [text sizeWithFont:font constrainedToSize:size
//                            lineBreakMode:NSLineBreakByCharWrapping].height;
//#endif
//    }
//    return stringHeight;
//}
//
//+ (NSDictionary *)H5DataReorgnized:(id)params{
//    NSDictionary *dictInfo;
//    if ([params isKindOfClass:[NSString class]]) {
//        dictInfo = [NBData dictionaryWithJsonString:params];
//    }else if ([params isKindOfClass:[NSDictionary class]]){
//        dictInfo = (NSDictionary *)params;
//    }
//    return [dictInfo copy];
//}
//
////火山签名
//+ (NSString *)signature:(NSString *)nonce timestamp:(NSString *)timestamp securityKey:(NSString *)securityKey uuid:(NSString *)uuid{
//    
//    NSMutableArray *strList = [NSMutableArray arrayWithObjects:nonce, timestamp, securityKey, nil];
//    if (![NBData strNilOrEmpty:uuid]) {
//        [strList addObject:uuid];
//    }
//    NSArray *listArry = [NSArray arrayWithArray:strList];
//    listArry = [listArry sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
//    NSString *signStr = [strList componentsJoinedByString:@""];
//    return [NBData sha1:signStr];
//}
////SHA-1
//+ (NSString*)sha1:(NSString *)str
//{
//    const char *cstr = [str cStringUsingEncoding:NSUTF8StringEncoding];
//    NSData *data = [NSData dataWithBytes:cstr length:str.length];
//    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
//    CC_SHA1(data.bytes, (int)data.length, digest);
//    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
//    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
//        [output appendFormat:@"%02x", digest[i]];
//    return output;
//}



@end
