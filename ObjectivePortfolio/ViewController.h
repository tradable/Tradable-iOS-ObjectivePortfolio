//
//  ViewController.h
//  ObjectivePortfolio
//
//  Created by Tradable ApS on 17/11/15.
//  Copyright © 2015 Tradable ApS. All rights reserved.
//

#import <UIKit/UIKit.h>

@import TradableAPI;

//Conforms to TradableAPIDelegate protocol
@interface ViewController : UIViewController <TradableAPIDelegate>

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end