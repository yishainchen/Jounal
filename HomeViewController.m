//
//  HomeViewController.m
//  Jounal
//
//  Created by yishain on 8/11/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//

#import "HomeViewController.h"
#import "EricTableViewCell.h"
#import <AFNetworking/AFNetworking.h>
#import "NextViewController.h"
@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate>
{
  
    NSDictionary *dict;
    int i;
}
@property (weak, nonatomic) IBOutlet UITableView *tabelView;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabelView.delegate = self;
    self.tabelView.dataSource = self;
    [self getdata];
    self.navigationItem.hidesBackButton = YES;
    //隱藏top
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EricTableViewCell *cell = (EricTableViewCell *) [self.tabelView cellForRowAtIndexPath:indexPath];
    static NSString *CellIdentifier = @"Cell";
    i = indexPath.row;
    NSLog(@"i = %i",i);
    UIImageView *iv = (UIImageView *)[cell viewWithTag:100];
    iv.image = nil;//不重複使用畫面
//    PFFile *imageData = event[@"image"];
//    [imageData getDataInBackgroundWithBlock:^(NSData *imgData , NSError *error) {
//        if (error == nil) {
//            iv.image = [UIImage imageWithData:imgData];
//            iv.backgroundColor = [UIColor clearColor];
//        }
//        else {
//            
//        }
//    }];
    UILabel *iv1 = (UILabel *)[cell viewWithTag:200];
    UITextView *iv2 = (UITextView *)[cell viewWithTag:300];
    
    iv1.text = dict[@"response"][@"docs"][i][@"headline"][@"main"];
    iv2.text = dict[@"response"][@"docs"][i][@"lead_paragraph"];
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 1;
}

-(void)getdata {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://api.nytimes.com/svc/search/v2/articlesearch.json?api-key=fcbb2a25b234976333ca4a3cf30c4388%3A9%3A56417405"
       parameters:@{@"api-key":@"fcbb2a25b234976333ca4a3cf30c4388:9:56417405"}
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              NSLog(@"success");
              NSLog(@"response: %@", responseObject);
              dict = responseObject;
              NSLog(@"eric = %@",dict[@"response"][@"docs"][i][@"headline"][@"main"]);
             
              self.urlString = dict[@"response"][@"docs"][i][@"web_url"];
          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              NSLog(@"failure: %@", error);
          }];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NextViewController *nextVC = segue.destinationViewController;
    nextVC.strurl = self.urlString;

}
@end
