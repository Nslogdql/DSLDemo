//
//  XMLParserDelegate.h
//  ComponentKitDemo
//
//  Created by 董其林 on 2024/10/11.
//

#import <Foundation/Foundation.h>
#import "Flex.h"
NS_ASSUME_NONNULL_BEGIN

@interface XMLParserDelegate : NSObject<NSXMLParserDelegate>
@property (nonatomic, strong) Flex *FatherrootFlex;
@property (nonatomic, strong) Flex *FatherrootFlexCopy;
@property (nonatomic, strong) Flex *currentFlex;
@property (nonatomic, strong) Flex *currentFatherFlex;

@property (nonatomic, strong) Imagecomponent *currentImage;
@property (nonatomic, strong) Textcomponent *currentText;
@property (nonatomic, strong) Buttoncomponent *currentButton;
@property (nonatomic, strong) NSMutableString *currentElementValue;
@end

NS_ASSUME_NONNULL_END
