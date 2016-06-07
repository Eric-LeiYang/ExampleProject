//
//  JobViewModel.h
//  ExampleProject
//
//  Created by EricYang on 7/06/2016.
//  Copyright © 2016 Eric. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "JobRealm.h"

@interface JobViewModel : NSObject

//for icon
@property NSString *jobType;

//for title
@property NSString *jobShortTitle;

//for detail
@property NSString *jobLongTitle;

//init method
- (instancetype)initWith:(JobRealm *)jobRealm;

@end
