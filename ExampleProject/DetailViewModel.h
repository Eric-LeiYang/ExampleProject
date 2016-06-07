//
//  DetailViewModel.h
//  ExampleProject
//
//  Created by EricYang on 7/06/2016.
//  Copyright © 2016 Eric. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DetailViewModel : NSObject

//detail information
@property NSString *detailInformation;

//TODO:
+(DetailViewModel *) sharedSingleton;


@end
