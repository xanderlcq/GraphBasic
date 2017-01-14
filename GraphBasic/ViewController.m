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
    WordLadder *g;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    g = [[WordLadder alloc] init];
    [g loadDictionary:@"dictionaryFourLetters"];
    
    
    
    
    
    
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
