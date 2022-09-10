import Flutter
import UIKit

public class SwiftCalcPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    // We are not using Flutter channels here

    // let channel = FlutterMethodChannel(name: "calc", binaryMessenger: registrar.messenger())
    // let instance = SwiftCalcPlugin()
    // registrar.addMethodCallDelegate(instance, channel: channel)
    dummyMethodToEnforceBundling();
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    // result("iOS " + UIDevice.current.systemVersion)
    // Noop
  }

  public static func dummyMethodToEnforceBundling() {
    // dummy calls to prevent tree shaking
    calc("", 0, 1, 1, "");
    version();
  }
}
