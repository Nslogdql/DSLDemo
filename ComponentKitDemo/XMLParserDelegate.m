//
//  XMLParserDelegate.m
//  ComponentKitDemo
//
//  Created by 董其林 on 2024/10/11.
//

#import "XMLParserDelegate.h"
#import "Flex.h"

@interface XMLParserDelegate()

@property(nonatomic, strong)NSMutableArray *openTag;
@end

@implementation XMLParserDelegate
- (instancetype)init {
    self = [super init];
    if (self) {
        _FatherrootFlex = [[Flex alloc] init];
        _currentFlex = [[Flex alloc] init];
        _currentElementsStack = [NSMutableArray array];
        _openTag = [NSMutableArray array];
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
            self.currentFlex = newFlex;
            self.FatherrootFlex = newFlex;
//            [self.currentFlex.FlexorderItem addObject:newFlex];
            [self.currentElementsStack addObject:newFlex];
            [self.openTag addObject:elementName];
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
            
            [self.currentFlex.FlexorderItem addObject:newFlex];
            
            newFlex.ParentFlex = self.currentFlex;
            self.currentFlex = newFlex;
            self.currentFatherFlex = self.currentElementsStack[self.currentElementsStack.count-1];
            [self.currentFatherFlex.Flex addObject:newFlex];
            [self.openTag addObject:elementName];
//            [self.currentFatherFlex.FlexorderItem addObject:newFlex];
            [self.currentElementsStack addObject:newFlex];
        }
        
    } else if ([elementName isEqualToString:@"Image"]) {
//        if(!self.currentFlex){
//            self.currentFlex = self.currentElementsStack.lastObject;
//        }
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
        [self.currentFlex.content addObject:self.currentImage];
        [self.currentFlex.FlexorderItem addObject:self.currentImage];
        [self.openTag addObject:elementName];
    } else if ([elementName isEqualToString:@"Text"]) {
//        if(!self.currentFlex){
//            self.currentFlex = self.currentElementsStack.lastObject;
//        }
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
        [self.currentFlex.content addObject:self.currentText];
        [self.currentFlex.FlexorderItem addObject:self.currentText];
        
        [self.openTag addObject: elementName ];
        
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
    
    NSLog(@"%s", __FUNCTION__);
    NSLog(@"%@%@%@", elementName, namespaceURI, qName);
    if ([elementName isEqualToString:self.openTag.lastObject]) {
        //开标签与闭标签符合
        
        //说明这个flex到了闭合标签了,到底了,再挂载内容应该往上找了
        if ([elementName isEqualToString:@"Flex"]) {
            Flex *lNode = self.currentFlex;
            Flex *newLastNode = lNode.ParentFlex;
            self.currentFlex = newLastNode;
        }
    }
    [self.openTag removeLastObject];
    
    if ([elementName isEqualToString:@"Flex"]) {
//        NSLog(@"xml解析堆栈数量---%ld",self.currentElementsStack.count);
//        [self.currentElementsStack removeLastObject];
//        self.currentFlex = nil;
//        if(self.currentElementsStack.count == 1){
//            NSLog(@"---");
//        }
//        self.currentFlex = (self.currentFlex.Flex.count > 0) ? self.currentFlex.Flex.lastObject : nil;
    } else if ([elementName isEqualToString:@"Image"]) {
        self.currentImage = nil;
    } else if ([elementName isEqualToString:@"Text"]) {
        //self.currentText.text = [self.currentElementValue copy];
//        [self.currentFlex.texts addObject:self.currentText];
        self.currentText = nil;
    }

}

@end
