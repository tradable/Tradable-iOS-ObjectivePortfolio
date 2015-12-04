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

@synthesize nameLabel;
@synthesize activateButton;

- (void)viewDidLoad {
    [super viewDidLoad];

    //Assign the Tradable delegate to self
    [[Tradable sharedInstance] setDelegate:self];
    
    // Do any additional setup after loading the view, typically from a nib.
}

//Delegate method callback; TradableAPI is ready to be used
- (void)tradableReady {
    NSLog(@"Tradable is READY");
    
    [activateButton setHidden:YES];
    
    //Gets the current OS user
    [[Tradable sharedInstance] getCurrentUser:^(TradableOSUser * osUser, TradableError * trError) {
        [nameLabel setHidden:NO];
        
        if (osUser != nil) {
            [nameLabel setText:[NSString stringWithFormat:@"Hi %@!", osUser.userName]];
        } else {
            [nameLabel setText:[NSString stringWithFormat:@"%@", trError.errorDescription]];
        }
    }];
}

- (IBAction)activateTradableTouched:(UIButton *)sender {
    //Begins authentication flow with clientID 100007 and custom URI
    [Tradable authenticateWithAppIdAndUri:100007 uri:@"com.tradable.example2://oauth2callback" webView: nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
