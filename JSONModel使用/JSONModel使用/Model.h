//
//  Model.h
//  JSONModel使用
//
//  Created by 强淑婷 on 2018/10/20.
//  Copyright © 2018年 强淑婷. All rights reserved.
//

#import "JSONModel.h"

@interface StoriesModel: JSONModel
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *ga_prefix;
@property (nonatomic, copy)NSArray *images;
@property (nonatomic, copy)NSString *multipic;
@property (nonatomic, copy)NSString *id;
@end

@interface TopStoriesModel: JSONModel
@property (nonatomic, copy)NSString *image;
@property (nonatomic, copy)NSString *type;
@property (nonatomic, copy)NSString *id;
@property (nonatomic, copy)NSString *ga_prefix;
@property (nonatomic, copy)NSString *title;
@end

@interface Model : JSONModel

@property (nonatomic, copy)NSString *date;
@property (nonatomic, copy)NSArray<StoriesModel*> *stories;
@property (nonatomic, copy)NSArray<TopStoriesModel*> *top_stories;

@end


