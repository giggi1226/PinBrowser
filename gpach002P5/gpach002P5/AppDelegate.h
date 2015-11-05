/*
 PRGRAMMER: Giselle Pacheco
 PANTHERID: 2348330
 CLASS: COP 4655 U01 TR 5:00
 INSTRUCTOR Steven Luis ECS 282
 ANSSIGNMENT: #5 PIN BROWSER
 DUE: Thursday 10/27/15
 */


#import <UIKit/UIKit.h>


@class PinDatabase, PinViewController, EditViewController, WebViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    PinDatabase *thePinData;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) PinDatabase *pd;


@end

