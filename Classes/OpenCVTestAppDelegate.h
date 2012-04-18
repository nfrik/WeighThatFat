#import <UIKit/UIKit.h>

@class HomeController;

@interface OpenCVTestAppDelegate : NSObject <UIApplicationDelegate> {
    IBOutlet UIWindow *window;
    IBOutlet HomeController *viewController;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) HomeController *viewController;
@property (nonatomic, retain) UINavigationController *navigationController;
@end