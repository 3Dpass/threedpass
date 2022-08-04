#import "CalcPlugin.h"
#if __has_include(<calc/calc-Swift.h>)
#import <calc/calc-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "calc-Swift.h"
#endif

@implementation CalcPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftCalcPlugin registerWithRegistrar:registrar];
}
@end
