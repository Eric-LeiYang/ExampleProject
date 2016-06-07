//
//  ViewController.h
//  ExampleProject
//
//  Created by EricYang on 7/06/2016.
//  Copyright © 2016 Eric. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JTBDViewModel.h"
#import "CommonUtils.h"
#import "TableViewModelBindingHelper.h"
#import "DetailViewController.h"
#import "DetailViewModel.h"

@interface ViewController : UIViewController <TableViewModelBindingHelperDelegate>

//UI properties
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UITableView *jobListTableView;
@property (weak, nonatomic) IBOutlet UIButton *jobDoneButton;


@end

