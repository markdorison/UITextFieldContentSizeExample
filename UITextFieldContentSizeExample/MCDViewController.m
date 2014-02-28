//
//  MCDViewController.m
//  TextViewContentSizeExample
//
//  Created by Mark Dorison on 2/28/14.
//  Copyright (c) 2014 MCD. All rights reserved.
//

#import "MCDViewController.h"

@interface MCDViewController ()

@property (nonatomic, weak) IBOutlet UITextField *autoResizeTextField;

@end

@implementation MCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.autoResizeTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)textFieldDidChange:(UITextField *)textField {
    [UIView animateWithDuration:0.1 animations: ^{
        NSLog(@"%@", NSStringFromCGSize(textField.intrinsicContentSize));

        // This is triggered correctly on all changes to the UITextField, but seems to have incorrect values
        [textField invalidateIntrinsicContentSize];

        NSLog(@"%@", NSStringFromCGSize(textField.intrinsicContentSize));
    }];
}

@end
