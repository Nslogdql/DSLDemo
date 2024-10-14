//
//  flexItemIMG.m
//  ComponentKitDemo
//
//  Created by 董其林 on 2024/10/11.
//

#import "flexItemIMG.h"

@implementation flexItemIMG
//@property (nonatomic, strong) NSString *src;
//@property (nonatomic, strong) NSString *height;
//@property (nonatomic, strong) NSString *width;
//@property (nonatomic, strong) NSString *clickUrl;
+ (UIImageView *)initWith:(Imagecomponent *)ImageModel{
    UIImageView *ItemIMG = [[UIImageView alloc] init];
    ItemIMG.contentMode = UIViewContentModeScaleAspectFill;
    ItemIMG.backgroundColor = [UIColor clearColor];
    if(ImageModel.src.length > 0){
        ItemIMG.image = [UIImage imageNamed:ImageModel.src];
    }
    return ItemIMG;
}
@end
