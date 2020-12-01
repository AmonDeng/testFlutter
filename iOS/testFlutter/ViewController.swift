//
//  ViewController.swift
//  testFlutter
//
//  Created by admin on 2020/11/30.
//

import UIKit
import Flutter
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        let button = UIButton(type:UIButton.ButtonType.custom)
          button.addTarget(self, action: #selector(showFlutter), for: .touchUpInside)
          button.setTitle("Show Flutter!", for: UIControl.State.normal)
          button.frame = CGRect(x: 80.0, y: 210.0, width: 160.0, height: 40.0)
          button.backgroundColor = UIColor.blue
          self.view.addSubview(button)
        // Do any additional setup after loading the view.
    }
    
    @objc func showFlutter() {
       let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
       let flutterViewController = FlutterViewController()
       let postChannel = "test/native_post"
        let evenChannal = FlutterEventChannel.init(name: postChannel, binaryMessenger: flutterViewController as! FlutterBinaryMessenger)
        evenChannal.setStreamHandler(self)
        self.navigationController?.pushViewController(flutterViewController, animated: true)
       
        let channelName = "test/native_get"
         let messageChannel = FlutterMethodChannel.init(name: channelName, binaryMessenger:flutterViewController as! FlutterBinaryMessenger)
         messageChannel.setMethodCallHandler { (call, result) in
             print("flutter 给到我：\nmethod=\(call.method) \narguments = \(call.arguments)");
             self.navigationController?.popViewController(animated: true)
         }
     }


}
extension ViewController:FlutterStreamHandler {
    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        events("哈哈哈哈哈哈哈")
        return nil;
    }
    
    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        return nil
    }
    
    
}

