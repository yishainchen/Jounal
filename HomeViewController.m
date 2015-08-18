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

@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UILabel *iv1;
    UITextField *iv2;

}
@property (weak, nonatomic) IBOutlet UITableView *tabelView;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabelView.delegate = self;
    self.tabelView.dataSource = self;
    [self getdata];
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
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        iv1 = (UILabel *)[cell viewWithTag:200];
        iv2 = (UITextField *)[cell viewWithTag:300];
    }
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
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

@end
