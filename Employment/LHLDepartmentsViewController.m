//
//  LHLDepartmentsViewController.m
//  Employment
//
//  Created by Hirad Motamed on 2014-08-11.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LHLDepartmentsViewController.h"
#import "LHLEmployeesViewController.h"
#import <CoreData/CoreData.h>

@interface LHLDepartmentsViewController () <UIAlertViewDelegate>
@property (nonatomic, strong) NSArray* departments;
@end

@implementation LHLDepartmentsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self fetchDepartments];
}

-(void)saveContext
{
    [self.moc performBlock:^{
        NSError* error = nil;
        if (![self.moc save:&error]) {
            NSLog(@"Error saving managed object context: %@; %@",
                  [error localizedDescription], [error userInfo]);
        }
    }];
}

-(void)fetchDepartments
{
    // TODO: Implement
}

-(IBAction)addDepartment:(id)sender
{
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Department name"
                                                        message:nil
                                                       delegate:self
                                              cancelButtonTitle:@"Cancel"
                                              otherButtonTitles:@"OK", nil];
    alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alertView show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - alert view delegate

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString* buttonTitle = [alertView buttonTitleAtIndex:buttonIndex];
    if ([buttonTitle isEqualToString:@"OK"]) {
        // TODO: Add a new department here
        [self saveContext];
        [self fetchDepartments];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.departments count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    // TODO: Configure the cell with the department
    
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"push_employees"]) {
        UITableViewCell* selectedCell = (UITableViewCell*)sender;
        NSIndexPath* indexPath = [self.tableView indexPathForCell:selectedCell];
        // TODO: Pass in the selected department.
    }
}

@end
