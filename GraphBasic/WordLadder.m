//
//  WordLadder.m
//  GraphBasic
//
//  Created by Xander on 1/13/17.
//  Copyright © 2017 Xander. All rights reserved.
//

#import "WordLadder.h"

@implementation WordLadder
-(BOOL) loadDictionary:(NSString *)fileName{
    self.graph = [[Graph alloc] init];
    self.bukects = [[NSMutableDictionary alloc] init];
    NSString* path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"txt"];
    NSError *errorReading;

    NSArray *linesOfText = [[NSString stringWithContentsOfFile:path
                                                      encoding:NSUTF8StringEncoding
                                                         error:&errorReading]
                            componentsSeparatedByString:@"\n"];
    
    if(errorReading){
        NSLog(@"Reading error  %@",errorReading);
        self.graph = nil;
        self.bukects = nil;
        return NO;
    }
    
    for(int i = 0; i < [linesOfText count]-1;i++){
        NSString *currentWord = [linesOfText objectAtIndex:i];
        for (int j = 0; j < [[linesOfText objectAtIndex:i] length]; j ++) {
            NSString *currentKey = [self replacedLetterAtIndex:j source:currentWord replaceWith:@"_"];
            if([self.bukects objectForKey:currentKey]){
                if(![[self.bukects objectForKey:currentKey] containsObject:currentWord])
                    [[self.bukects objectForKey:currentKey] addObject:currentWord];
            }else{
                [self.bukects setObject:[[NSMutableArray alloc] initWithObjects:currentWord, nil] forKey:currentKey];
            }
        }
    }
    return YES;
}


-(NSString *) replacedLetterAtIndex:(int) i source:(NSString *) og replaceWith:(NSString *) str{
    return [og stringByReplacingCharactersInRange:NSMakeRange(i, 1) withString:str];
}
@end
