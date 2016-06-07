//
//  JTBDRealm.h
//  ExampleProject
//
//  Created by EricYang on 7/06/2016.
//  Copyright © 2016 Eric. All rights reserved.
//

#import <Realm/Realm.h>
#import "JobRealm.h"

@interface JTBDRealm : RLMObject

@property int id;
@property NSString *name;
@property NSString *description;
@property RLMArray<JobRealm> *jobs;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<JTBDRealm>
RLM_ARRAY_TYPE(JTBDRealm)
