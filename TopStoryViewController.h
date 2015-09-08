//
//  TopStoryViewController.h
//  Jounal
//
//  Created by yishain on 8/11/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
@interface TopStoryViewController : UIViewController
{
    sqlite3 *db;
    
    NSMutableArray *TabelDaras;

}

@property (weak, nonatomic) IBOutlet UIView *textSq;

@end
