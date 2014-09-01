// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to LHLDepartment.m instead.

#import "_LHLDepartment.h"

const struct LHLDepartmentAttributes LHLDepartmentAttributes = {
	.name = @"name",
};

const struct LHLDepartmentRelationships LHLDepartmentRelationships = {
	.employees = @"employees",
};

const struct LHLDepartmentFetchedProperties LHLDepartmentFetchedProperties = {
};

@implementation LHLDepartmentID
@end

@implementation _LHLDepartment

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Department" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Department";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Department" inManagedObjectContext:moc_];
}

- (LHLDepartmentID*)objectID {
	return (LHLDepartmentID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic name;






@dynamic employees;

	
- (NSMutableSet*)employeesSet {
	[self willAccessValueForKey:@"employees"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"employees"];
  
	[self didAccessValueForKey:@"employees"];
	return result;
}
	






@end
