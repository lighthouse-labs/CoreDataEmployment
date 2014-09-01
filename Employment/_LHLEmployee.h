// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to LHLEmployee.h instead.

#import <CoreData/CoreData.h>


extern const struct LHLEmployeeAttributes {
	__unsafe_unretained NSString *employeeID;
	__unsafe_unretained NSString *firstName;
	__unsafe_unretained NSString *isTopPerformer;
	__unsafe_unretained NSString *lastName;
	__unsafe_unretained NSString *salary;
} LHLEmployeeAttributes;

extern const struct LHLEmployeeRelationships {
	__unsafe_unretained NSString *department;
} LHLEmployeeRelationships;

extern const struct LHLEmployeeFetchedProperties {
} LHLEmployeeFetchedProperties;

@class LHLDepartment;







@interface LHLEmployeeID : NSManagedObjectID {}
@end

@interface _LHLEmployee : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (LHLEmployeeID*)objectID;





@property (nonatomic, strong) NSNumber* employeeID;



@property int32_t employeeIDValue;
- (int32_t)employeeIDValue;
- (void)setEmployeeIDValue:(int32_t)value_;

//- (BOOL)validateEmployeeID:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* firstName;



//- (BOOL)validateFirstName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* isTopPerformer;



@property BOOL isTopPerformerValue;
- (BOOL)isTopPerformerValue;
- (void)setIsTopPerformerValue:(BOOL)value_;

//- (BOOL)validateIsTopPerformer:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* lastName;



//- (BOOL)validateLastName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* salary;



@property float salaryValue;
- (float)salaryValue;
- (void)setSalaryValue:(float)value_;

//- (BOOL)validateSalary:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) LHLDepartment *department;

//- (BOOL)validateDepartment:(id*)value_ error:(NSError**)error_;





@end

@interface _LHLEmployee (CoreDataGeneratedAccessors)

@end

@interface _LHLEmployee (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveEmployeeID;
- (void)setPrimitiveEmployeeID:(NSNumber*)value;

- (int32_t)primitiveEmployeeIDValue;
- (void)setPrimitiveEmployeeIDValue:(int32_t)value_;




- (NSString*)primitiveFirstName;
- (void)setPrimitiveFirstName:(NSString*)value;




- (NSNumber*)primitiveIsTopPerformer;
- (void)setPrimitiveIsTopPerformer:(NSNumber*)value;

- (BOOL)primitiveIsTopPerformerValue;
- (void)setPrimitiveIsTopPerformerValue:(BOOL)value_;




- (NSString*)primitiveLastName;
- (void)setPrimitiveLastName:(NSString*)value;




- (NSNumber*)primitiveSalary;
- (void)setPrimitiveSalary:(NSNumber*)value;

- (float)primitiveSalaryValue;
- (void)setPrimitiveSalaryValue:(float)value_;





- (LHLDepartment*)primitiveDepartment;
- (void)setPrimitiveDepartment:(LHLDepartment*)value;


@end
