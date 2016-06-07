//
//  JTBDModel.m
//  ExampleProject
//
//  Created by EricYang on 7/06/2016.
//  Copyright © 2016 Eric. All rights reserved.
//

#import "JTBDModel.h"

@implementation JTBDModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionaryValue{
    self = [super initWithDictionary:dictionaryValue error:nil];
    if (self == nil) return nil;
    
    return self;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"id": @"id",
             @"name": @"name",
             @"JTBDdescription": @"description",
             @"jobs": @"jobs"
             };
}

+ (NSValueTransformer *)jobModelsJSONTransformer
{
    return [MTLJSONAdapter arrayTransformerWithModelClass:[JobModel class]];
}

@end
