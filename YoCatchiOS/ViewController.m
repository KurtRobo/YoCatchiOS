//
//  ViewController.m
//  YoCatchiOS
//
//  Created by Kurt Robinson on 19/08/2014.
//  Copyright (c) 2014 Kurt. All rights reserved.
//

#import "ViewController.h"
//#import "YoCatchModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.yoField.delegate = self;
    self.catchField.delegate = self;
    
    NSURL *normalSoundUrl = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/yoSound1.mp3", [[NSBundle mainBundle] resourcePath]]];
    NSURL *softSoundUrl = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/yoSound2.mp3", [[NSBundle mainBundle] resourcePath]]];
    NSURL *loudSoundUrl = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/yoSound3.mp3", [[NSBundle mainBundle] resourcePath]]];

    self.normalYo = [[AVAudioPlayer alloc] initWithContentsOfURL:normalSoundUrl error:nil];
    self.softYo = [[AVAudioPlayer alloc] initWithContentsOfURL:softSoundUrl error:nil];
    self.loudYo = [[AVAudioPlayer alloc] initWithContentsOfURL:loudSoundUrl error:nil];

    [self.normalYo prepareToPlay];
    [self.softYo prepareToPlay];
    [self.loudYo prepareToPlay];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
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
    self.myLabel.textColor = textColor;
    self.myLabel.text = [NSString stringWithFormat: @"%@\n%@", [self.yoField text], [self.catchField text]];
    
    
    if([[self.yoField text] isEqualToString:@"yo"])
        [self.softYo play];
    else if([[self.yoField text] isEqualToString:@"Yo"])
        [self.normalYo play];
    else if([[self.yoField text] isEqualToString:@"YO"])
       [self.loudYo play];
    

}

@end
