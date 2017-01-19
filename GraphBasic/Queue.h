//
//  Queue.h
//  MazeSolver
//
//  Created by Xander on 11/8/16.
//  Copyright © 2016 Xander. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Vertex.h"
@interface Queue : NSObject{
    NSMutableArray *myQueue;
}
-(id) init;
-(id) initWith:(Vertex *)s;
-(void) enqueue:(Vertex *)s;
-(Vertex *) dequeue;
-(Vertex *) peek;
-(bool) isEmpty;
@end
