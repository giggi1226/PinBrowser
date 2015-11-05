/*
 PRGRAMMER: Giselle Pacheco
 PANTHERID: 2348330
 CLASS: COP 4655 U01 TR 5:00
 INSTRUCTOR Steven Luis ECS 282
 ANSSIGNMENT: #5 PIN BROWSER
 DUE: Thursday 10/27/15
 */


#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface EditViewController : UIViewController <UITextFieldDelegate>
{
    PinDatabase *thePinData;
}

@property (strong, nonatomic) NSMutableArray *dict2DArr;

@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *pinField;
@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *webField;

-(void) loadPinsToView;
-(void) tellDatabaseToUpdate;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;


- (IBAction)PINValueChanged:(UITextField *)sender;

- (IBAction)URLValueChanged:(UITextField *)sender;


@end
