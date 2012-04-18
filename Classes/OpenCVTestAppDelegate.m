#import "OpenCVTestAppDelegate.h"
#import "HomeController.h"

@implementation OpenCVTestAppDelegate
@synthesize window;
@synthesize viewController;
@synthesize navigationController;

- (void)applicationDidFinishLaunching:(UIApplication *)application {
    
    self.viewController = [[[HomeController alloc] initWithNibName:@"HomeController" bundle:nil] autorelease];
    self.navigationController = [[[UINavigationController alloc] initWithRootViewController:viewController] autorelease];
    
    navigationController.navigationBarHidden = YES;
	
	[window addSubview:navigationController.view];
    [window makeKeyAndVisible];
}

- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}
@end