//
//  XMLNodeParserDelegate.h
//  ComponentKitDemo
//
//  Created by 董其林 on 2024/10/15.
//

#import <Foundation/Foundation.h>
#import "XMLDelegateViewController.h"
#import "Flex.h"
NS_ASSUME_NONNULL_BEGIN
typedef void(^paraseEND)(void);
@interface XMLNodeParserDelegate : NSObject<NSXMLParserDelegate>
@property (nonatomic, strong) Flex *FatherrootFlex;
@property (nonatomic, strong) Flex *currentFlex;
@property (nonatomic, strong) Flex *currentFatherFlex;
@property (nonatomic, copy) paraseEND endParse;
@property (nonatomic, strong) Imagecomponent *currentImage;
@property (nonatomic, strong) Textcomponent *currentText;
@property (nonatomic, strong) Buttoncomponent *currentButton;
@property (nonatomic, strong) NSMutableString *currentElementValue;
@property (nonatomic, strong) NSMutableArray *currentElementsStack;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIViewController *xmlContentVC;
@end

NS_ASSUME_NONNULL_END
