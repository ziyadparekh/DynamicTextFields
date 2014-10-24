//
//  ViewController.m
//  TextFieldApp
//
//  Created by Ziyad Parekh on 10/24/14.
//  Copyright (c) 2014 Ziyad Parekh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.timeArray = [[NSMutableArray alloc] init];
    self.wordArray = [[NSMutableArray alloc] init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesBegan:withEvent:");
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    NSLog(@"textFieldShouldBeginEditing");
    textField.backgroundColor = [UIColor colorWithRed:220.0f/255.0f green:220.0f/255.0f blue:220.0f/255.0f alpha:1.0f];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.startTime = [NSDate timeIntervalSinceReferenceDate];
    NSLog(@"%f", self.startTime);
    NSLog(@"textFieldDidBeginEditing");
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    NSLog(@"textFieldShouldEndEditing");
    textField.backgroundColor = [UIColor whiteColor];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSLog(@"textFieldDidEndEditing");
    double originalTime = 0;
    for (NSString *textToDisplay in self.wordArray) {
        NSUInteger indexValue = [self.wordArray indexOfObject:textToDisplay];
        NSString *timerValue = [self.timeArray objectAtIndex:indexValue];
        double timeInterval = [timerValue doubleValue];
        timeInterval = timeInterval + originalTime;
        originalTime = timeInterval;
        [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(printStringtoLabel:) userInfo:textToDisplay repeats:NO];
    }
}

- (void)printStringtoLabel:(NSTimer *)timer{
    NSString *stringToPaste = (NSString *)[timer userInfo];
    self.wordMapLabel.text = stringToPaste;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)String {
    NSLog(@"%@", String);
    NSTimeInterval seconds = [NSDate timeIntervalSinceReferenceDate];
    NSTimeInterval difference = seconds - self.startTime;
    NSString *timeInString = [NSString stringWithFormat:@"%f", difference];
    [self.timeArray addObject:timeInString];
    [self.wordArray addObject:textField.text];
    self.startTime = seconds;
    NSLog(@"%@", self.wordArray);
    NSLog(@"%@", self.timeArray);
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    NSLog(@"textFieldShouldClear");
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"textFieldShouldReturn");
    [textField resignFirstResponder];
    
    [self.wordArray removeAllObjects];
    [self.timeArray removeAllObjects];
    return YES;
}

@end
