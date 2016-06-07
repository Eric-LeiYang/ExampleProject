//
//  JTBDViewModel.m
//  ExampleProject
//
//  Created by EricYang on 7/06/2016.
//  Copyright © 2016 Eric. All rights reserved.
//

#import "JTBDViewModel.h"

@interface JTBDViewModel(){
    JobStatus currentJobStatus;
}
@end

@implementation JTBDViewModel

#pragma mark: init methods
- (instancetype)init {
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

//initialize
- (void)initialize {
    
    //JTBDModel from JSON
    NSDictionary *infomation = [CommonUtils dictionaryWithContentsOfJSONString:@"sampleData.json"];
    JTBDModel *model = [CommonUtils JTBDModelFromDictionary:infomation];
    
    //saving to Realm
    if ([CommonUtils saveJTBDModelToRealm:model] != YES) {
        return;
    };
    
    //Data from Realm
    JTBDRealm *jtbdRealm = [CommonUtils getJTBDRealmFromRealm];
    
    //render value from Realm to ViewModel
    self.titleOnNavigation = titleOnNavigationBar;
    self.JobNoOne = jtbdRealm.name;
    self.JTBDdescription = jtbdRealm.description;
    
    //for JobViewModel array
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    
    for (JobRealm *jobRealm in jtbdRealm.jobs) {
        JobViewModel *jobViewModel = [[JobViewModel alloc] initWith:jobRealm];
        [tempArray addObject:jobViewModel];
    }
    
    self.jobViewModels = tempArray;
    
    //default value
    self.colorOnNavigation = jobUnStartedNavigationColor;
    self.titleOnButton = titleOnJobDoneButtonToStartJob;
    currentJobStatus = JobStatusUnStarted;
}

- (RACCommand *)JobButtonCommand {
    if (!_JobButtonCommand) {
        _JobButtonCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            return [RACSignal defer:^{
                // Do stuff
                [self setNavigationColorAndButtonTitleAccordingToStatus];
                
                return [RACSignal empty];
            }];
        }];
    }
    return _JobButtonCommand;
}

- (void) setNavigationColorAndButtonTitleAccordingToStatus{
    switch (currentJobStatus) {
        case JobStatusUnStarted:
            currentJobStatus = JobStatusStarted;
            self.colorOnNavigation = jobStartedNavigationColor;
            self.titleOnButton = titleOnJobDoneButtonToFinishJob;
            break;
        case JobStatusStarted:
            currentJobStatus = JobStatusUnStarted;
            self.colorOnNavigation = jobUnStartedNavigationColor;
            self.titleOnButton = titleOnJobDoneButtonToStartJob;
            break;
        default:
            break;
    }
}

@end
