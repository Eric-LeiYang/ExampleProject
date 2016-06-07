//
//  CommonUtils.h
//  ExampleProject
//
//  Created by EricYang on 7/06/2016.
//  Copyright © 2016 Eric. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JTBDModel.h"
#import "JTBDRealm.h"
#import "JobModel.h"
#import "JobRealm.h"

#ifndef CommonUtils_h
#define CommonUtils_h

//Global Constants

//for titles
#define titleOnNavigationBar  @"Jobs to be done"
#define titleOnJobDoneButtonToFinishJob @"Finish Job"
#define titleOnJobDoneButtonToStartJob @"Start Job"

//for colors
#define jobUnStartedNavigationColor [UIColor colorWithRed:(39.0f/255.0f) green:(56.0f/255.0f) blue:(80.0f/255.0f) alpha:1.0f]
#define jobStartedNavigationColor [UIColor colorWithRed:(117.0f/255.0f) green:(211.0f/255.0f) blue:(73.0f/255.0f) alpha:1.0f]
#define backGroundBlueColor [UIColor colorWithRed:(84.0f/255.0f) green:(121.0f/255.0f) blue:(151.0f/255.0f) alpha:1.0f]

//status
typedef enum: NSInteger{
    JobStatusUnStarted = 1, //StartJob
    JobStatusStarted = 2 //FinishJob
}JobStatus;

//image in Assets
#define kCellImageArray [NSArray arrayWithObjects:@"icBarcode", @"icMeasurement", @"icMultipleChoice", @"icNumeric", @"icPicture", nil]

//Job Type array
#define kJobTypeArray [NSArray arrayWithObjects:@"BARCODES", @"MEASUREMENT", @"MULTIPLE_CHOICE", @"NUMERIC", @"IMAGES", nil]

#endif

@interface CommonUtils : NSObject

//from json file to dictionary
+ (NSDictionary *) dictionaryWithContentsOfJSONString: (NSString *)fileLocation;

//from dictionary to JTBDModel object
+ (JTBDModel *) JTBDModelFromDictionary: (NSDictionary *) dictionary;

//Persist to Realm
+ (BOOL) saveJTBDModelToRealm:(JTBDModel *) jtbdModel;

//Retrieval from Realm
+ (JTBDRealm *) getJTBDRealmFromRealm;

@end
