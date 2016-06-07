//
//  JobRealm.h
//  ExampleProject
//
//  Created by EricYang on 7/06/2016.
//  Copyright © 2016 Eric. All rights reserved.
//

#import <Realm/Realm.h>

@interface JobRealm : RLMObject

@property int id;
@property NSString *jobShortTitle;
@property NSString *jobLongTitle;
@property NSString *jobType;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<JobRealm>
RLM_ARRAY_TYPE(JobRealm)
