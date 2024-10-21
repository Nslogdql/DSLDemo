//
//  XMLParserDelegate.m
//  ComponentKitDemo
//
//  Created by 董其林 on 2024/10/11.
//

#import "XMLParserDelegate.h"
#import "Flex.h"
#import "NBData.h"
@interface XMLParserDelegate()

@property(nonatomic, strong)NSMutableArray *openTag;
@end

@implementation XMLParserDelegate
- (instancetype)init {
    self = [super init];
    if (self) {
        _FatherrootFlex = [[Flex alloc] init];
        _currentFlex = [[Flex alloc] init];
        _openTag = [NSMutableArray array];
    }
    return self;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
    //走UI
    
    if ([elementName isEqualToString:@"Flex"]) {
        
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
        newFlex.justifyContent = attributeDict[@"justifyContent"];
        
        if(self.openTag.count == 0){
            //根节点
            self.FatherrootFlex = newFlex;
            self.FatherrootFlexCopy = [newFlex mutableCopy];
        } else {
            newFlex.ParentFlex = self.currentFlex;
        }
        [self.openTag addObject:elementName];
        [self.currentFlex.FlexorderItem addObject:newFlex];
        
        
        self.currentFlex = newFlex;
    } else if ([elementName isEqualToString:@"Image"]) {
        self.currentImage = [[Imagecomponent alloc] init];
        self.currentImage.key = attributeDict[@"key"];
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

        self.currentText = [[Textcomponent alloc] init];
        self.currentText.key = attributeDict[@"key"];
        self.currentText.text = attributeDict[@"text"];
        self.currentText.textSize = attributeDict[@"textSize"];
        self.currentText.textStyle = attributeDict[@"textStyle"];
        self.currentText.marginLeft = attributeDict[@"marginLeft"];
        self.currentText.marginRight = attributeDict[@"marginRight"];
        self.currentText.marginTop = attributeDict[@"marginTop"];
        self.currentText.height = attributeDict[@"height"];
        self.currentText.width = attributeDict[@"width"];
        if (attributeDict[@"onclick"].length > 0) {
            NSString *jsonstr = attributeDict[@"onclick"];
            NSDictionary *dic = [NBData dictionaryWithJsonString:jsonstr];
            self.currentText.onclick = dic;
        }
        
        self.currentText.background = attributeDict[@"background"];
        self.currentText.textAlignment = attributeDict[@"textAlignment"];
        [self.currentFlex.texts addObject:self.currentText];
        [self.currentFlex.content addObject:self.currentText];
        
        [self.currentFlex.FlexorderItem addObject:self.currentText];
        
        [self.openTag addObject: elementName ];
        
    }else if ([elementName isEqualToString:@"Button"]) {
        
        self.currentButton = [[Buttoncomponent alloc] init];
        self.currentButton.key = attributeDict[@"key"];
        self.currentButton.text = attributeDict[@"text"];
        self.currentButton.textSize = attributeDict[@"textSize"];
        self.currentButton.textStyle = attributeDict[@"textStyle"];
        self.currentButton.marginLeft = attributeDict[@"marginLeft"];
        self.currentButton.marginRight = attributeDict[@"marginRight"];
        self.currentButton.marginTop = attributeDict[@"marginTop"];
        self.currentButton.height = attributeDict[@"height"];
        self.currentButton.width = attributeDict[@"width"];
        self.currentButton.selecttext = attributeDict[@"selecttext"];
        
        if (attributeDict[@"onclick"].length > 0) {
            NSString *jsonstr = attributeDict[@"onclick"];
            NSDictionary *dic = [NBData dictionaryWithJsonString:jsonstr];
            self.currentButton.onclick = dic;
        }
        
        self.currentButton.background = attributeDict[@"background"];
        self.currentButton.textAlignment = attributeDict[@"textAlignment"];
        [self.currentFlex.buttons addObject:self.currentButton];
        [self.currentFlex.content addObject:self.currentButton];
        
        [self.currentFlex.FlexorderItem addObject:self.currentButton];
        
        [self.openTag addObject: elementName ];
        
    }else if ([elementName isEqualToString:@"List"]) {
        
        
        self.currentList = [[Listcomponent alloc] init];
        self.currentList.key = attributeDict[@"key"];
        self.currentList.width = attributeDict[@"width"];
        self.currentList.height = attributeDict[@"height"];
        self.currentList.alignItems = attributeDict[@"alignItems"];
        self.currentList.background = attributeDict[@"background"];
        self.currentList.flexDirection = attributeDict[@"flexDirection"];
        self.currentList.paddingBottom = attributeDict[@"paddingBottom"];
        self.currentList.marginTop = attributeDict[@"marginTop"];
        self.currentList.marginLeft = attributeDict[@"marginLeft"];
        self.currentList.marginRight = attributeDict[@"marginRight"];
        self.currentList.padding = attributeDict[@"padding"];
        self.currentList.flexGrow = attributeDict[@"flexGrow"];
        self.currentList.justifyContent = attributeDict[@"justifyContent"];
        if (attributeDict[@"source"].length > 0) {
            NSString *jsonstr = attributeDict[@"source"];
            // 将字符串转换为 NSData
            NSData *jsonData = [jsonstr dataUsingEncoding:NSUTF8StringEncoding];
            NSError *error;
            // 使用 NSJSONSerialization 解析 JSON 数据
            NSArray *array = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
            self.currentList.source = [NSMutableArray arrayWithArray:array];
        }
        
        
        
        if (attributeDict[@"onclick"].length > 0) {
            NSString *jsonstr = attributeDict[@"onclick"];
            NSDictionary *dic = [NBData dictionaryWithJsonString:jsonstr];
            self.currentList.onclick = [NSMutableDictionary dictionaryWithDictionary:dic];
        }
        
        [self.currentFlex.lists addObject:self.currentList];
        [self.currentFlex.content addObject:self.currentList];
        
        [self.currentFlex.FlexorderItem addObject:self.currentList];
        
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
//        self.currentFlex = (self.currentFlex.Flex.count > 0) ? self.currentFlex.Flex.lastObject : nil;
    } else if ([elementName isEqualToString:@"Image"]) {
        self.currentImage = nil;
    } else if ([elementName isEqualToString:@"Text"]) {
        //self.currentText.text = [self.currentElementValue copy];
//        [self.currentFlex.texts addObject:self.currentText];
        self.currentText = nil;
    }else if ([elementName isEqualToString:@"Button"]) {
        //self.currentText.text = [self.currentElementValue copy];
//        [self.currentFlex.texts addObject:self.currentText];
        self.currentButton = nil;
    }else if ([elementName isEqualToString:@"List"]) {
        //self.currentText.text = [self.currentElementValue copy];
//        [self.currentFlex.texts addObject:self.currentText];
        self.currentList = nil;
    }

}

@end
