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
          case"openMailTo":
              guard let args = call.arguments as? [String: String] else {return}
              let mailTo = args["mailTo"]!
              let subject = args["subject"]!
              let from = args["from"]!
              self.openMailTo(mailTo: mailTo, subject: subject, from: from)
          default: result(FlutterMethodNotImplemented)

          }
      })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  // opens link in default browser
    private func openLink(link: String) {
        /* if let url = URL(string: urlSting.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        } */

        if let url = URL(string: link), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
     // mail to - open default mail client
     private func openMailTo(mailTo: String, subject: String, from: String) {

       if let url = URL(string:"mailto:\(mailTo)?subject=\(subject)&body=\(from)") {
         if #available(iOS 10.0, *) {
           UIApplication.shared.open(url)
         } else {
         UIApplication.shared.openURL(url)
         }
       }

     }
}
