//
//  WordLadder.m
//  GraphBasic
//
//  Created by Xander on 1/13/17.
//  Copyright © 2017 Xander. All rights reserved.
//

#import "WordLadder.h"

@implementation WordLadder
-(BOOL) loadDictionary:(NSString *)fileName wordLength:(int) length{
    self.graph = [[Graph alloc] init];
    NSString* path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"txt"];
    NSError *errorReading;

    NSArray *linesOfText = [[NSString stringWithContentsOfFile:path
                                                      encoding:NSUTF8StringEncoding
                                                         error:&errorReading]
                            componentsSeparatedByString:@"\n"];
    
    if(errorReading){
        NSLog(@"Reading error  %@",errorReading);
        self.graph = nil;
        return NO;
    }
    NSMutableDictionary<NSString *, NSMutableArray *> *bucket =[[NSMutableDictionary alloc] init];
    for(NSString *currentWord in linesOfText){
        if([currentWord length] == length){
            for (int j = 0; j < [currentWord length]; j ++) {
                NSString *currentKey = [self replacedLetterAtIndex:j source:currentWord replaceWith:@"_"];
                NSMutableArray *arr =[bucket objectForKey:currentKey];
                if(arr != nil)
                    [arr addObject:currentWord];
                else
                    [bucket setObject:[[NSMutableArray alloc] initWithObjects:currentWord, nil] forKey:currentKey];
            }
        }
    }
    return [self buildGraph:bucket];

}
-(BOOL) buildGraph:(NSMutableDictionary *) bucket{
    for(NSString *key in bucket){
        NSMutableArray *bukect = [bucket objectForKey:key];
        if([bukect count] == 1){
            [self.graph addVertex:[bukect firstObject]];
            
        }else{
            for(NSString *word1 in bukect){
                for(NSString *word2 in bukect){
                    if(![word1 isEqualToString:word2]){
                        [self.graph addBothWayConnection:word1 and:word2];
                    }
                }
            }
        }
    }
    return YES;
}
-(BOOL) bfs:(NSString *) start{
    
    if(![self.graph contains:start])
        return NO;
    Queue *queue = [[Queue alloc] init];
    Vertex *startVertex = [self.graph getVertex:start];
    startVertex.distance = 0;
    queue = [[Queue alloc] initWith:startVertex];
    while(![queue isEmpty]){
        Vertex *current = [queue dequeue];
        for(Vertex *neighbor in current.adjacentVertices){
            if([neighbor.color isEqualToString:@"white"]){
                
                neighbor.color = @"grey";
                neighbor.distance = current.distance+1;
                neighbor.predecessor = current;
                [queue enqueue:neighbor];
            }
        }
        current.color = @"black";
    }
    return YES;
}

-(NSMutableArray *) traceBackFrom:(NSString *) end{
    Vertex *v = [self.graph getVertex:end];
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    if(v){
        while(v){
            [arr insertObject:[NSString stringWithString:v.value] atIndex:0];
            v = v.predecessor;
        }
    }else{
        return nil;
    }
    
    return arr;
}

-(void) resetGraph{
    for(Vertex *v in self.graph.vertices){
        v.color = @"white";
    }
}
-(NSString *) replacedLetterAtIndex:(int) i source:(NSString *) og replaceWith:(NSString *) str{
    return [og stringByReplacingCharactersInRange:NSMakeRange(i, 1) withString:str];
}
@end
