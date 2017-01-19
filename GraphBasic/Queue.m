//
//  Queue.m
//  MazeSolver
//
//  Created by Xander on 11/8/16.
//  Copyright © 2016 Xander. All rights reserved.
//

#import "Queue.h"

@implementation Queue
-(id) init{
    self = [super init];
    if(self){
        myQueue = [[NSMutableArray alloc] init];
    }
    return self;
}
-(id) initWith:(Vertex *)s{
    self = [super init];
    if(self){
         myQueue = [[NSMutableArray alloc] init];
        [myQueue addObject:s];
    }
    return self;
}
-(void) enqueue:(Vertex *)s{
    [myQueue addObject:s];
}
-(Vertex *) dequeue{
    Vertex *top = [myQueue objectAtIndex:0];
    [myQueue removeObjectAtIndex:0];
    return top;
}
-(Vertex *) peek{
    return [myQueue objectAtIndex:0];
}
-(bool) isEmpty{
    return [myQueue count]==0;
}
@end
