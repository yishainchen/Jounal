//
//  Singleton.h
//  Jounal
//
//  Created by yishain on 9/2/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Singleton : NSObject

@property NSMutableDictionary *dict;

+ (id)sharedInstance;
@end
