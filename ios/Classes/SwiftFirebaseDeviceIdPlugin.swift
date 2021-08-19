import Flutter
import UIKit
import FirebaseInstallations

public class SwiftFirebaseDeviceIdPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "firebase_device_id", binaryMessenger: registrar.messenger())
    let instance = SwiftFirebaseDeviceIdPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    Installations.installations().authTokenForcingRefresh(true, completion: { (token, error) in
      if let error = error {
        result(error.localizedDescription)
      }
      result(token?.authToken)
    })
  }
}
