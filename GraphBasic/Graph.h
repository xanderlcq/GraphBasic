//
//  Graph.h
//  GraphBasic
//
//  Created by Xander on 1/12/17.
//  Copyright © 2017 Xander. All rights reserved.
//

//!!!! This graph is un-directed and un-weighted

#import <Foundation/Foundation.h>
#import "Vertex.h"
@interface Graph : NSObject

@property NSMutableDictionary<NSString *, Vertex *> * vertices;

-(void)addVertex:(NSString *) vertexName;
-(void)addBothWayConnection:(NSString *) vertexName1 and:(NSString*) vertexName2;
-(void)addOneWayConnectionFrom:(NSString *) vertexName1 to:(NSString*) vertexName2;
-(void)addBothWayConnectionWithWeight:(NSString *) vertexName1 and:(NSString*) vertexName2 weigh:(NSNumber *) weight;
-(void)addOneWayConnectionFromWithWeight:(NSString *) vertexName1 and:(NSString*) vertexName2 weigh:(NSNumber *) weight;
-(BOOL)contains:(NSString *) vertexName;
-(Vertex *)getVertex:(NSString *) vertexName;
-(NSNumber *) getWeightFrom:(NSString *) vertex1 to:(NSString *)vertex2;

@end
