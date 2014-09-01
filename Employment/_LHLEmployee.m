// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to LHLEmployee.m instead.

#import "_LHLEmployee.h"

const struct LHLEmployeeAttributes LHLEmployeeAttributes = {
	.employeeID = @"employeeID",
	.firstName = @"firstName",
	.isTopPerformer = @"isTopPerformer",
	.lastName = @"lastName",
	.salary = @"salary",
};

const struct LHLEmployeeRelationships LHLEmployeeRelationships = {
	.department = @"department",
};

const struct LHLEmployeeFetchedProperties LHLEmployeeFetchedProperties = {
};

@implementation LHLEmployeeID
@end

@implementation _LHLEmployee

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Employee" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Employee";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Employee" inManagedObjectContext:moc_];
}

- (LHLEmployeeID*)objectID {
	return (LHLEmployeeID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"employeeIDValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"employeeID"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"isTopPerformerValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"isTopPerformer"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"salaryValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"salary"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic employeeID;



- (int32_t)employeeIDValue {
	NSNumber *result = [self employeeID];
	return [result intValue];
}

- (void)setEmployeeIDValue:(int32_t)value_ {
	[self setEmployeeID:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveEmployeeIDValue {
	NSNumber *result = [self primitiveEmployeeID];
	return [result intValue];
}

- (void)setPrimitiveEmployeeIDValue:(int32_t)value_ {
	[self setPrimitiveEmployeeID:[NSNumber numberWithInt:value_]];
}





@dynamic firstName;






@dynamic isTopPerformer;



- (BOOL)isTopPerformerValue {
	NSNumber *result = [self isTopPerformer];
	return [result boolValue];
}

- (void)setIsTopPerformerValue:(BOOL)value_ {
	[self setIsTopPerformer:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveIsTopPerformerValue {
	NSNumber *result = [self primitiveIsTopPerformer];
	return [result boolValue];
}

- (void)setPrimitiveIsTopPerformerValue:(BOOL)value_ {
	[self setPrimitiveIsTopPerformer:[NSNumber numberWithBool:value_]];
}





@dynamic lastName;






@dynamic salary;



- (float)salaryValue {
	NSNumber *result = [self salary];
	return [result floatValue];
}

- (void)setSalaryValue:(float)value_ {
	[self setSalary:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveSalaryValue {
	NSNumber *result = [self primitiveSalary];
	return [result floatValue];
}

- (void)setPrimitiveSalaryValue:(float)value_ {
	[self setPrimitiveSalary:[NSNumber numberWithFloat:value_]];
}





@dynamic department;

	






@end
