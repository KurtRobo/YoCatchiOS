//
//  ViewController.h
//  YoCatchiOS
//
//  Created by Kurt Robinson on 19/08/2014.
//  Copyright (c) 2014 Kurt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate> {
    UITextField *yoField;
    UITextField *catchField;
    UILabel *myLabel;
    UIButton *showMessageButton;
}

- (IBAction)showMessageButton:(id)sender;

- (void)changeText;

@end
