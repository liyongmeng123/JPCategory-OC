//
//  NSArray+JPCategory.m
//  JPCategoryOCDemo
//
//  Created by SteyDong on 2021/1/14.
//

#import "NSArray+JPCategory.h"

@implementation NSArray (JPCategory)

- (NSArray *)jp_map:(NSArrayMapComplete)mapComplete {
    
    NSMutableArray *mutableArray = [NSMutableArray array];
    for (id obj in self) {
        
        id returnObj = mapComplete(obj);
        if (returnObj) {
            [mutableArray addObject:returnObj];
        }
    }
    return [mutableArray copy];
    
}

- (NSArray *)jp_filter:(NSArrayFilterComplete)filterComplete {
    
    NSMutableArray *mutableArray = [NSMutableArray array];
    for (id obj in self) {
        
        BOOL returnObj = filterComplete(obj);
        if (returnObj) {
            [mutableArray addObject:obj];
        }
    }
    return [mutableArray copy];
    
}

- (NSArray *)jp_reversedArray {
    
    NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:[self count]];
    NSEnumerator *enumerator = [self reverseObjectEnumerator];
    for (id element in enumerator) {
      [mutableArray addObject:element];
    }
    return [mutableArray copy];
}


@end