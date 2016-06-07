//
//  JobModel.h
//  ExampleProject
//
//  Created by EricYang on 7/06/2016.
//  Copyright © 2016 Eric. All rights reserved.
//

#import <Mantle.h>
#import <NSObjectCoder/NSObjectCoder.h>
#import <Realm/Realm.h>


@interface JobModel : MTLModel  <MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSNumber *id;
@property (nonatomic, copy, readonly) NSString *jobShortTitle;
@property (nonatomic, copy, readonly) NSString *jobLongTitle;
@property (nonatomic, copy, readonly) NSString *jobType;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end

