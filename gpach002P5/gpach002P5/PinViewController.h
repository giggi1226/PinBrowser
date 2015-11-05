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


@interface PinViewController : UIViewController
{
    PinDatabase *data;
}


@property (strong, nonatomic) NSMutableString *pinString;
@property (weak, nonatomic) IBOutlet UILabel *pinNum1;

@property (weak, nonatomic) IBOutlet UILabel *pinNum2;

@property (weak, nonatomic) IBOutlet UILabel *pinNum3;

@property (weak, nonatomic) IBOutlet UILabel *pinNum4;



-(IBAction)clickDigit:(id)sender;
@end

