//
//  DetailViewController.m
//  ExampleProject
//
//  Created by EricYang on 7/06/2016.
//  Copyright © 2016 Eric. All rights reserved.
//

#import "DetailViewController.h"

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //init navigation bar color
    self.navigationController.navigationBar.barTintColor = jobUnStartedNavigationColor;
    
    //init ViewModel
    detailViewModel = [DetailViewModel sharedSingleton];
    
    //Binding ViewModel with UI
    [self bindingViewModelWithUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark: Private

//Binding ViewModel with UI
-(void) bindingViewModelWithUI{
    
    //Binding detail textview
    RAC(self.detailTextView,text) = RACObserve(detailViewModel, detailInformation);
    
    //set text color after get value
    self.detailTextView.textColor = [UIColor whiteColor];
    self.detailTextView.textAlignment = NSTextAlignmentCenter;
}



@end
