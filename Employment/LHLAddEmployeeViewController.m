//
//  LHLAddEmployeeViewController.m
//  Employment
//
//  Created by Hirad Motamed on 2014-08-11.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LHLAddEmployeeViewController.h"
#import "LHLEmployee.h"

@interface LHLAddEmployeeViewController ()

@property (nonatomic, weak) IBOutlet UITextField* firstNameField;
@property (nonatomic, weak) IBOutlet UITextField* lastNameField;
@property (nonatomic, weak) IBOutlet UITextField* salaryField;

@end

@implementation LHLAddEmployeeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction)hire:(id)sender
{
    LHLEmployee* employee = [LHLEmployee insertInManagedObjectContext:self.moc];
    employee.firstName = self.firstNameField.text;
    employee.lastName = self.lastNameField.text;
    employee.salaryValue = [self.salaryField.text floatValue];
    
    [self.delegate addEmployeeController:self didHireEmployee:employee];
}

-(IBAction)cancel:(id)sender
{
    [self.delegate addEmployeeControllerDidCancel:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
