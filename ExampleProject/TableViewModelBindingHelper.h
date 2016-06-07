//
//  TableViewModelBindingHelper.h
//  ExampleProject
//
//  Created by EricYang on 7/06/2016.
//  Copyright © 2016 Eric. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "JobViewModel.h"
#import "CommonUtils.h"

@protocol TableViewModelBindingHelperDelegate <NSObject>

@required

-(void) didSelectRowWithJobLongTitle:(NSString *)jobLongTitle;

@end

@interface TableViewModelBindingHelper : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) id<TableViewModelBindingHelperDelegate> delegate;

- (instancetype) initWithTableView:(UITableView *)tableView
                      sourceSignal:(RACSignal *)source;


@end
