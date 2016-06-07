//
//  JTBDViewModel.h
//  ExampleProject
//
//  Created by EricYang on 7/06/2016.
//  Copyright © 2016 Eric. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "CommonUtils.h"
#import "JTBDRealm.h"
#import "JobRealm.h"
#import "JobViewModel.h"

@interface JTBDViewModel : NSObject

//Title on navigation bar
@property NSString *titleOnNavigation;

//Color of navigation background
@property UIColor *colorOnNavigation;

//Job No. 1
@property NSString *JobNoOne;

//Description
@property NSString *JTBDdescription;

//Jobs list -> TableView
@property NSArray *jobViewModels;

//Title on Button
@property NSString *titleOnButton;

//Command for StartJob button
@property (nonatomic, strong) RACCommand *JobButtonCommand;

@end
