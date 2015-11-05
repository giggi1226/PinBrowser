/*
 PRGRAMMER: Giselle Pacheco
 PANTHERID: 2348330
 CLASS: COP 4655 U01 TR 5:00
 INSTRUCTOR Steven Luis ECS 282
 ANSSIGNMENT: #5 PIN BROWSER
 DUE: Thursday 10/27/15
 */




#import "PinViewController.h"
#import "PinDatabase.h"

@implementation PinViewController

int count;

@synthesize pinNum1, pinNum2, pinNum3, pinNum4, pinString;


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    data = [PinDatabase thePinDatabase];

    
}
-(void) viewWillAppear:(BOOL)animated
{
    pinString = [[NSMutableString alloc] init];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
    
}

-(IBAction)clickDigit:(id)sender
{
    
    NSInteger tag = [sender tag];

    NSString * num = [NSString stringWithFormat: @"%li",tag];
    
    if(count == 0)
    {
        pinNum1.text = num;
        [pinString appendString:num];
        count++;
    }
    
    else if(count == 1)
    {
        pinNum2.text = num;
        [pinString appendString:num];
        count++;
    }
    
    else if(count == 2)
    {
        pinNum3.text = num;
        [pinString appendString:num];
        count++;
    }
    else if(count == 3)
    {
        pinNum4.text = num;
        [pinString appendString:num];
        
        NSLog(@"%@", pinString);
        //check if pin exists
        if(![data doesPinExist:pinString])
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"WRONG PIN" message:@"pin does not exist" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
            [alert show];
            
            //reset count to 0
            count = 0;
            
            //reset label text to empty
            pinNum1.text = @"";
            pinNum2.text = @"";
            pinNum3.text = @"";
            pinNum4.text = @"";
            
            [pinString setString:@""];
        }
        else
        {
            //            data.activePin = pinString;
                        [data setActivePIN:pinString];
            self.tabBarController.selectedIndex = 1;
        }
            
        //reset count to 0
        count = 0;

        //reset label text to empty
        pinNum1.text = @"";
        pinNum2.text = @"";
        pinNum3.text = @"";
        pinNum4.text = @"";

    }
    
}



@end
