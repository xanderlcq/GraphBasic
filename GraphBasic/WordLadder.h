//
//  WordLadder.h
//  GraphBasic
//
//  Created by Xander on 1/13/17.
//  Copyright © 2017 Xander. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Graph.h"
@interface WordLadder : NSObject
@property NSMutableDictionary<NSString *, NSMutableArray *> *bukects;
@property Graph *graph;
-(NSString *) replacedLetterAtIndex:(int) i source:(NSString *) og replaceWith:(NSString *) str;
-(BOOL) loadDictionary:(NSString *)fileName;
@end
