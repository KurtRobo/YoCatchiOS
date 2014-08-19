//
//  ViewController.m
//  YoCatchiOS
//
//  Created by Kurt Robinson on 19/08/2014.
//  Copyright (c) 2014 Kurt. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    yoField.delegate = self;
    catchField.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)loadView {

    self.view = [[UIView alloc] initWithFrame:CGRectZero];
    self.view.backgroundColor = [UIColor whiteColor];
    
    yoField = [[UITextField alloc] initWithFrame:CGRectMake(10, 40, 300, 40)];
    [yoField setBackgroundColor:[UIColor clearColor]];
    [yoField setPlaceholder:@"Yo"];
    [[self view] addSubview:yoField];
    [yoField setBorderStyle:UITextBorderStyleRoundedRect];
    
    catchField = [[UITextField alloc] initWithFrame:CGRectMake(10, 90, 300, 40)];
    [catchField setBackgroundColor:[UIColor clearColor]];
    [catchField setPlaceholder:@"Catch!"];
    [[self view] addSubview:catchField];
    [catchField setBorderStyle:UITextBorderStyleRoundedRect];
    
    myLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 130, 320, 375)];
    [myLabel setBackgroundColor:[UIColor clearColor]];
    [myLabel setText:@"Hi Label"];
    //[myLabel setFont:<#(UIFont *)#>]
    [myLabel setNumberOfLines:2];
    [[self view] addSubview:myLabel];
    
    showMessageButton = [[UIButton alloc] initWithFrame:CGRectMake(95, 515, 140, 40)];
    [showMessageButton addTarget:self action:@selector(showMessageButton:) forControlEvents:UIControlEventTouchUpInside];
    [showMessageButton setTitle:@"Show Message" forState:UIControlStateNormal];
    [showMessageButton setBackgroundColor:[UIColor clearColor]];
    [showMessageButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [[self view] addSubview:showMessageButton];
}

//Calls function when show message button pressed
- (IBAction)showMessageButton:(id)sender {
    [self changeText];
}

//Hides keyboard and changes text/colour when enter is selected
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [[self view] endEditing:YES];
    [self changeText];
    return YES;
}

//Hides keyboard when you click away
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [[self view] endEditing:YES];
}

- (void) changeText {
    //Make colour
    float red = arc4random() % 256 / 255.0;
    float green = arc4random() % 256 / 255.0;
    float blue = arc4random() % 256 / 255.0;
    UIColor *backgroundColour = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    
    //Make contrast
    int threshold = 105;
    float bgDelta = ((red * 0.299) + (green * 0.587) + (blue * 0.114));
    UIColor *textColor = (105.5 - bgDelta < threshold) ? [UIColor blackColor] : [UIColor whiteColor];
    
    //Set changes
    [UIView animateWithDuration:0.5 animations:^{
        self.view.backgroundColor = backgroundColour;
    }];
    myLabel.textColor = textColor;
    myLabel.text = [NSString stringWithFormat: @"%@\n%@", [yoField text], [catchField text]];
}

@end
