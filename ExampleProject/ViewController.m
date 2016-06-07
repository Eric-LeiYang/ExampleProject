//
//  ViewController.m
//  ExampleProject
//
//  Created by EricYang on 7/06/2016.
//  Copyright © 2016 Eric. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    //ViewModel
    JTBDViewModel *viewModel;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //init navigation bar color
    NSDictionary *textAttributes = @{ NSForegroundColorAttributeName: [UIColor whiteColor],
                                      NSFontAttributeName: [UIFont fontWithName: @"Baskerville" size: 18] };
    
    self.navigationController.navigationBar.titleTextAttributes = textAttributes;
    
    //init ViewModel
    viewModel = [[JTBDViewModel alloc] init];
    
    //Binding ViewModel with UI
    [self bindingViewModelWithUI];
    
    // contentOffset
    CGRect headerFrame = CGRectMake(0, 0, self.nameLabel.frame.size.width,
                                    20+(self.descriptionTextView.bounds.origin.y+self.descriptionTextView.bounds.size.height));
    self.jobListTableView.tableHeaderView = [[UIView alloc] initWithFrame:headerFrame];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark: Private

//Binding ViewModel with UI
-(void) bindingViewModelWithUI{
    //Binding navigation title
    RAC(self.navigationItem,title) = RACObserve(viewModel, titleOnNavigation);
    
    //Binding navigation color
    RAC(self.navigationController.navigationBar, barTintColor) = RACObserve(viewModel, colorOnNavigation);
    
    //Binding Job No. 1 label
    RAC(self.nameLabel,text) = RACObserve(viewModel, JobNoOne);
    
    //Binding descrition textview
    RAC(self.descriptionTextView,text) = RACObserve(viewModel, JTBDdescription);
    
    //Binding button title
    [self.jobDoneButton rac_liftSelector:@selector(setTitle:forState:)
                             withSignals:RACObserve(viewModel, titleOnButton),
     [RACSignal return:@(UIControlStateNormal)], nil];
    
    //set text color after get value
    self.descriptionTextView.textColor = [UIColor whiteColor];
    self.descriptionTextView.textAlignment = NSTextAlignmentCenter;
    
    //Binding button tap action
    self.jobDoneButton.rac_command = viewModel.JobButtonCommand;
    
    //Binding tableview
    // bind the view models 'jobViewModels' property to a table view
    TableViewModelBindingHelper *helper = [[TableViewModelBindingHelper alloc] initWithTableView:self.jobListTableView
                                                                                    sourceSignal:RACObserve(viewModel, jobViewModels)];
    helper.delegate = self;
}

- (void) didSelectRowWithJobLongTitle:(NSString *)jobLongTitle{
    [DetailViewModel sharedSingleton].detailInformation = jobLongTitle;
    [self performSegueWithIdentifier:@"showDetails" sender:self.view];
}
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    [segue destinationViewController];
    
}

@end
