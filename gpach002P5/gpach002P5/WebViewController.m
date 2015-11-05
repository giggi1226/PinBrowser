/*
 PRGRAMMER: Giselle Pacheco
 PANTHERID: 2348330
 CLASS: COP 4655 U01 TR 5:00
 INSTRUCTOR Steven Luis ECS 282
 ANSSIGNMENT: #5 PIN BROWSER
 DUE: Thursday 10/27/15
 */


#import "WebViewController.h"
#import "PinDatabase.h"


@implementation WebViewController

@synthesize web,pin,website, incomingPin;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    data = [PinDatabase thePinDatabase];
    
    [self loadWeb];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
        self.title = NSLocalizedString(@"Browser", @"Browser");

        
    }
    return self;
}


-(void)viewWillAppear:(BOOL)animated
{

     [self loadWeb];
    
}

-(void)loadWeb
{
    NSString *defaultSite = data.getWebsite;
    
    NSLog(@"website %@",defaultSite);
    
    // Create a NSURL and convert the website from string to URL format.
    NSURL *url = [NSURL URLWithString:defaultSite];
    
    pin.text = data.getActivePIN;
    website.text = data.getWebsite;
    
    // Create a URL Request using the url we just created.
    NSURLRequest *requestUrl = [NSURLRequest requestWithURL:url];
    
    // Call the webView and load the request.
    [self.web loadRequest:requestUrl];
}

@end
