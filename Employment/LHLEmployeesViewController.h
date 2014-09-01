//
//  LHLEmployeesViewController.h
//  Employment
//
//  Created by Hirad Motamed on 2014-08-11.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LHLDepartment;

@interface LHLEmployeesViewController : UITableViewController

@property (nonatomic, strong) NSManagedObjectContext* moc;
@property (nonatomic, strong) LHLDepartment* department;

@end
