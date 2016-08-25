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

    //Assign the Tradable auth delegate to self
    [[Tradable sharedInstance] setAuthDelegate:self];
    
    // Do any additional setup after loading the view, typically from a nib.
}

//Authentication delegate method callback; TradableAPI is ready to be used for certain account
- (void)tradableReady:(TradableAccount *)forAccount {
    NSLog(@"Tradable is READY for account: %@", forAccount);
    
    [activateButton setHidden:YES];

    [accountLabel setText:[NSString stringWithFormat:@"You are now using %@.", forAccount.displayName]];
    [accountLabel setHidden:NO];
}

- (IBAction)activateTradableTouched:(UIButton *)sender {
    //Begins authentication flow with clientID 100007 and custom URI in system browser; will store token in keychain and use it on the next run, if possible.
    [[Tradable sharedInstance] activateOrAuthenticate:100007 uri:@"com.tradable.example2://oauth2callback" webView:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
