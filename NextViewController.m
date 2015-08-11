//
//  NextViewController.m
//  Jounal
//
//  Created by yishain on 8/11/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//

#import "NextViewController.h"
#import "HomeViewController.h"
#import "LineActivity.h"
@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backHome:(id)sender {
    HomeViewController *homeVC = [self.storyboard instantiateViewControllerWithIdentifier:@"home"];
    [self presentViewController:homeVC animated:YES completion:nil];
}
- (IBAction)shareBtn:(id)sender {
    UIImage *image = [UIImage imageNamed:@"Venice"];
    
    NSMutableArray *mArray = [[NSMutableArray alloc] initWithArray:@[@"嗨!最近找個時間來聚聚吧",image]];
    
    if (self.strurl) {
        //array = @[@"嗨!最近找個時間來聚聚吧",image,_strurl];
        NSLog(@"server return nil");
        [mArray addObject:self.strurl];
    }else{
        
    }
    LineActivity *line = [[LineActivity alloc ]init];
    UIActivityViewController *controller = [[UIActivityViewController alloc] initWithActivityItems:mArray   applicationActivities:@[line]];
    controller.excludedActivityTypes = @[UIActivityTypePostToFacebook];
    
    [self presentViewController:controller animated:YES completion:nil];
}

- (IBAction)favoBtn:(id)sender {
    
    
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
