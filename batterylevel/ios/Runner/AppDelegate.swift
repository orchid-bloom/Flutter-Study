import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    
    
    let controller = window.rootViewController as! FlutterViewController
    let batteryChannel = FlutterMethodChannel.init(name: "samples.flutter.io/battery", binaryMessenger: controller)
    batteryChannel.setMethodCallHandler {[weak self] (call, result) in
      guard let self = self else { return }
      if "getBatteryLevel" == call.method {
        self.receiveBatteryLevel(result: result)
      } else {
        result(FlutterMethodNotImplemented)
      }
    }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  
  private func receiveBatteryLevel(result: FlutterResult) {
    let device = UIDevice.current
    device.isBatteryMonitoringEnabled = true
    if (device.batteryState == UIDeviceBatteryState.unknown) {
      result(FlutterError.init(code: "UNAVAILAVLE", message: "", details: nil))
    } else {
      result(Int(device.batteryLevel * 100))
    }
  }
}
