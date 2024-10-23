//
//  flexItemIMG.m
//  ComponentKitDemo
//
//  Created by 董其林 on 2024/10/11.
//

#import "flexItemIMG.h"
#import <SDWebImage/UIImageView+WebCache.h>
@implementation flexItemIMG
//@property (nonatomic, strong) NSString *src;
//@property (nonatomic, strong) NSString *height;
//@property (nonatomic, strong) NSString *width;
//@property (nonatomic, strong) NSString *clickUrl;
+ (UIImageView *)initWith:(Imagecomponent *)ImageModel with:(FlexJson *)json{
    UIImageView *ItemIMG = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [ImageModel.width floatValue], [ImageModel.height floatValue])];
    ItemIMG.contentMode = UIViewContentModeScaleToFill;
    ItemIMG.backgroundColor = [UIColor clearColor];
    if(ImageModel.src.length > 0){
        if ([ImageModel.src containsString:@"json"]) {
            NSString *source = [[ImageModel.src componentsSeparatedByString:@"."] lastObject];
            if([source hasPrefix:@"http"]){
                [ItemIMG sd_setImageWithURL:[NSURL URLWithString:source] placeholderImage:nil];
            }else{
                NSString *iconname = [json valueForKeyPath:source];
                ItemIMG.image = [UIImage imageNamed:iconname];
            }
            
        }else if([ImageModel.src hasPrefix:@"http"]){
            [ItemIMG sd_setImageWithURL:[NSURL URLWithString:ImageModel.src] placeholderImage:nil];
        }else{
            ItemIMG.image = [UIImage imageNamed:ImageModel.src];
        }
        
    }   
    return ItemIMG;
}
@end
