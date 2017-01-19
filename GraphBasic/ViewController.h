//
//  ViewController.h
//  GraphBasic
//
//  Created by Xander on 1/12/17.
//  Copyright © 2017 Xander. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController
@property (weak) IBOutlet NSTextField *startWordOutlet;
@property (weak) IBOutlet NSTextField *targetWordOutlet;
@property (unsafe_unretained) IBOutlet NSTextView *resultOutlet;

- (IBAction)solveAction:(id)sender;

@end

