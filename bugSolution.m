The solution is to always remove the observer using `removeObserver:forKeyPath:` before the observed object is deallocated.  This is crucial to prevent crashes.  Here's the corrected code:

```objectivec
@interface MyObject : NSObject
@property (nonatomic, strong) NSString *myString;
@end

@implementation MyObject
- (void)dealloc {
    NSLog(@"MyObject deallocating");
}
@end

// In some other class...
MyObject *obj = [[MyObject alloc] init];
obj.myString = @"Hello";
[obj addObserver:self forKeyPath:@"myString" options:NSKeyValueObservingOptionNew context:NULL];

// ... some code ...

[obj removeObserver:self forKeyPath:@"myString"];
// Release obj, now safe

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@