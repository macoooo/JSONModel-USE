//
//  ViewController.m
//  JSONModel使用
//
//  Created by 强淑婷 on 2018/10/20.
//  Copyright © 2018年 强淑婷. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong)UIWebView *webView;
@property (nonatomic, strong)Model *hourlyModel;
@property (nonatomic, strong)NSMutableArray *titleMutableArray;
@property (nonatomic, strong)NSMutableArray *imagesMutableArray;
@property (nonatomic, strong)UILabel *label;
@end

@implementation ViewController
- (void)creatGet{
    NSLog(@"dfgdfhghgfdhh");
    //确定请求路径
    NSString *urlString = @"https://news-at.zhihu.com/api/4/news/latest";
    //在使用url的时候，如果字符串中有中文，那么要对中文进行转码操作
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *url = [NSURL URLWithString:urlString];
    //创建请求对象
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //创建会话对象
    NSURLSession *sharedSession = [NSURLSession sharedSession];
    //根据会话对象来创建请求task任务
    NSURLSessionDataTask *dataTask = [sharedSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(data && (error == nil)){
            //网络访问成功，解析数据
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            self->_titleMutableArray = [NSMutableArray array];
            self->_imagesMutableArray = [NSMutableArray array];
            self->_hourlyModel = [[Model alloc]initWithDictionary:dict error:nil];
            for(int i = 0;i < self->_hourlyModel.stories.count;i++){
                StoriesModel *storiesModel = [[StoriesModel alloc]initWithDictionary:dict[@"stories"][i] error:nil];
                NSLog(@"%@", storiesModel.title);
                NSString *string = storiesModel.title;
                [self.titleMutableArray addObject:string];
                [self.imagesMutableArray addObject:storiesModel.images[0]];
            }
            NSLog(@"1---%@---", self.titleMutableArray[0]);
            for(int i = 0;i < self->_hourlyModel. top_stories.count;i++){
                TopStoriesModel *topStoriesModel = [[TopStoriesModel alloc]initWithDictionary:dict[@"top_stories"][i] error:nil];
                 NSLog(@"%@", topStoriesModel);
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                self->_label.text =  self.titleMutableArray[0];
            });
        }
        else{
            //网络访问失败
            NSLog(@"error = %@", error);
        }
    } ];
    //执行发送请求任务
    [dataTask resume];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatGet];
    NSLog(@"3---%@----", _titleMutableArray);
    _label = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
//    label.backgroundColor = [UIColor blackColor];
//    label.textColor = [UIColor whiteColor];
//    label.text =  self.imagesMutableArray[0];
    //
    //NSLog(@"gdfgg%@",label.text);
    [self.view addSubview:_label];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
