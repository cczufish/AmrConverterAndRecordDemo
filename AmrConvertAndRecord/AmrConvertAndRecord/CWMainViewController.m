//
//  CWMainViewController.m
//  AmrConvertAndRecord
//
//  Created by Holyen Zou on 13-10-28.
//  Copyright (c) 2013年 Holyen Zou. All rights reserved.
//

#import "CWMainViewController.h"

@interface CWMainViewController ()

@end

@implementation CWMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _utility = [[CWUtility alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self
                                                                                            action:@selector(recordButtonLongPress:)];
    longPress.delegate = self;
    [_recordButton addGestureRecognizer:longPress];
    
}

- (void)recordButtonLongPress:(UILongPressGestureRecognizer *)longPress
{
    if (longPress.state == UIGestureRecognizerStateBegan) {
        //录音开始.
        [_utility beginRecordByFileName:[CWUtility currentTimeString]];
    } else if (longPress.state == UIGestureRecognizerStateEnded) {
        //结束.
        [_utility stopRecord];
        NSString *wavInfoStr = [NSString stringWithFormat:@"文件大小:%d", [_utility sizeOfFileFromPath:_utility.path] / 1024];
        _wavInfoLabel.text = wavInfoStr;
        
    }
}

- (IBAction)playWav:(id)sender {
    [_utility playRecordByPath:_utility.path];
}

- (IBAction)wavToAmr:(id)sender {
    
    BOOL isSuccess = [CWUtility wavToAmr:_utility.path savePath:_utility.amrPath];
    if (isSuccess) {
        NSLog(@"convert wav to amr success!");
    } else
        NSLog(@"covert wav to amr fail!");
}

- (IBAction)amrToWav:(id)sender {
    BOOL isSuccess = [CWUtility amrToWav:_utility.amrPath savePath:_utility.wavNewPath];
    if (isSuccess) {
        NSLog(@"convert amr to wav success!");
    } else {
        NSLog(@"convert amr to wav fail!");
    }
}

- (IBAction)playNewWav:(id)sender {
    [_utility playRecordByPath:_utility.wavNewPath];

}

@end
