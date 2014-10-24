//
//  ViewController.h
//  TextFieldApp
//
//  Created by Ziyad Parekh on 10/24/14.
//  Copyright (c) 2014 Ziyad Parekh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>
@property (strong, nonatomic) NSMutableArray *timeArray;
@property (strong, nonatomic) NSMutableArray *wordArray;
@property (nonatomic) NSTimeInterval startTime;
@property (strong, nonatomic) IBOutlet UILabel *wordMapLabel;

@end

