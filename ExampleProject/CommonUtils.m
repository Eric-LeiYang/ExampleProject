//
//  CommonUtils.m
//  ExampleProject
//
//  Created by EricYang on 7/06/2016.
//  Copyright © 2016 Eric. All rights reserved.
//

#import "CommonUtils.h"

@implementation CommonUtils

+ (NSDictionary *) dictionaryWithContentsOfJSONString: (NSString *)fileLocation{
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:[fileLocation stringByDeletingPathExtension] ofType:[fileLocation pathExtension]];
    NSData* data = [NSData dataWithContentsOfFile:filePath];
    __autoreleasing NSError* error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:data
                                                options:kNilOptions error:&error];
    if (error != nil) return nil;
    
    return result;
}

+ (JTBDModel *) JTBDModelFromDictionary: (NSDictionary *) dictionary{
    
    NSError *error = nil;
    JTBDModel *jtbdModel = [MTLJSONAdapter modelOfClass:JTBDModel.class fromJSONDictionary:dictionary error:&error];
    
    return jtbdModel;
}

+ (BOOL) saveJTBDModelToRealm:(JTBDModel *) jtbdModel{
    
    NSError *error = nil;
    NSDictionary *jtbdModelDictionary = [MTLJSONAdapter JSONDictionaryFromModel:jtbdModel error:&error];
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    @autoreleasepool {
        
        [realm transactionWithBlock:^{
            [JTBDRealm createInRealm:realm withValue:jtbdModelDictionary];
            
        }];
    }
    
    if (error != nil) {
        return NO;
    }
    
    return YES;
}

+ (JTBDRealm *) getJTBDRealmFromRealm{
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    @autoreleasepool {
        RLMResults *jtbdRealmResults = [JTBDRealm allObjectsInRealm:realm];
        
        JTBDRealm *jtbdRealm = jtbdRealmResults[0];
        
        return jtbdRealm;
    }
}


@end
