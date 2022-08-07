#import <Flutter/Flutter.h>

@interface CalcPlugin : NSObject<FlutterPlugin>
@end

// This is from rust/target/bingings.h
// NOTE: Append the lines below to ios/Classes/<your>Plugin.h

char *calc(short par1, short par2, const char *path);