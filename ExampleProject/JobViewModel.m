//
//  JobViewModel.m
//  ExampleProject
//
//  Created by EricYang on 7/06/2016.
//  Copyright © 2016 Eric. All rights reserved.
//

#import "JobViewModel.h"

@implementation JobViewModel

- (instancetype)initWith:(JobRealm *)jobRealm{
    self = [super init];
    if (self) {
        [self initializeWith:jobRealm];
    }
    return self;
}

//initialize
- (void)initializeWith:(JobRealm *)jobRealm {
    
    self.jobLongTitle = jobRealm.jobLongTitle;
    self.jobShortTitle = jobRealm.jobShortTitle;
    self.jobType = jobRealm.jobType;
}

@end
