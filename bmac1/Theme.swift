import UIKit
import SwifterSwift

enum Theme: Int {
    case Bule, Red, Pink, Purple, Green, Yellow, Orange
    
    var baseColor: UIColor {
        switch self {
        case .Red:
            return UIColor(hex: 0xf44336)!
        case .Pink:
            return UIColor(hex: 0xE91E63)!
        case .Purple:
            return UIColor(hex: 0x9C27B0)!
        case .Bule:
            return UIColor(hex: 0x03A9F4)!
        case .Green:
            return UIColor(hex: 0x4CAF50)!
        case .Yellow:
            return UIColor(hex: 0xFDD835)!
        case .Orange:
            return UIColor(hex: 0xFF9800)!
        }
    }
    var lightColor: UIColor {
        switch self {
        case .Red:
            return UIColor(hex: 0xff1744)!
        case .Pink:
            return UIColor(hex: 0xFF80AB)!
        case .Purple:
            return UIColor(hex: 0xD500F9)!
        case .Bule:
            return UIColor(hex: 0x00B0FF)!
        case .Green:
            return UIColor(hex: 0x00E676)!
        case .Yellow:
            return UIColor(hex: 0xFFEB3B)!
        case .Orange:
            return UIColor(hex: 0xFF9100)!
        }
    }
    var lighterColor: UIColor {
        switch self {
        case .Red:
            return UIColor(hex: 0xffcdd2)!
        case .Pink:
            return UIColor(hex: 0xF8BBD0)!
        case .Purple:
            return UIColor(hex: 0xE1BEE7)!
        case .Bule:
            return UIColor(hex: 0xB3E5FC)!
        case .Green:
            return UIColor(hex: 0xC8E6C9)!
        case .Yellow:
            return UIColor(hex: 0xFFF9C4)!
        case .Orange:
            return UIColor(hex: 0xFFE0B2)!
        }
    }
    var darkColor: UIColor {
        switch self {
        case .Red:
            return UIColor(hex: 0xd32f2f)!
        case .Pink:
            return UIColor(hex: 0xC2185B)!
        case .Purple:
            return UIColor(hex: 0x7B1FA2)!
        case .Bule:
            return UIColor(hex: 0x0288D1)!
        case .Green:
            return UIColor(hex: 0x388E3C)!
        case .Yellow:
            return UIColor(hex: 0xFBC02D)!
        case .Orange:
            return UIColor(hex: 0xF57C00)!
        }
    }
    var darkerColor: UIColor {
        switch self {
        case .Red:
            return UIColor(hex: 0xb71c1c)!
        case .Pink:
            return UIColor(hex: 0x880E4F)!
        case .Purple:
            return UIColor(hex: 0x4A148C)!
        case .Bule:
            return UIColor(hex: 0x01579B)!
        case .Green:
            return UIColor(hex: 0x1B5E20)!
        case .Yellow:
            return UIColor(hex: 0xF57F17)!
        case .Orange:
            return UIColor(hex: 0xE65100)!
        }
    }
    
    var backgroundColor: UIColor {
        return lighterColor
    }
    var selectionColor: UIColor {
        return darkerColor
    }
    var tintColor: UIColor {
        return baseColor
    }
    var barStyle: UIBarStyle {
        return .default
    }
    var textColor: UIColor {
        switch self {
        case .Red:
            return .white
        case .Pink:
            return .white
        case .Purple:
            return .white
        case .Bule:
            return .white
        case .Green:
            return .white
        case .Yellow:
            return .black
        case .Orange:
            return .white
        }
    }
}

let SelectedThemeKey = "SelectedTheme"
struct ThemeManager {
    static func currentTheme() -> Theme {
        let storedTheme = UserDefaults.standard.integer(forKey: SelectedThemeKey)
        return Theme(rawValue: storedTheme)!
    }
    static func applyTheme(theme: Theme) {
        UserDefaults.standard.set(theme.rawValue, forKey: SelectedThemeKey)
        UserDefaults.standard.synchronize()
        //UIButton.appearance().tintColor = theme.tintColor
        //UIView.appearance().backgroundColor = theme.mainColor
        //UITableView.appearance().tintColor = theme.secondaryColor
        //UITabBar.appearance().barStyle = theme.barStyle
//        UITabBar.appearance().backgroundColor = theme.mainColor
//        UITabBar.appearance().barTintColor = theme.mainColor
//        UITabBar.appearance().tintColor = theme.mainColor
        //UIApplication.shared.delegate?.window??.backgroundColor = theme.mainColor
//        UIApplication.shared.statusBarStyle = .lightContent
//        UIApplication.shared.statusBarStyle = .lightContent
        //UITabBar.appearance().barStyle = theme.barStyle
        //UINavigationBar.appearance().barStyle = theme.barStyle
        //UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: theme.tintColor]
        //UILabel.appearance().textColor = theme.textColor
        //UIButton.appearance().tintColor = theme.tintColor
        //UIApplication.shared.delegate?.window??.tintColor = theme.tintColor
        //UITableView.appearance().backgroundColor = theme.backgroundColor
//        UITableView.appearance().separatorColor = theme.selectionColor
//        UITableViewCell.appearance().backgroundColor = theme.backgroundColor
        //UICollectionView.appearance().backgroundColor = theme.backgroundColor
        //UICollectionViewCell.appearance().backgroundColor = theme.backgroundColor
    }
}
