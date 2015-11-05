/*
 PRGRAMMER: Giselle Pacheco
 PANTHERID: 2348330
 CLASS: COP 4655 U01 TR 5:00
 INSTRUCTOR Steven Luis ECS 282
 ANSSIGNMENT: #5 PIN BROWSER
 DUE: Thursday 10/27/15
 */


#import "PinDatabase.h"

@implementation PinDatabase

-(id) init
{
    self = [super init];
    
    if(self)
    {
        dictionary = [[NSMutableDictionary alloc] init];
        [dictionary setObject:@"http://www.google.com" forKey:@"0000"];
        [dictionary setObject:@"http://www.fiu.edu" forKey:@"0001"];
        [dictionary setObject:@"http://www.stackoverflow.com" forKey:@"0010"];
    }
    return self;
}

-(BOOL)validatePin:(NSString *)obtainedPin
{

            activePin = obtainedPin;
            activeWebsite = [dictionary objectForKey:obtainedPin];
    
    NSLog(@"pin updated to %@ %@", activePin,activeWebsite );
            return TRUE;
    
    
    return FALSE;
}

-(NSMutableDictionary *)getCopyDictionary
{
    NSMutableDictionary * copy = [dictionary mutableCopy];
    
    return copy;
}

-(NSString *)getActivePIN
{
    return activePin;
}

-(void)setActivePIN:(NSString *)pinProvided
{
    activePin = pinProvided;
}


-(NSString *)getWebsite
{
    return [dictionary objectForKey:activePin];
}


-(void)updateThePinDatabase:(NSMutableArray *)obtainedPins :(NSMutableArray *)obtainedSites
{
    // Create a Dictionary to store these new pins and websites.
    NSMutableDictionary *newPinsAndWebsites = [[NSMutableDictionary alloc] initWithCapacity:10];
    
    
    // Sort through the 10 pins and websites in both of the arrays and add their matching pairs
    // to the dictionary. Since there can be no more than 10 pairs, I hard coded the index limit.
    for(int index = 0; index < 10; index++)
    {
        [newPinsAndWebsites setValue:
         [obtainedSites objectAtIndex:index]forKey:[obtainedPins objectAtIndex:index]];
    }
    
    // Since the data I received is temporary, I need to update the database or dictionary holding
    // my sets of pins and websites. So I assign the updated values of the new dictionary to the
    // globalPinData. Thus, updating the database.
    
    dictionary = newPinsAndWebsites;
    
}

+ (PinDatabase *)thePinDatabase
{
    // Creates a static instance of itself named pinDatabase. Sets it to nil (non existent)
    static PinDatabase *pinDatabase = nil;
    
    // It synchronizes itself.
    @synchronized(self)
    {
        // if there is no instance of the pinDatabase
        if(!pinDatabase)
        {
            // Then alloc and init the pinDatabase instance
            pinDatabase = [[PinDatabase alloc] init];
        }
    }
    
    return pinDatabase;
}

-(NSArray *) getDBKeys
{
    return [dictionary allKeys];
}
-(NSArray *) getDBValues
{
    return [dictionary allValues];
}

-(BOOL) doesPinExist:(NSString *)pin
{
    BOOL result = NO;
    NSArray *arr = [dictionary allKeys];
    
    for(NSString *pinInD in arr)
    {
        NSLog(@"pinInD %@ ", pinInD);
        if([pinInD caseInsensitiveCompare:pin] == NSOrderedSame)
        {
            result = YES;
            break;
        }
    }
    return result;
}

/*
 
 returns
    1
    -1  invalid pin length
    -2  url empty
 */
-(int)updateDataWithPIN:(NSString *)pinProvided withURL:(NSString *)urlProvided
{
    
    if(pinProvided.length != 4)
    {
        return -1;
    }
    
    if(urlProvided.length > 0)
    {
        //adding new element
        [dictionary setObject:urlProvided forKey:pinProvided];
        return 1;
    }
    
    
    return -2;
}

/*
 returns
 1
 -1  invalid pin length
 -2  url empty
 */
-(int)updateDataWithURL:(NSString *)pinProvided withURL:(NSString *)urlProvided
{
    
    if(pinProvided.length != 4)
    {
        return -1;
    }
    
    if(urlProvided.length > 0)
    {
        //adding new element
        [dictionary setObject:urlProvided forKey:pinProvided];
        return 1;
    }
    
    
    return -2;
}


@end
