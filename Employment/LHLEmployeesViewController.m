//
//  LHLEmployeesViewController.m
//  Employment
//
//  Created by Hirad Motamed on 2014-08-11.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LHLEmployeesViewController.h"
#import "LHLAddEmployeeViewController.h"

@interface LHLEmployeesViewController () <LHLAddEmployeeDelegate>

@property (nonatomic, strong) NSArray* topPerformers;
@property (nonatomic, strong) NSArray* averageJoes;

@end

@implementation LHLEmployeesViewController

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
}

-(void)fetchTopPerformers
{
    // TODO: fetch data here
    [self.tableView reloadData];
}

-(void)fetchAverageJoes
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Add Employee Delegate

-(void)addEmployeeController:(LHLAddEmployeeViewController *)controller
             didHireEmployee:(id)employee
{
    
}

-(void)addEmployeeControllerDidCancel:(LHLAddEmployeeViewController *)controller
{
    [controller dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    // We're gonna have 2 sections for employees: one for top performers, and one for everyone else
    return 2;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return section == 0 ? @"Top Performers" : @"Average Joes";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (section == 0) {
        return self.topPerformers == nil ? 0 : [self.topPerformers count];
    }
    else
    {
        if (self.averageJoes == nil) {
            return 0;
        }
        else
        {
            return [self.averageJoes count];
        }
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"modal_new_employee"]) {
        LHLAddEmployeeViewController* addController = [segue destinationViewController];
        addController.delegate = self;
        // TODO: Set the new employee's department.
    }
}

@end
