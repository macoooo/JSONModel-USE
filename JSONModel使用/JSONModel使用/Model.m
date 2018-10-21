//
//  Model.m
//  JSONModel使用
//
//  Created by 强淑婷 on 2018/10/20.
//  Copyright © 2018年 强淑婷. All rights reserved.
//

#import "Model.h"

@implementation Model

+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}
@end
@implementation StoriesModel

+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}
@end
@implementation TopStoriesModel

+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}
@end
