//
//  JTBDModel.h
//  ExampleProject
//
//  Created by EricYang on 7/06/2016.
//  Copyright © 2016 Eric. All rights reserved.
//

#import <Mantle.h>
#import "JobModel.h"

@interface JTBDModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSNumber *id;
@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *JTBDdescription;
@property (nonatomic, copy, readonly) NSArray *jobs;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end