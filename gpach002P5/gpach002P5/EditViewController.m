/*
 PRGRAMMER: Giselle Pacheco
 PANTHERID: 2348330
 CLASS: COP 4655 U01 TR 5:00
 INSTRUCTOR Steven Luis ECS 282
 ANSSIGNMENT: #5 PIN BROWSER
 DUE: Thursday 10/27/15
 */


#import "EditViewController.h"
#import "PinDatabase.h"


@implementation EditViewController

@synthesize pinField, webField, dict2DArr;
@synthesize scrollview;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    dict2DArr = [[NSMutableArray alloc] initWithCapacity:2];
    
    //search in database
    
    thePinData = [PinDatabase thePinDatabase];
    [self loadPinsToView];
    
    [self tapGesture];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) loadPinsToView
{

    NSDictionary * copyOfDict = [thePinData getCopyDictionary];
    NSArray * dictKeys = [[copyOfDict allKeys] sortedArrayUsingSelector:@selector(compare:)];
    
    int iter = 0;
    for(id currKey in dictKeys)
    {
        //current PIN textfield
        UITextField * currPINtextfield = pinField[iter];
        
        //current URL textfield
        UITextField * currURLtextfield = webField[iter];
        
        
        NSString * currURL = [copyOfDict objectForKey:currKey];
        NSString * currPIN = currKey;
        
        currPINtextfield.text = currPIN;
        currURLtextfield.text = currURL;
        
        iter++;
    }
}


-(void) loadTextFields
{
    [dict2DArr insertObject:[NSArray arrayWithArray:[thePinData getDBKeys]] atIndex:0];
    [dict2DArr insertObject:[NSArray arrayWithArray:[thePinData getDBValues]] atIndex:1];
    
    for(int x = 0; x < [[thePinData getDBValues] count]; x++)
    {
        UITextField *pin = [pinField objectAtIndex:x];
        pin.text = [[dict2DArr objectAtIndex:0] objectAtIndex:x];
        
        UITextField *url = [webField objectAtIndex:x];
        url.text = [[dict2DArr objectAtIndex:1] objectAtIndex:x];
    }
}

-(void) tellDatabaseToUpdate
{
    // Create two Arrays. Each one will hold either newPins or newWebsites
    NSMutableArray *newPins = [[NSMutableArray alloc] initWithCapacity:10];
    NSMutableArray *newWebsites = [[NSMutableArray alloc] initWithCapacity:10];
    
    // For every pin inside the pin textFields, put them in the newPins array.
    for(UITextField *pin in pinField)
    {
        [newPins addObject:pin.text];
    }
    
    // For every website inside the website textFields, put them in the newWebsite array
    for(UITextField *site in webField)
    {
        [newWebsites addObject:site.text];
    }
    
    // Now that I have stored the data in the text fields in two NSMutableArrays
    // I call the method in the model to update the database. It expects two NSMutablArrays.
    
    [thePinData updateThePinDatabase:newPins :newWebsites];
    
}




- (IBAction)PINValueChanged:(UITextField *)sender
{
    int PINTouched = (int)sender.tag;
    
    NSString * PINValue = sender.text;
    
    UITextField * urlTextfield =webField[PINTouched];
    NSString * URLValue = urlTextfield.text;
    
    NSLog(@"[pin] PIN# %@  URL# %@",PINValue,URLValue);
    int results = [thePinData updateDataWithPIN:PINValue withURL:URLValue];
    if(results == -1)
    {
        //NSLog(@"invalid pin length");
        [self showAlertMessage:@"Pin" :@"invalid pin length"];
    }
    else if(results == -2)
    {
        //NSLog(@"url empty");
        [self showAlertMessage:@"url" :@"url empty"];
    }
}

- (IBAction)URLValueChanged:(UITextField *)sender
{
    int URLTouched = (int)sender.tag;
    
    UITextField * pinTextfield = pinField[URLTouched];
    NSString * PINValue = pinTextfield.text;
    NSString * URLValue = sender.text;
    
    //NSLog(@"[url] PIN# %@  URL# %@",PINValue,URLValue);
    
   int results =  [thePinData updateDataWithURL:PINValue withURL:URLValue];
    if(results == -1)
    {
        //NSLog(@"invalid pin length");
        [self showAlertMessage:@"Pin" :@"invalid pin length"];
    }
    else if(results == -2)
    {
        //NSLog(@"url empty");
        [self showAlertMessage:@"url" :@"url empty"];
    }
    
    
}

-(void)showAlertMessage:(NSString *)title :(NSString *)message
{
    UIAlertView * alertMessage = [[UIAlertView alloc]initWithTitle:title
                                                    message:message
                                                   delegate:self
                                          cancelButtonTitle:@"Okay"
                                          otherButtonTitles: nil];
    
    [alertMessage show];
}


-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [self scrollviewStartTextfield:textField];
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self resetScrollview];
    
    return YES;
}


-(void) scrollviewStartTextfield:(UITextField *)textfield
{
    CGPoint point = CGPointMake(0, textfield.frame.origin.y - 1.5 * textfield.frame.size.height);
    [scrollview setContentOffset:point animated:YES];
}

-(void) resetScrollview
{
    CGPoint point = CGPointMake(0, 0);
    [scrollview setContentOffset:point animated:YES];
}


-(void)tapGesture
{
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyboard:)];
    [self.view addGestureRecognizer:tapGesture];

}

-(void)dismissKeyboard:(UITapGestureRecognizer *) tapRegconize
{
    [self resetScrollview];
    [self.view endEditing:YES];
}


@end