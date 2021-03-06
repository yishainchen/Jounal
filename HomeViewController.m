//
//  HomeViewController.m
//  Jounal
//
//  Created by yishain on 8/11/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//
#import "ViewController.h"
#import "HomeViewController.h"
#import "EricTableViewCell.h"
#import <AFNetworking/AFNetworking.h>
#import "NextViewController.h"
#import <SVProgressHUD/SVProgressHUD.h>
@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UILabel *iv1;
    UITextView *iv2;
    NSDictionary *dict;
    int i;
}
@property (weak, nonatomic) IBOutlet UIButton *backBtn;

@property (weak, nonatomic) IBOutlet UITableView *tabelView;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tabelView.delegate = self;
    self.tabelView.dataSource = self;
    [self getdata];
    
    self.navigationController.hidesBarsOnSwipe = YES;
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
      cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    [self getdata];
    i = indexPath.row + 1;
    NSLog(@"i = %i",i);
//    UIImageView *iv = (UIImageView *)[cell viewWithTag:100];
//    iv.image = nil;
    //不重複使用畫面
    
    iv1 = (UILabel *)[cell viewWithTag:200];
    iv2 = (UITextView *)[cell viewWithTag:300];
    
    if (dict[@"response"][@"docs"][i][@"headline"][@"main"] == nil) {
        iv1.text = @"Loading...";
    }
    else {
        iv1.text = dict[@"response"][@"docs"][i][@"headline"][@"main"];
    }
    
    if (dict[@"response"][@"docs"][i][@"lead_paragraph"] == nil) {
        iv2.text = @"Loading...";
    }
    else {
         iv2.text = dict[@"response"][@"docs"][i][@"lead_paragraph"];
    }


    NSLog(@"image = %@",dict[@"response"][@"docs"][i][@"multimedia"][0][@"url"]);
    self.urlString = dict[@"response"][@"docs"][i][@"web_url"];
    [SVProgressHUD dismiss];

//    iv.image =
    
    
   
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 8;
}

-(void)getdata {
    [SVProgressHUD show];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://api.nytimes.com/svc/search/v2/articlesearch.json?api-key=fcbb2a25b234976333ca4a3cf30c4388%3A9%3A56417405"
       parameters:@{@"api-key":@"fcbb2a25b234976333ca4a3cf30c4388:9:56417405"}
          success:^(AFHTTPRequestOperation *operation, id responseObject) {

              dict = responseObject;
            
             
              
          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              NSLog(@"failure: %@", error);
          }];
}

- (IBAction)btnBack:(id)sender {
    ViewController *VC = [self.storyboard instantiateViewControllerWithIdentifier:@"Login"];
    [self presentViewController:VC animated:YES completion:nil];
    
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
