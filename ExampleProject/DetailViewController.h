//
//  DetailViewController.h
//  ExampleProject
//
//  Created by EricYang on 7/06/2016.
//  Copyright © 2016 Eric. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "DetailViewModel.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "CommonUtils.h"
#import "DetailViewModel.h"

@interface DetailViewController : UIViewController{
    DetailViewModel *detailViewModel;
}

@property (weak, nonatomic) IBOutlet UITextView *detailTextView;

@end
