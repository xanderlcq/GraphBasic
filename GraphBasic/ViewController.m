//
//  ViewController.m
//  GraphBasic
//
//  Created by Xander on 1/12/17.
//  Copyright © 2017 Xander. All rights reserved.
//

#import "ViewController.h"
#import "Graph.h"
#import "WordLadder.h"
@implementation ViewController{
    WordLadder *ladder;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    ladder = [[WordLadder alloc] init];
    
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


- (IBAction)solveAction:(id)sender {
    NSString *startingWord = self.startWordOutlet.stringValue;
    NSString *targetWord = self.targetWordOutlet.stringValue;
    if([startingWord length] != [targetWord length]){
        [self.resultOutlet setString:@"two words have different length!"];
        return;
    }
    [ladder loadDictionary:@"complete" wordLength:(int)[startingWord length]];
    
    if(![ladder bfs:startingWord]){
        [self.resultOutlet setString:@"starting word does not exist!"];
        return;
    }
    NSMutableArray *result = [ladder traceBackFrom:targetWord];
    if(!result){
        [self.resultOutlet setString:@"target word does not exist!"];
        return;
    }
    if([result count] == 1){
        [self.resultOutlet setString:@"no possible way to solve this!"];
        return;
    }
    NSString *displayStr = [result componentsJoinedByString:@"\n"];
    [self.resultOutlet setString:displayStr];
}
@end
