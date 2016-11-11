//
//  ViewController.m
//  ObjectivePortfolio
//
//  Created by Tradable ApS on 17/11/15.
//  Copyright © 2015 Tradable ApS. All rights reserved.
//

#import "ViewController.h"
@import TradableAPI;


@interface ViewController ()

@end

@implementation ViewController

@synthesize accountLabel;
@synthesize activateButton;

- (void)viewDidLoad {
    [super viewDidLoad];

    // Assign the Tradable auth delegate to self
    [[Tradable sharedInstance] setAuthDelegate:self];

    // Assign the Tradable events delegate to self
    [[Tradable sharedInstance] setEventsDelegate:self];

    // Do any additional setup after loading the view, typically from a nib.
}

// Authentication delegate method callback; TradableAPI is ready to be used for certain account
- (void)tradableReadyFor:(TradableAccount *)account {
    NSLog(@"Tradable is READY for account: %@", account);
    
    [activateButton setHidden:YES];

    [accountLabel setText:[NSString stringWithFormat:@"You are now using %@.", account.displayName]];
    [accountLabel setHidden:NO];

    // Start account metrics updates for this account with 2s frequency
    [account startUpdatesOfType:TradableUpdatesTypeMetrics withFrequency:TradableUpdatesFrequencyTwoSeconds with:[[TradableUpdatesRequest alloc] initWithInstrumentIds:[[NSArray alloc] init] includeOpenPositions:TRUE includeMarginFactors:FALSE]];
}

// Authentication delegate method callback; an error occured during authentication
- (void)tradableAuthenticationErrorWithError:(TradableError *)error {
    NSString *message = error.errorDetails ? error.errorDetails : error.errorDescription;
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:ok];
    [self presentViewController:alertController animated:YES completion:nil];
}

// Events delegate method callback for account metrics
-(void)tradableAccountMetricsUpdatedWithAccountMetrics:(TradableAccountMetrics *)accountMetrics {
    NSLog(@"%@", accountMetrics);
}

- (IBAction)activateTradableTouched:(UIButton *)sender {
    // Begins authentication flow with clientID 100007 and custom URI in system browser; will store token in keychain and use it on the next run, if possible.
    [[Tradable sharedInstance] activateOrAuthenticateWithAppId:100007 uri:@"com.tradable.example2://oauth2callback" in:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
