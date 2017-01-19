//
//  WordLadder.h
//  GraphBasic
//
//  Created by Xander on 1/13/17.
//  Copyright © 2017 Xander. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Graph.h"
#import "Queue.h"
@interface WordLadder : NSObject
@property Graph *graph;


-(BOOL) loadDictionary:(NSString *)fileName wordLength:(int) length;
-(BOOL) bfs:(NSString *) start;
-(NSMutableArray *) traceBackFrom:(NSString *) end;
-(void) resetGraph;

@end
