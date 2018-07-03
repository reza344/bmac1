import UIKit
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
extension UILabel {
   @objc public var substituteFontName : String {
        get {
            return self.font.fontName;
        }
        set {
            let fontNameToTest = self.font.fontName.lowercased();
            var fontName = newValue;
            if fontNameToTest.range(of: "bold") != nil {
                fontName += "-Bold";
            } else if fontNameToTest.range(of: "medium") != nil {
                fontName += "-Medium";
            } else if fontNameToTest.range(of: "light") != nil {
                fontName += "-Light";
            } else if fontNameToTest.range(of: "ultralight") != nil {
                fontName += "-UltraLight";
            }
            self.font = UIFont(name: fontName, size: self.font.pointSize)
        }
    }
}

extension UITextView {
   @objc public var substituteFontName : String {
        get {
            return self.font?.fontName ?? "";
        }
        set {
            let fontNameToTest = self.font?.fontName.lowercased() ?? "";
            var fontName = newValue;
            if fontNameToTest.range(of: "bold") != nil {
                fontName += "-Bold";
            } else if fontNameToTest.range(of: "medium") != nil {
                fontName += "-Medium";
            } else if fontNameToTest.range(of: "light") != nil {
                fontName += "-Light";
            } else if fontNameToTest.range(of: "ultralight") != nil {
                fontName += "-UltraLight";
            }
            self.font = UIFont(name: fontName, size: self.font?.pointSize ?? 17)
        }
    }
}

extension UITextField {
   @objc public var substituteFontName : String {
        get {
            return self.font?.fontName ?? "";
        }
        set {
            let fontNameToTest = self.font?.fontName.lowercased() ?? "";
            var fontName = newValue;
            if fontNameToTest.range(of: "bold") != nil {
                fontName += "-Bold";
            } else if fontNameToTest.range(of: "medium") != nil {
                fontName += "-Medium";
            } else if fontNameToTest.range(of: "light") != nil {
                fontName += "-Light";
            } else if fontNameToTest.range(of: "ultralight") != nil {
                fontName += "-UltraLight";
            }
            self.font = UIFont(name: fontName, size: self.font?.pointSize ?? 17)
        }
    }
}

extension UIColor {
    class func draculaBackground() -> UIColor {
        return UIColor(red: 40.0 / 255.0, green: 42.0 / 255.0, blue: 54.0 / 255.0, alpha: 1.0)
    }
    class func draculaCurrentLine() -> UIColor {
        return UIColor(red: 68.0 / 255.0, green: 71.0 / 255.0, blue: 90.0 / 255.0, alpha: 1.0)
    }
    class func draculaSelection() -> UIColor {
        return UIColor(red: 68.0 / 255.0, green: 71.0 / 255.0, blue: 90.0 / 255.0, alpha: 1.0)
    }
    class func draculaForeground() -> UIColor {
        return UIColor(red: 248.0 / 255.0, green: 248.0 / 255.0, blue: 242.0 / 255.0, alpha: 1.0)
    }
    class func draculaComment() -> UIColor {
        return UIColor(red: 98.0 / 255.0, green: 114.0 / 255.0, blue: 164.0 / 255.0, alpha: 1.0)
    }
    class func draculaCyan() -> UIColor {
        return UIColor(red: 139.0 / 255.0, green: 233.0 / 255.0, blue: 253.0 / 255.0, alpha: 1.0)
    }
    class func draculaGreen() -> UIColor {
        return UIColor(red: 80.0 / 255.0, green: 250.0 / 255.0, blue: 123.0 / 255.0, alpha: 1.0)
    }
    class func draculaOrange() -> UIColor {
        return UIColor(red: 255.0 / 255.0, green: 184.0 / 255.0, blue: 108.0 / 255.0, alpha: 1.0)
    }
    class func draculaPink() -> UIColor {
        return UIColor(red: 255.0 / 255.0, green: 121.0 / 255.0, blue: 198.0 / 255.0, alpha: 1.0)
    }
    class func draculaPurple() -> UIColor {
        return UIColor(red: 189.0 / 255.0, green: 147.0 / 255.0, blue: 249.0 / 255.0, alpha: 1.0)
    }
    class func draculaRed() -> UIColor {
        return UIColor(red: 255.0 / 255.0, green: 85.0 / 255.0, blue: 85.0 / 255.0, alpha: 1.0)
    }
    class func draculaYellow() -> UIColor {
        return UIColor(red: 241.0 / 255.0, green: 250.0 / 255.0, blue: 140.0 / 255.0, alpha: 1.0)
    }
}
extension Sequence {
    func group<U: Hashable>(by key: (Iterator.Element) -> U) -> [U:[Iterator.Element]] {
        return Dictionary.init(grouping: self, by: key)
    }
}
//extension UITableView {
//    func tvFadeCell() {
//        self.reloadData()
//        var delayCounter = 0.0
//        for cell in self.visibleCells {
//            cell.alpha = 0.0
//            UIView.animate(withDuration: TimeInterval(delayCounter),animations: {
//                cell.alpha = 1.0
//            }, completion: nil)
//            delayCounter += 0.30
//        }
//    }
//}





