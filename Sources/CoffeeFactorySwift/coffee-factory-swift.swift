import Foundation
import SwiftUI

public struct CoffeeFactorySwift {
    public init() {
    }
}

public extension Color {
    static let customColor: Color = Color("MybaseColor", bundle: Bundle.module)
}

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
