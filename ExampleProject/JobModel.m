//
//  JobModel.m
//  ExampleProject
//
//  Created by EricYang on 7/06/2016.
//  Copyright © 2016 Eric. All rights reserved.
//

#import "JobModel.h"

@implementation JobModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionaryValue{
    self = [super initWithDictionary:dictionaryValue error:nil];
    if (self == nil) return nil;
    
    // Store a value that needs to be determined locally upon initialization.
    return self;
}


+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"id": @"id",
             @"jobShortTitle": @"jobShortTitle",
             @"jobLongTitle": @"jobLongTitle",
             @"jobType": @"jobType"
             };
}


@end
