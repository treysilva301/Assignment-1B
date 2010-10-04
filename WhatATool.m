#import <Foundation/Foundation.h>


void PrintPathInfo();			// Section 1
void PrintProcessInfo();		// Section 2
void PrintBookmarkInfo();		// Section 3
void PrintIntrospectionInfo();	// Section 4


int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

	PrintPathInfo();			// Section 1
	PrintProcessInfo();		// Section 2
	PrintBookmarkInfo();		// Section 3
	PrintIntrospectionInfo();	// Section 4
	
	[pool release];
    return 0;
}

void PrintPathInfo(){
	NSString *path = @"~";
	path = [path stringByExpandingTildeInPath];
	
	NSLog(@"My home folder is at '%@'.", path );
	
	NSArray *cons = [path pathComponents];
	
	for(NSString *element in cons)
		NSLog(@"'%@'", element);
	
	
}

void PrintProcessInfo(){
	NSProcessInfo *process = [NSProcessInfo processInfo];
	NSString *name = [process processName];
	int numId = [process processIdentifier];
	
	NSLog(@"====================");
	NSLog(@"Process Name: '%@' Process ID: '%d'", name, numId);
}



void PrintBookmarkInfo(){
	NSMutableDictionary *siteList = [NSMutableDictionary dictionary];
	
	[siteList setObject:@"http://www.stanford.edu" forKey:@"Stanford University" ];
	[siteList setObject:@"http://www.apple.com" forKey:@"Apple" ];
	[siteList setObject:@"http://cs193p.stanford.edu" forKey:@"CS193P" ];
	[siteList setObject:@"http://itunes.stanford.edu" forKey:@"Stanford on iTunes U" ];
	[siteList setObject:@"http://stanfordshop.com" forKey:@"Stanford Mall" ];
	
	NSLog(@"====================");
	
	for(NSString *element in siteList){
		
		NSURL *value = [siteList objectForKey:element];
		if ([element hasPrefix: @"Stanford"]) {
			NSLog(@"KEY: '%@' URL: '%@' ", element, value);
		}
	}
}
void PrintIntrospectionInfo(){
	NSMutableArray *arr = [NSMutableArray array];
	BOOL isLower;
	
	//create objects to be added to array
	NSString *sample_string = @"this is a Sample string";
	NSURL *sample_url = @"http://apple.com";
	NSProcessInfo *sample_process = [NSProcessInfo processInfo];
	NSDictionary  *sample_dictionary = [NSMutableDictionary dictionary];
	NSMutableString *sample_mutStr = @"this is a Sample mutable string";
	
	//add objects to arr
	[arr addObject:sample_string];
	[arr addObject:sample_url];
	[arr addObject:sample_process];
	[arr addObject:sample_dictionary];
	[arr addObject:sample_mutStr];
	
	for(NSObject *element in arr){
		isLower = [element respondsToSelector:@selector (lowercaseString)];
		
		NSLog(@"====================");
		NSLog(@"Class Name: %@", [element class] );
		NSLog(@"Is member of NSString: %@", ([element isMemberOfClass:[NSString class]] ? @"YES" : @"NO" ));
		NSLog(@"Is kind of NSString: %@", ([element isKindOfClass:[NSString class]] ? @"YES" : @"NO"));
		NSLog(@"Resonds to lowercaseString: %@", (isLower ? @"YES" : @"NO"));
		if (isLower) {
			NSLog(@"lowercaseString is: %@", [element lowercaseString]);
		}

		
	}

}