import UIKit
import SwiftMessages


func randomNumber(range:Range<Int>) -> Int {
    return Int(arc4random_uniform(UInt32(range.upperBound - range.lowerBound))) + range.lowerBound
}

func randomUniqueNumbers(range:Range<Int>, arraySize: Int) -> [Int] {
    guard arraySize <= (range.upperBound - range.lowerBound) else { return [] }
    var numbers: Set<Int> = Set<Int>()
    (0..<arraySize).forEach { _ in
        let beforeCount = numbers.count
        repeat {
            numbers.insert(randomNumber(range:range))
        } while numbers.count == beforeCount
    }
    return numbers.map{ $0 }
}

enum diraction: Int {
    case rightToLeft, leftToRight, upToDown, downToUp
}
func slideIn(view: UIView?, objects: [AnyObject], direction: diraction, withDuration: TimeInterval, delay: TimeInterval) {
    for object in objects {
        var frame = object.value(forKey: "frame") as! CGRect
        switch direction {
        case .rightToLeft:
            frame.origin.x += 500
            object.setValue(frame, forKeyPath: "frame")
            UIView.animate(withDuration: withDuration, delay: delay, options: [.curveEaseOut], animations: {
                frame.origin.x -= 500
                object.setValue(frame, forKeyPath: "frame")
                view?.layoutIfNeeded()
            }, completion: nil)
        case .leftToRight:
            frame.origin.x -= 500
            object.setValue(frame, forKeyPath: "frame")
            UIView.animate(withDuration: withDuration, delay: delay, options: [.curveEaseOut], animations: {
                frame.origin.x += 500
                object.setValue(frame, forKeyPath: "frame")
                view?.layoutIfNeeded()
            }, completion: nil)
        case .upToDown:
            frame.origin.y -= 500
            object.setValue(frame, forKeyPath: "frame")
            UIView.animate(withDuration: withDuration, delay: delay, options: [.curveEaseOut], animations: {
                frame.origin.y += 500
                object.setValue(frame, forKeyPath: "frame")
                view?.layoutIfNeeded()
            }, completion: nil)
        case .downToUp:
            frame.origin.y += 500
            object.setValue(frame, forKeyPath: "frame")
            UIView.animate(withDuration: withDuration, delay: delay, options: [.curveEaseOut], animations: {
                frame.origin.y -= 500
                object.setValue(frame, forKeyPath: "frame")
                view?.layoutIfNeeded()
            }, completion: nil)
        }
    }
}
func fadeIn(objects: [AnyObject], withDuration: TimeInterval, delay: TimeInterval) {
    for object in objects {
        object.setValue(0, forKeyPath: "alpha")
        UIView.animate(withDuration: withDuration, delay: delay, options: .curveEaseIn, animations: {
            object.setValue(1, forKeyPath: "alpha")
        }, completion: nil)
    }
}



//**********************************************
enum MsgType {case info;case success;case warning;case error;}
func showSwiftMessage(msgType: MsgType, duration: TimeInterval, title: String, body: String){
    let view = MessageView.viewFromNib(layout: .messageView)
    
    let iconStyle = IconStyle.light
    switch msgType {//6D4C41
    case .info:
        view.configureTheme(backgroundColor: UIColor(hex: 0x3E2723)!, foregroundColor: UIColor.white, iconImage: Icon.infoLight.image, iconText: nil)
    case .success:
        view.configureTheme(.success, iconStyle: iconStyle)
    case .warning:
        view.configureTheme(.warning, iconStyle: iconStyle)
    case .error:
        view.configureTheme(.error, iconStyle: iconStyle)
    }
    
    view.button?.isHidden = true
    view.configureContent(title: title, body: body)
    view.bodyLabel?.textAlignment = .right
    view.buttonTapHandler = { _ in SwiftMessages.hide() }
    view.tapHandler = { _ in SwiftMessages.hide() }
    var config = SwiftMessages.Config()
    config.presentationStyle = .top
    config.presentationContext = .window(windowLevel: UIWindowLevelStatusBar)
    config.duration = .seconds(seconds: duration)

    SwiftMessages.show(config: config, view: view)
}
func toEnglishNumber(input: String) -> String{
    var result: String = ""
    let numberFormatter = NumberFormatter()
    numberFormatter.locale = Locale(identifier: "EN")
    if let finalText = numberFormatter.number(from: input)
    {
        result = String(describing: finalText)
    }
    return result
}
func toEnglishDate(input: String) -> String{
    var result: String = ""
    let arry = input.split(separator: "/")
    for item in arry {
        result = result + toEnglishNumber(input: String(item)) + "/"
    }
    result.removeLast()
    return result
}
class ButtonWithImage: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        if imageView != nil {
            imageEdgeInsets = UIEdgeInsets(top: 5, left: (bounds.width - 35), bottom: 5, right: 5)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: (imageView?.frame.width)!)
        }
    }
}
//*****************************************************************************
func copyFileFromBundleToDocumentDirectory(fileName: String, isReplace: Bool) {
    let fileManager = FileManager.default
    let documentsUrl = fileManager.urls(for: .documentDirectory,in: .userDomainMask)
    guard documentsUrl.count != 0 else {
        return // Could not find documents URL
    }
    let finalDatabaseURL = documentsUrl.first!.appendingPathComponent(fileName)
    if ( (try? finalDatabaseURL.checkResourceIsReachable()) ?? false && isReplace) {
        do {
            try fileManager.removeItem(atPath: finalDatabaseURL.path)
            print("\(fileName) deleted from DocumentDirectory")
        } catch let error as NSError {
            print("Couldn't delete \(fileName) from DocumentDirectory! Error:\(error.description)")
        }
    }
    let documentsURL = Bundle.main.resourceURL?.appendingPathComponent(fileName)
    do {
        try fileManager.copyItem(atPath: (documentsURL?.path)!, toPath: finalDatabaseURL.path)
        print("\(fileName) copied to DocumentDirectory")
    } catch let error as NSError {
        print("Couldn't copy \(fileName) to DocumentDirectory! Error:\(error.description)")
    }
}
//*****************************************************************************
