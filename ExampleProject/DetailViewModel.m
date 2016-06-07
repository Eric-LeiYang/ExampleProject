//
//  DetailViewModel.m
//  ExampleProject
//
//  Created by EricYang on 7/06/2016.
//  Copyright © 2016 Eric. All rights reserved.
//

#import "DetailViewModel.h"

@implementation DetailViewModel

#pragma mark: init methods
+(DetailViewModel *)sharedSingleton{
    static DetailViewModel *sharedSingleton;
    
    @synchronized(self) {
        if (!sharedSingleton) {
            
            //TODO:
            sharedSingleton = [[DetailViewModel alloc] init];
        }
        return sharedSingleton;
    }
}

@end
