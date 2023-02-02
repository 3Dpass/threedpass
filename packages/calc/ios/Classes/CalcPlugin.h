#import <Flutter/Flutter.h>

@interface CalcPlugin : NSObject<FlutterPlugin>
@end

// This is from rust/target/bingings.h
// NOTE: Append the lines below to ios/Classes/<your>Plugin.h

char *calc(const unsigned char *input,
           int input_len,
           short par1,
           short par2,
           const unsigned char *trans,
           const unsigned char *version);

char *version(void);
