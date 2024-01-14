//
//	Typography.swift
//	Coffee Factory
//
//	Created by YunCoffee on 2024. 1. 14.
//

import Foundation
import SwiftUI

protocol CFFontDescriptor {
    associatedtype FontEnum
    
    var fontWeight: FontEnum { get }
    var fontSize: CGFloat { get }
    var lineHeight: CGFloat { get }
    var letterSpacing: CGFloat { get }
    var relativeTo: Font.TextStyle { get }
}


// MARK: View Extension
extension View {
    public func pretendard(_ scale: Pretendard.FontScale, weight: Pretendard? = nil) -> some View {
        modifier(PretendardModifier(scale: scale, weight: weight))
    }
}

struct PretendardModifier: ViewModifier {
    var scale: Pretendard.FontScale
    var weight: Pretendard?
    
    func body(content: Content) -> some View {
        content
            .font(
                .custom(
                    weight?.rawValue ?? scale.fontWeight.rawValue,
                    size: scale.fontSize,
                    relativeTo: scale.relativeTo
                )
            )
            .lineSpacing(.pretendardLineSpacing(scale))
    }
}

// MARK: Utils Extensions
extension Font {
    public static func pretendard(_ pretendard: Pretendard, size: CGFloat, relativeTo: Font.TextStyle = .body) -> Font {
        .custom(pretendard.rawValue, size: size, relativeTo: relativeTo)
    }
    
    public static func pretendard(_ fontScale: Pretendard.FontScale) -> Font {
        .custom(fontScale.fontWeight.rawValue, size: fontScale.fontSize, relativeTo: fontScale.relativeTo)
    }
    
    public static func pretendard(_ fontScale: Pretendard.FontScale, weight: Pretendard?) -> Font {
        guard let weight = weight else {
            return .custom(fontScale.fontWeight.rawValue, size: fontScale.fontSize, relativeTo: fontScale.relativeTo)
        }
        return .custom(weight.rawValue, size: fontScale.fontSize, relativeTo: fontScale.relativeTo)
    }
}

extension CGFloat {
    public static func pretendardFontSize(_ fontScale: Pretendard.FontScale) -> CGFloat {
        fontScale.fontSize
    }
    
    public static func pretendardLineSpacing(_ fontScale: Pretendard.FontScale) -> CGFloat {
        fontScale.lineHeight
    }
    
    public static func pretendardLetterSpacing(_ fontScale: Pretendard.FontScale) -> CGFloat {
        fontScale.letterSpacing
    }
}

public enum Pretendard: String, CaseIterable {
    case black = "Pretendard-Black"
    case light = "Pretendard-Light"
    case regular = "Pretendard-Regular"
    case bold = "Pretendard-Bold"
    case semiBold = "Pretendard-SemiBold"
    case medium = "Pretendard-Medium"


    public enum FontScale: String, CFFontDescriptor {
	case display = "Display"
	case title = "Title"
	case subTitle = "SubTitle"
	case body = "Body"
	case caption2 = "Caption2"
	case largeTitle = "LargeTitle"
	case title2 = "Title2"
	case title3 = "Title3"
	case headline = "Headline"
	case caption = "Caption"
    
        var fontWeight: Pretendard {
            switch self {
	    case .display:
		.bold
	    case .title:
		.bold
	    case .subTitle:
		.semiBold
	    case .body:
		.regular
	    case .caption2:
		.medium
	    case .largeTitle:
		.bold
	    case .title2:
		.semiBold
	    case .title3:
		.medium
	    case .headline:
		.medium
	    case .caption:
		.medium
            }
        }
    
        var fontSize: CGFloat {
            switch self {
	    case .display:
		36.0
	    case .title:
		24.0
	    case .subTitle:
		18.0
	    case .body:
		14.0
	    case .caption2:
		10.0
	    case .largeTitle:
		32.0
	    case .title2:
		22.0
	    case .title3:
		20.0
	    case .headline:
		16.0
	    case .caption:
		12.0
            }
        }
    
        var lineHeight: CGFloat {
            switch self {
	    case .display:
		54.0
	    case .title:
		36.0
	    case .subTitle:
		27.0
	    case .body:
		21.0
	    case .caption2:
		15.0
	    case .largeTitle:
		48.0
	    case .title2:
		33.0
	    case .title3:
		30.0
	    case .headline:
		24.0
	    case .caption:
		18.0
            }
        }
    
        var letterSpacing: CGFloat {
            switch self {
	    case .display:
		0.0
	    case .title:
		0.0
	    case .subTitle:
		0.0
	    case .body:
		0.0
	    case .caption2:
		0.0
	    case .largeTitle:
		0.0
	    case .title2:
		0.0
	    case .title3:
		0.0
	    case .headline:
		0.0
	    case .caption:
		0.0
            }
        }
    
        var relativeTo: Font.TextStyle {
            switch self {
	    case .display:
		.body
	    case .title:
		.body
	    case .subTitle:
		.body
	    case .body:
		.body
	    case .caption2:
		.body
	    case .largeTitle:
		.body
	    case .title2:
		.body
	    case .title3:
		.body
	    case .headline:
		.body
	    case .caption:
		.body
            }
        }
    }
}

