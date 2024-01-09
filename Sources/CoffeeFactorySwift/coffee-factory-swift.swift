import Foundation
import SwiftUI

public struct CoffeeFactorySwift {
    public private(set) var text = "Hello, World!"

//    public var myFloat: CGFloat = .spacing100
    
    public init() {
    }
}

public extension Color {
    static var testColor: Color {
        Color("MybaseColor")
    }
}

//public enum Pretendard: String, CaseIterable {
//    case extraLight = "Pretendard-ExtraLight"
//    case thin = "Pretendard-Thin"
//    case light = "Pretendard-Light"
//    case regular = "Pretendard-Regular"
//    case medium = "Pretendard-Medium"
//    case semiBold = "Pretendard-SemiBold"
//    case bold = "Pretendard-Bold"
//    case extraBold = "Pretendard-ExtraBold"
//    case black = "Pretendard-Black"
//}
//
//extension Font {
//    public static func pretendard(_ pretendard: Pretendard, size: CGFloat, relativeTo: Font.TextStyle = .body) -> Font {
//        .custom(pretendard.rawValue, size: size, relativeTo: relativeTo)
//    }
//}

public struct CoffeeFactoryFont {
    public static func registerFonts() {
        Pretendard.allCases.forEach { registerFont(bundle: .module, fontName: $0.rawValue, fontExtension: "otf") }
    }
    
    fileprivate static func registerFont(bundle: Bundle, fontName: String, fontExtension: String) {
        guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension),
              let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
              let font = CGFont(fontDataProvider) else {
            fatalError("Could't create font from filename: \(fontName) with extension \(fontExtension)")
        }
        var error: Unmanaged<CFError>?
        CTFontManagerRegisterGraphicsFont(font, &error)
    }
}
