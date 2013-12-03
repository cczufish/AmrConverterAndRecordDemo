//
//  CWMainViewController.h
//  AmrConvertAndRecord
//
//  Created by Holyen Zou on 13-10-28.
//  Copyright (c) 2013年 Holyen Zou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CWUtility.h"

@interface CWMainViewController : UIViewController <UIGestureRecognizerDelegate>
{
    CWUtility *_utility;
}

@property (weak, nonatomic) IBOutlet UIButton *recordButton;

@property (weak, nonatomic) IBOutlet UIButton *playWavButtonTap;

@property (weak, nonatomic) IBOutlet UILabel *wavInfoLabel;

- (IBAction)playWav:(id)sender;
- (IBAction)wavToAmr:(id)sender;
- (IBAction)amrToWav:(id)sender;
- (IBAction)playNewWav:(id)sender;

@end
