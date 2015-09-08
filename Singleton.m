//
//  Singleton.m
//  Jounal
//
//  Created by yishain on 9/2/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton


+ (id)sharedInstance {
    static dispatch_once_t onceToken = 0;
    
    __strong static id _sharedObject = nil;
    
    dispatch_once(&onceToken, ^{
        _sharedObject = [[self alloc]init];
    });
    
    return _sharedObject;
}

- (id)init {
    self = [super init];
    
    if (self) {
        self.dict = [[NSMutableDictionary alloc]init];
    }
    return self;
}

@end
