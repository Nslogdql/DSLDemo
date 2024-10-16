//
//  XMLParserDelegate.m
//  ComponentKitDemo
//
//  Created by 董其林 on 2024/10/11.
//

#import "XMLParserDelegate.h"
#import "Flex.h"
#import <YGLayout.h>
#import <UIView+Yoga.h>
#import "homepageViewController.h"
#import "contextLable.h"
#import "contextviewWithTextStr.h"
#import "UIColor+Hex.h"
#import "flexItemLab.h"
#import "flexItemIMG.h"
#import "UIColor+Hex.h"
@implementation XMLParserDelegate
- (instancetype)init {
    self = [super init];
    if (self) {
        _FatherrootFlex = [[Flex alloc] init];
        _currentFlex = [[Flex alloc] init];
        _currentElementsStack = [NSMutableArray array];
    }
    return self;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
    if ([elementName isEqualToString:@"Flex"]) {
        if(self.currentElementsStack.count == 0){
            //根节点
            Flex *newFlex = [[Flex alloc] init];
            newFlex.key = attributeDict[@"key"];
            newFlex.width = attributeDict[@"width"];
            newFlex.height = attributeDict[@"height"];
            newFlex.alignItems = attributeDict[@"alignItems"];
            newFlex.background = attributeDict[@"background"];
            newFlex.flexDirection = attributeDict[@"flexDirection"];
            newFlex.paddingBottom = attributeDict[@"paddingBottom"];
            newFlex.marginTop = attributeDict[@"marginTop"];
            newFlex.marginLeft = attributeDict[@"marginLeft"];
            newFlex.marginRight = attributeDict[@"marginRight"];
            newFlex.padding = attributeDict[@"padding"];
            newFlex.flexGrow = attributeDict[@"flexGrow"];
            
            UIView *contentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [newFlex.width floatValue], [newFlex.height floatValue])];
            if (newFlex.background) {
                contentView.backgroundColor = [UIColor colorWithHexString_xt:newFlex.background];
            }else{
                contentView.backgroundColor = [UIColor whiteColor];
            }
            
            [contentView configureLayoutWithBlock:^(YGLayout * layout) {
                layout.isEnabled = YES;
                if([newFlex.flexDirection isEqualToString: @"column"]){
                    layout.flexDirection =  YGFlexDirectionColumn;
                }else{
                    layout.flexDirection =  YGFlexDirectionRow;
                }
                if (newFlex.marginLeft) {
                    if ([newFlex.marginLeft containsString:@"%"]) {
                        layout.marginLeft = YGPercentValue([newFlex.marginLeft floatValue]);
                    }else{
                        layout.marginLeft = YGPointValue([newFlex.marginLeft floatValue]);
                    }
                }
                if (newFlex.marginRight) {
                    if ([newFlex.marginRight containsString:@"%"]) {
                        layout.marginRight = YGPercentValue([newFlex.marginRight floatValue]);
                    }else{
                        layout.marginRight = YGPointValue([newFlex.marginRight floatValue]);
                    }
                }
                if (newFlex.marginTop) {
                    layout.marginTop = YGPointValue([newFlex.marginTop floatValue]);
                }
                if (newFlex.width) {
                    if ([newFlex.width containsString:@"%"]) {
                        layout.width = YGPercentValue([newFlex.width floatValue]);
                    }else{
                        layout.width = YGPointValue([newFlex.width floatValue]);
                    }
                }
                if (newFlex.height) {
                    if ([newFlex.height containsString:@"%"]) {
                        layout.height = YGPercentValue([newFlex.height floatValue]);
                    }else{
                        layout.height = YGPointValue([newFlex.height floatValue]);
                    }
                }
            }];
            self.currentFlex = newFlex;
            self.currentFlex.ParentFlexView = contentView;
            self.FatherrootFlex = newFlex;
//            [self.currentFlex.FlexorderItem addObject:newFlex];
            [self.currentElementsStack addObject:newFlex];
        }else{
            Flex *newFlex = [[Flex alloc] init];
            newFlex.key = attributeDict[@"key"];
            newFlex.width = attributeDict[@"width"];
            newFlex.height = attributeDict[@"height"];
            newFlex.alignItems = attributeDict[@"alignItems"];
            newFlex.background = attributeDict[@"background"];
            newFlex.flexDirection = attributeDict[@"flexDirection"];
            newFlex.paddingBottom = attributeDict[@"paddingBottom"];
            newFlex.marginTop = attributeDict[@"marginTop"];
            newFlex.marginLeft = attributeDict[@"marginLeft"];
            newFlex.marginRight = attributeDict[@"marginRight"];
            newFlex.padding = attributeDict[@"padding"];
            newFlex.flexGrow = attributeDict[@"flexGrow"];
            
            
            
            
            
            UIView *contentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [newFlex.width floatValue], [newFlex.height floatValue])];
            if (newFlex.background) {
                contentView.backgroundColor = [UIColor colorWithHexString_xt:newFlex.background];
            }else{
                contentView.backgroundColor = [UIColor whiteColor];
            }
            
            [contentView configureLayoutWithBlock:^(YGLayout * layout) {
                layout.isEnabled = YES;
                if([newFlex.flexDirection isEqualToString: @"column"]){
                    layout.flexDirection =  YGFlexDirectionColumn;
                }else{
                    layout.flexDirection =  YGFlexDirectionRow;
                }
                if (newFlex.marginLeft) {
                    if ([newFlex.marginLeft containsString:@"%"]) {
                        layout.marginLeft = YGPercentValue([newFlex.marginLeft floatValue]);
                    }else{
                        layout.marginLeft = YGPointValue([newFlex.marginLeft floatValue]);
                    }
                }
                if (newFlex.marginRight) {
                    if ([newFlex.marginRight containsString:@"%"]) {
                        layout.marginRight = YGPercentValue([newFlex.marginRight floatValue]);
                    }else{
                        layout.marginRight = YGPointValue([newFlex.marginRight floatValue]);
                    }
                }
                if (newFlex.marginTop) {
                    layout.marginTop = YGPointValue([newFlex.marginTop floatValue]);
                }
                if (newFlex.width) {
                    if ([newFlex.width containsString:@"%"]) {
                        layout.width = YGPercentValue([newFlex.width floatValue]);
                    }else{
                        layout.width = YGPointValue([newFlex.width floatValue]);
                    }
                }
                if(newFlex.height){
                    layout.height = YGPointValue([newFlex.height floatValue]);
                }
            }];
     
            
            
            
            
            
            self.currentFlex = newFlex;
            self.currentFatherFlex = self.currentElementsStack[self.currentElementsStack.count-1];
            self.currentFatherFlex.ParentFlexView = contentView;
            [self.currentFatherFlex.Flex addObject:newFlex];
//            self.currentFlex = self.currentElementsStack.lastObject;
            //Flex *fatherFlex = self.currentElementsStack[[self.currentElementsStack count] -1];
            [self.currentFatherFlex.FlexorderItem addObject:newFlex];
            [self.currentElementsStack addObject:newFlex];
           
        }
        
    } else if ([elementName isEqualToString:@"Image"]) {
        if(!self.currentFlex){
            self.currentFlex = self.currentElementsStack.lastObject;
        }
        self.currentImage = [[Imagecomponent alloc] init];
        self.currentImage.src = attributeDict[@"src"];
        self.currentImage.height = attributeDict[@"height"];
        self.currentImage.width = attributeDict[@"width"];
        self.currentImage.clickUrl = attributeDict[@"clickUrl"];
        self.currentImage.alignItems = attributeDict[@"alignItems"];
        self.currentImage.marginLeft = attributeDict[@"marginLeft"];
        self.currentImage.marginTop = attributeDict[@"marginTop"];
        self.currentImage.marginLeft = attributeDict[@"marginLeft"];
        self.currentImage.marginRight = attributeDict[@"marginRight"];
        [self.currentFlex.images addObject:self.currentImage];
        
        UIImageView *flexIMG = [flexItemIMG initWith:self.currentImage];
        [flexIMG configureLayoutWithBlock:^(YGLayout * layout) {
            layout.isEnabled = YES;
            if (self.currentFlex.marginLeft) {
                if ([self.currentFlex.marginLeft containsString:@"%"]) {
                    layout.marginLeft = YGPercentValue([self.currentFlex.marginLeft floatValue]);
                }else{
                    layout.marginLeft = YGPointValue([self.currentFlex.marginLeft floatValue]);
                }
            }
            if (self.currentFlex.marginRight) {
                if ([self.currentImage.marginRight containsString:@"%"]) {
                    layout.marginRight = YGPercentValue([self.currentFlex.marginRight floatValue]);
                }else{
                    layout.marginRight = YGPointValue([self.currentFlex.marginRight floatValue]);
                }
            }
            if (self.currentFlex.width) {
                if ([self.currentImage.width containsString:@"%"]) {
                    layout.width = YGPercentValue([self.currentFlex.width floatValue]);
                }else{
                    layout.width = YGPointValue([self.currentFlex.width floatValue]);
                }
            }
            if (self.currentFlex.height) {
                layout.height = YGPointValue([self.currentFlex.height floatValue]);
            }
            if (self.currentFlex.marginTop) {
                layout.marginTop = YGPointValue([self.currentFlex.marginTop floatValue]);
            }
            if (self.currentFlex.alignItems) {
                layout.alignItems = [self alignItems:self.currentFlex.alignItems];
            }
        }];
        if (!self.currentFlex.ParentFlex.ParentFlexView) {
            self.currentFlex.ParentFlex.ParentFlexView = [[UIView alloc] init];
        }
        [self.currentFlex.ParentFlexView addSubview: flexIMG];
        [self.currentFlex.FlexorderItem addObject:self.currentImage];
    } else if ([elementName isEqualToString:@"Text"]) {
        if(!self.currentFlex){
            self.currentFlex = self.currentElementsStack.lastObject;
        }
        self.currentText = [[Textcomponent alloc] init];
        self.currentText.text = attributeDict[@"text"];
        self.currentText.textSize = attributeDict[@"textSize"];
        self.currentText.textStyle = attributeDict[@"textStyle"];
        self.currentText.marginLeft = attributeDict[@"marginLeft"];
        self.currentText.marginRight = attributeDict[@"marginRight"];
        self.currentText.marginTop = attributeDict[@"marginTop"];
        self.currentText.height = attributeDict[@"height"];
        self.currentText.width = attributeDict[@"width"];
        self.currentText.textAlignment = attributeDict[@"textAlignment"];
        [self.currentFlex.texts addObject:self.currentText];
        
        
        flexItemLab *flexItem = [[flexItemLab alloc] init];
        UILabel *flexlab = [flexItem ItemLabinitWithText:self.currentText];
        [flexlab configureLayoutWithBlock:^(YGLayout * layout) {
            layout.isEnabled = YES;
            if (self.currentText.marginLeft) {
                layout.marginLeft = YGPointValue([self.currentText.marginLeft floatValue]);
            }
            if (self.currentText.marginRight) {
                layout.marginRight = YGPointValue([self.currentText.marginRight floatValue]);
            }
            if (self.currentText.marginTop) {
                layout.marginTop = YGPointValue([self.currentText.marginTop floatValue]);
            }
            if (self.currentText.width) {
                if ([self.currentText.width containsString:@"%"]) {
                    layout.width = YGPercentValue([self.currentText.width floatValue]);
                }else{
                    layout.width = YGPointValue([self.currentText.width floatValue]);
                }
            }
            if(self.currentText.height){
                layout.height = YGPointValue([self.currentText.height floatValue]);
            }
           
        }];
        if (!self.currentFlex.ParentFlex.ParentFlexView) {
            self.currentFlex.ParentFlex.ParentFlexView = [[UIView alloc] init];
        }
        [self.currentFlex.ParentFlexView addSubview: flexlab];
        
        [self.currentFlex.FlexorderItem addObject:self.currentText];
        
    }
//    self.currentElementValue = [[NSMutableString alloc] init];
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    // 只处理非空白字符
//        NSString *trimmedString = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
//        
//        if (trimmedString.length > 0) {
//            if (!self.currentElementValue) {
//                self.currentElementValue = [[NSMutableString alloc] init];
//            }
//            [self.currentElementValue appendString:trimmedString]; // 拼接非空白字符
//        }
   // [self.currentElementValue appendString:string];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    if ([elementName isEqualToString:@"Flex"]) {
        NSLog(@"xml解析堆栈数量---%ld",self.currentElementsStack.count);
//        if (self.currentFlex.ParentFlexView.subviews.count > 0) {
//            [self.currentFlex.ParentFlexView.yoga applyLayoutPreservingOrigin:YES];
//        }
        [self.currentElementsStack removeLastObject];
        self.currentFlex = nil;
        if(self.currentElementsStack.count == 1){
            NSLog(@"---");
        }
//        self.currentFlex = (self.currentFlex.Flex.count > 0) ? self.currentFlex.Flex.lastObject : nil;
    } else if ([elementName isEqualToString:@"Image"]) {
        self.currentImage = nil;
    } else if ([elementName isEqualToString:@"Text"]) {
        //self.currentText.text = [self.currentElementValue copy];
//        [self.currentFlex.texts addObject:self.currentText];
        self.currentText = nil;
    }
}
- (YGAlign)alignItems:(NSString *)alignItems{
    if([alignItems isEqualToString: @"center"]){
        return YGAlignCenter;
    }else if([alignItems isEqualToString: @"flexStart"]){
        return YGAlignFlexStart;
    }else if([alignItems isEqualToString: @"flexEnd"]){
        return YGAlignFlexEnd;
    }else {
        return YGAlignFlexStart;
    }
}
@end
