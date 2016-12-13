
#import <Foundation/Foundation.h>

@interface NSNestedNumberEnumerator : NSEnumerator


/**
 init with nested number array 
 like : @[@[], @1, @[@2, @4], @[], @8, @[@[@9, @[@10, @11], @20], @44], @80, @[@99]]

 @param array nested number array
 @return instancetype
 */
- (instancetype)initWithNestedNumberArray:(NSArray *)array;

@end
