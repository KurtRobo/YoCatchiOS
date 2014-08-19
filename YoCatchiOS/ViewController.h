//
//  ViewController.h
//  YoCatchiOS
//
//  Created by Kurt Robinson on 19/08/2014.
//  Copyright (c) 2014 Kurt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *yoField;

@property (weak, nonatomic) IBOutlet UITextField *catchField;

@property (weak, nonatomic) IBOutlet UILabel *myLabel;

- (IBAction)showMessageButton:(id)sender;

- (void)changeText;

@end
