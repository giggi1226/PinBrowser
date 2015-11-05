/*
 PRGRAMMER: Giselle Pacheco
 PANTHERID: 2348330
 CLASS: COP 4655 U01 TR 5:00
 INSTRUCTOR Steven Luis ECS 282
 ANSSIGNMENT: #5 PIN BROWSER
 DUE: Thursday 10/27/15
 */


#import <UIKit/UIKit.h>
@class PinDatabase;

@interface WebViewController : UIViewController
{
    PinDatabase *data;
}
@property (weak, nonatomic) NSString *incomingPin;
@property (weak, nonatomic) IBOutlet UILabel *pin;
@property (weak, nonatomic) IBOutlet UILabel *website;
@property (strong, nonatomic) IBOutlet UIWebView *web;
@end

