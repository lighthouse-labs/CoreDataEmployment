//
//  LHLAddEmployeeViewController.h
//  Employment
//
//  Created by Hirad Motamed on 2014-08-11.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LHLAddEmployeeViewController;

@protocol LHLAddEmployeeDelegate <NSObject>

// TODO: Change class of 'employee' to model's class
-(void)addEmployeeController:(LHLAddEmployeeViewController*)controller didHireEmployee:(id)employee;
-(void)addEmployeeControllerDidCancel:(LHLAddEmployeeViewController *)controller;

@end



@interface LHLAddEmployeeViewController : UIViewController

@property (nonatomic, weak) id<LHLAddEmployeeDelegate> delegate;
@property (nonatomic, strong) NSManagedObjectContext* moc;
// TODO: Add a department to add the new employee to

@end
