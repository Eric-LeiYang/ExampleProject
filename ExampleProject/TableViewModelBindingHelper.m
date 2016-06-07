//
//  TableViewModelBindingHelper.m
//  ExampleProject
//
//  Created by EricYang on 7/06/2016.
//  Copyright © 2016 Eric. All rights reserved.
//

#import "TableViewModelBindingHelper.h"

@interface TableViewModelBindingHelper(){
    UITableView *_tableView;
    NSArray *_data;
    UITableViewCell *_templateCell;
}

@end

@implementation TableViewModelBindingHelper

- (instancetype) initWithTableView:(UITableView *)tableView
                      sourceSignal:(RACSignal *)source{
    
    if (self = [super init]) {
        _tableView = tableView;
        _tableView.delegate = self;
        
        
        _data = [[NSArray alloc] init];
        
        //view model updates -> store latest data and tableview reload
        [source subscribeNext:^(id data) {
            _data = data;
            [_tableView reloadData];
        }];
        
        //datasource delegate
        _tableView.dataSource = self;
    }
    return self;
}

- (void) rowDidSelected:(int)row{
    
}

#pragma mark: tableView delegate
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _data.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JobViewModel *jobViewModel = (JobViewModel *) _data[indexPath.row];
    
    //init cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JobCell" forIndexPath:indexPath];
    
    //text and color
    cell.textLabel.text = jobViewModel.jobShortTitle;
    cell.textLabel.textColor = [UIColor whiteColor];
    
    //font
    cell.textLabel.font = [UIFont fontWithName:@"Baskerville" size:15];
    
    //image
    //go through the job type array
    for (int i = 0; i < kJobTypeArray.count; i++) {
        
        //find a type match
        if ([jobViewModel.jobType containsString:kJobTypeArray[i]]) {
            
            //render the image
            UIImage *image = [UIImage imageNamed:kCellImageArray[i]];
            cell.imageView.image = image;
            break;
        }
    }
    
    //selection background color
    UIView *bgColorView = [[UIView alloc] init];
    bgColorView.backgroundColor = backGroundBlueColor;
    [cell setSelectedBackgroundView:bgColorView];
    
    return cell;
}

//TODO:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    JobViewModel *jobViewModel = (JobViewModel *) _data[indexPath.row];
    //delegate method
    if ([self.delegate respondsToSelector:@selector(didSelectRowWithJobLongTitle:)]) {
        [self.delegate didSelectRowWithJobLongTitle:jobViewModel.jobLongTitle];
    }
}

@end
