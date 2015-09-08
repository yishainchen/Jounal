//
//  ViewController.m
//  Jounal
//
//  Created by yishain on 8/11/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking/AFNetworking.h>

@interface ViewController ()
{
    NSDictionary *dict;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)getdata {

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://api.nytimes.com/svc/search/v2/articlesearch.json?api-key=fcbb2a25b234976333ca4a3cf30c4388%3A9%3A56417405"
      parameters:@{@"api-key":@"fcbb2a25b234976333ca4a3cf30c4388:9:56417405"}
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             dict = responseObject;
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"failure: %@", error);
         }];
}
@end
