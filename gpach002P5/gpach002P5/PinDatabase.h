/*
 PRGRAMMER: Giselle Pacheco
 PANTHERID: 2348330
 CLASS: COP 4655 U01 TR 5:00
 INSTRUCTOR Steven Luis ECS 282
 ANSSIGNMENT: #5 PIN BROWSER
 DUE: Thursday 10/27/15
 */

#import "Foundation/Foundation.h"

@interface PinDatabase : NSObject
{
    NSMutableDictionary* dictionary;
    NSString *activePin;
    NSString *activeWebsite;
}

+(PinDatabase *) thePinDatabase;

-(id)init;

-(BOOL)validatePin:(NSString *) obtainedPin;

-(void)updateThePinDatabase:(NSMutableArray *)obtainedPins :(NSMutableArray *)obtainedSites;
-(NSArray *) getDBKeys;
-(NSArray *) getDBValues;
-(BOOL) doesPinExist: (NSString *) pin;
-(NSString *)getWebsite;

-(void)setActivePIN:(NSString *)pinProvided;
-(NSString *)getActivePIN;

-(NSMutableDictionary *)getCopyDictionary;

-(int)updateDataWithPIN:(NSString *)pinProvided withURL:(NSString *)urlProvided;
-(int)updateDataWithURL:(NSString *)pinProvided withURL:(NSString *)urlProvided;


@end
