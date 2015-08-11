//
//  LineActivity.m
//  Jounal
//
//  Created by yishain on 8/11/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//


#import "LineActivity.h"

@implementation LineActivity

-(NSString *)activityTitle {
    return  @"Line";
}
-(UIImage *)activityImage {
    return [UIImage imageNamed:@"Line.png"];
}
-(BOOL)canPerformWithActivityItems:(NSArray *)activityItems {
    BOOL result = NO;
    for (id item in activityItems) {
        if([item class] == [UIImage class]) {
            
            return YES;
            break;
        }
    }
    return result;
}
-(void)prepareWithActivityItems:(NSArray *)activityItems {
    for (id item in activityItems) {
        shareImage = item;
        break;
    }
}
-(void)performActivity {
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    [pasteboard setData:UIImagePNGRepresentation(shareImage) forPasteboardType:@"public.png"];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"line://msg/image/%@",pasteboard.name]];
    if([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url];
    }
    else {
        NSURL *ituneURL = [NSURL URLWithString:@"itms-apps://itunes.apple.com/app/id443904275"];
        [[UIApplication sharedApplication] openURL:ituneURL];
    }
    [self activityDidFinish:YES];
}




@end
