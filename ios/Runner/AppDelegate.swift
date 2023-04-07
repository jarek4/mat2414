import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
      let URL_LINK_CHANNEL = "com.gmail.forin.mat2414/url_link"

      let urlLinkChannel = FlutterMethodChannel(
        name:URL_LINK_CHANNEL,
        binaryMessenger: controller.binaryMessenger)

      urlLinkChannel.setMethodCallHandler({
          (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
          switch call.method {
          case"openUrl":
              guard let args = call.arguments as? [String: String] else {return}
              let link = args["link"]!
              self.openLink(link: link)
          default: result(FlutterMethodNotImplemented)

          }
      })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    private func openLink(link: String) {
        /* if let url = URL(string: urlSting.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        } */

        if let url = URL(string: link), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
}
