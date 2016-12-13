#import "NSNestedNumberEnumerator.h"

@interface NSNestedNumberEnumerator ()

@property (nonatomic, strong) NSMutableArray *stack;

@property (nonatomic, strong) NSArray *originalArray;

@end

@implementation NSNestedNumberEnumerator

- (instancetype)initWithNestedNumberArray:(NSArray *)array
{
    self = [super init];
    if (self) {
        self.originalArray = [array copy];
        self.stack = [NSMutableArray array];
        for (NSInteger i = array.count - 1; i >= 0; i --) {
            [self.stack addObject:array[i]];
        }
    }
    return self;
}

#pragma mark -

- (id)nextObject
{
    if ([self hasNext]) {
        id next = self.stack.lastObject;
        [self.stack removeLastObject];
        return next;
    }
    else {
        return nil;
    }
}

- (NSArray *)allObjects
{
    NSMutableArray *array = [NSMutableArray array];
    while ([self hasNext]) {
        [array addObject:self.stack.lastObject];
        [self.stack removeLastObject];
    }
    return [array copy];
}

#pragma mark - private methods

- (BOOL)hasNext
{
    id lastObject = self.stack.lastObject;
    
    while (lastObject && [lastObject isKindOfClass:[NSArray class]]) {
        NSArray *temp = (NSArray *)lastObject;
        //need remove the last object if it is an array
        [self.stack removeLastObject];
        //then reversely add all objects of lastObject to stack
        for (NSInteger i = temp.count - 1; i >= 0; i --) {
            [self.stack addObject:temp[i]];
        }
        lastObject = self.stack.lastObject;
    }
    
    if (lastObject && [lastObject isKindOfClass:[NSNumber class]]) {
        return YES;
    }
    else {
        return NO;
    }
}

@end
