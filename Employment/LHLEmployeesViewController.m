//
//  LHLEmployeesViewController.m
//  Employment
//
//  Created by Hirad Motamed on 2014-08-11.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LHLEmployeesViewController.h"
#import "LHLAddEmployeeViewController.h"
#import "LHLDepartment.h"
#import "LHLEmployee.h"

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
    
    [self fetchEmployees];
}

-(void)saveContext {
    NSError* error = nil;
    if (![self.moc save:&error]) {
        NSLog(@"Error saving managed object context in employees view controller: %@; %@",
              [error localizedDescription], [error userInfo]);
    }
}

-(void)fetchEmployees {
    [self fetchTopPerformers];
    [self fetchAverageJoes];
    
    [self.tableView reloadData];
}

-(void)fetchTopPerformers
{
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"%K == %@",
                              LHLEmployeeAttributes.isTopPerformer, @YES];
    self.topPerformers = [self fetchEmployeesWithPredicate:predicate];
}

-(void)fetchAverageJoes
{
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"isTopPerformer == %@", @NO];
    self.averageJoes = [self fetchEmployeesWithPredicate:predicate];
}

-(NSArray*)fetchEmployeesWithPredicate:(NSPredicate*)predicate
{
    NSFetchRequest* fetchRequest = [NSFetchRequest fetchRequestWithEntityName:[LHLEmployee entityName]];
    fetchRequest.predicate = predicate;
    
    NSSortDescriptor* lastNameSorter = [NSSortDescriptor sortDescriptorWithKey:@"lastName"
                                                                     ascending:YES];
    fetchRequest.sortDescriptors = @[lastNameSorter];
    
    NSError* error = nil;
    NSArray* fetchedObjects = [self.moc executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"Error fetching top performing employees in department \"%@\": %@; %@",
              self.department.name, [error localizedDescription], [error userInfo]);
        return nil;
    }
    
    return fetchedObjects;
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
    [controller dismissViewControllerAnimated:YES completion:nil];
    [(LHLEmployee*)employee setDepartment:self.department];
    
    [self saveContext];
    
    [self fetchEmployees];
    [self.tableView reloadData];
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
    LHLEmployee* employee;
    if (indexPath.section == 0) {
        employee = self.topPerformers[indexPath.row];
    }
    else
        employee = self.averageJoes[indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@, %@",
                           employee.lastName, employee.firstName];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"$%.2f", employee.salaryValue];
    
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"modal_new_employee"]) {
        UINavigationController* navController = [segue destinationViewController];
        LHLAddEmployeeViewController* addController = (LHLAddEmployeeViewController*)(navController.topViewController);
        addController.delegate = self;
        addController.moc = self.moc;
    }
}

@end
