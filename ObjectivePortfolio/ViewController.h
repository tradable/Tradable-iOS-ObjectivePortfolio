//
//  ViewController.h
//  ObjectivePortfolio
//
//  Created by Tradable ApS on 17/11/15.
//  Copyright © 2015 Tradable ApS. All rights reserved.
//

#import <UIKit/UIKit.h>

@import TradableAPI;

//Conforms to TradableAuthDelegate and TradableEventsDelegate
@interface ViewController : UIViewController <TradableAuthDelegate, TradableEventsDelegate>

@property (weak, nonatomic) IBOutlet UILabel *accountLabel;
@property (weak, nonatomic) IBOutlet UIButton *activateButton;

@end
