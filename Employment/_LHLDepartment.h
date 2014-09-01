// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to LHLDepartment.h instead.

#import <CoreData/CoreData.h>


extern const struct LHLDepartmentAttributes {
	__unsafe_unretained NSString *name;
} LHLDepartmentAttributes;

extern const struct LHLDepartmentRelationships {
	__unsafe_unretained NSString *employees;
} LHLDepartmentRelationships;

extern const struct LHLDepartmentFetchedProperties {
} LHLDepartmentFetchedProperties;

@class LHLEmployee;



@interface LHLDepartmentID : NSManagedObjectID {}
@end

@interface _LHLDepartment : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (LHLDepartmentID*)objectID;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *employees;

- (NSMutableSet*)employeesSet;





@end

@interface _LHLDepartment (CoreDataGeneratedAccessors)

- (void)addEmployees:(NSSet*)value_;
- (void)removeEmployees:(NSSet*)value_;
- (void)addEmployeesObject:(LHLEmployee*)value_;
- (void)removeEmployeesObject:(LHLEmployee*)value_;

@end

@interface _LHLDepartment (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;





- (NSMutableSet*)primitiveEmployees;
- (void)setPrimitiveEmployees:(NSMutableSet*)value;


@end
