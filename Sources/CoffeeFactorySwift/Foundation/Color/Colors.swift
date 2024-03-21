

//
//	color.swift
//	Coffee Factory
//
//	Created by YunCoffee on 2024. 1. 22.
//

import Foundation
import SwiftUI

public extension Color {
    // 구조체(폴더 기반) 생성
    // 구조체의 멤버 변수로 색상 넣기
    // 색상 raw이름을 이름으로 가져가야할듯
    static func cf(_ name: CFColor) -> Color {
        name.color
    }
}

public enum CFColor {
	case utils(CFUtils)
	case shadow(CFShadow)
	case colorScale(CFColorScale)
	case primaryScale(CFPrimaryScale)
	case grayScale(CFGrayScale)

    public var color: Color {
        switch self {
		case .utils(let cfColor):
			Color(cfColor.rawValue, bundle: Bundle.module)
		case .shadow(let cfColor):
			Color(cfColor.rawValue, bundle: Bundle.module)
		case .colorScale(let cfColor):
			Color(cfColor.rawValue, bundle: Bundle.module)
		case .primaryScale(let cfColor):
			Color(cfColor.rawValue, bundle: Bundle.module)
		case .grayScale(let cfColor):
			Color(cfColor.rawValue, bundle: Bundle.module)

        }
    }
    
    // MARK: 수정하기..
    public func nextColor(after count: Int = 1) -> Color {
        switch self {
        case .utils(let cfUtils):
            guard let index = CFUtils.allCases.firstIndex(of: cfUtils) else { return Color(cfUtils.rawValue, bundle: Bundle.module) }
            let nextIndex = index + count
            if nextIndex < CFUtils.allCases.count {
                return Color(CFUtils.allCases[nextIndex].rawValue, bundle: Bundle.module)
            }
            return Color(cfUtils.rawValue, bundle: Bundle.module)
        case .shadow(let cfShadow):
            guard let index = CFShadow.allCases.firstIndex(of: cfShadow) else { return Color(cfShadow.rawValue, bundle: Bundle.module) }
            let nextIndex = index + count
            if nextIndex < CFShadow.allCases.count {
                return Color(CFShadow.allCases[nextIndex].rawValue, bundle: Bundle.module)
            }
            return Color(cfShadow.rawValue, bundle: Bundle.module)
        case .colorScale(let cfColorScale):
            let colorArray = cfColorScale.allCases
            guard let index = colorArray.firstIndex(of: cfColorScale.rawValue) else { return Color(cfColorScale.rawValue, bundle: Bundle.module) }
            let nextIndex = index + count
            if nextIndex < colorArray.count {
                return Color(colorArray[nextIndex], bundle: Bundle.module)
            }
            return Color(cfColorScale.rawValue, bundle: Bundle.module)
        case .primaryScale(let cfPrimaryScale):
            let colorArray = cfPrimaryScale.allCases
            guard let index = colorArray.firstIndex(of: cfPrimaryScale.rawValue) else { return Color(cfPrimaryScale.rawValue, bundle: Bundle.module) }
            let nextIndex = index + count
            if nextIndex < colorArray.count {
                return Color(colorArray[nextIndex], bundle: Bundle.module)
            }
            return Color(cfPrimaryScale.rawValue, bundle: Bundle.module)
        case .grayScale(let cfGrayScale):
            guard let index = CFGrayScale.allCases.firstIndex(of: cfGrayScale) else { return Color(cfGrayScale.rawValue, bundle: Bundle.module) }
            let nextIndex = index + count
            if nextIndex < CFGrayScale.allCases.count {
                return Color(CFGrayScale.allCases[nextIndex].rawValue, bundle: Bundle.module)
            }
            return Color(cfGrayScale.rawValue, bundle: Bundle.module)
        }
    }
    
    private func changeColor<T: CaseIterable & RawRepresentable & Equatable>(for value: T) -> Color where T.RawValue == String {
        guard let index = T.allCases.firstIndex(of: value) else { return Color(value.rawValue, bundle: Bundle.module) }
        let nextIndex = index as! Int + 1
        if nextIndex < T.allCases.count {
            return Color(T.allCases[nextIndex as! T.AllCases.Index].rawValue, bundle: Bundle.module)
        }
        return Color(value.rawValue, bundle: Bundle.module)
    }
}



public enum CFColorScale {
	case yellow(CFColorScaleYellow)
	case navy(CFColorScaleNavy)
	case red(CFColorScaleRed)
	case blue(CFColorScaleBlue)
	case green(CFColorScaleGreen)
	case lightGreen(CFColorScaleLightGreen)
	case orange(CFColorScaleOrange)
	case lavendar(CFColorScaleLavendar)
	case violet(CFColorScaleViolet)
	case pink(CFColorScalePink)
	case scalet(CFColorScaleScalet)
	case teal(CFColorScaleTeal)
	case deepBlue(CFColorScaleDeepBlue)
	case purple(CFColorScalePurple)

	var rawValue: String {
    switch self {
	case .yellow(let cfColor):
		cfColor.rawValue
	case .navy(let cfColor):
		cfColor.rawValue
	case .red(let cfColor):
		cfColor.rawValue
	case .blue(let cfColor):
		cfColor.rawValue
	case .green(let cfColor):
		cfColor.rawValue
	case .lightGreen(let cfColor):
		cfColor.rawValue
	case .orange(let cfColor):
		cfColor.rawValue
	case .lavendar(let cfColor):
		cfColor.rawValue
	case .violet(let cfColor):
		cfColor.rawValue
	case .pink(let cfColor):
		cfColor.rawValue
	case .scalet(let cfColor):
		cfColor.rawValue
	case .teal(let cfColor):
		cfColor.rawValue
	case .deepBlue(let cfColor):
		cfColor.rawValue
	case .purple(let cfColor):
		cfColor.rawValue
    	}
	}

    var allCases: [String] {
        switch self {
        case .yellow(let cfColor):
            CFColorScaleYellow.allCases.map { $0.rawValue }
        case .navy(let cfColor):
            CFColorScaleNavy.allCases.map { $0.rawValue }
        case .red(let cfColor):
            CFColorScaleRed.allCases.map { $0.rawValue }
        case .blue(let cfColor):
            CFColorScaleBlue.allCases.map { $0.rawValue }
        case .green(let cfColor):
            CFColorScaleGreen.allCases.map { $0.rawValue }
        case .lightGreen(let cfColor):
            CFColorScaleLightGreen.allCases.map { $0.rawValue }
        case .orange(let cfColor):
            CFColorScaleOrange.allCases.map { $0.rawValue }
        case .lavendar(let cfColor):
            CFColorScaleLavendar.allCases.map { $0.rawValue }
        case .violet(let cfColor):
            CFColorScaleViolet.allCases.map { $0.rawValue }
        case .pink(let cfColor):
            CFColorScalePink.allCases.map { $0.rawValue }
        case .scalet(let cfColor):
            CFColorScaleScalet.allCases.map { $0.rawValue }
        case .teal(let cfColor):
            CFColorScaleTeal.allCases.map { $0.rawValue }
        case .deepBlue(let cfColor):
            CFColorScaleDeepBlue.allCases.map { $0.rawValue }
        case .purple(let cfColor):
            CFColorScalePurple.allCases.map { $0.rawValue }
        }
    }
}

public enum CFPrimaryScale {
	case secondary(CFPrimaryScaleSecondary)
	case primary(CFPrimaryScalePrimary)
	case tertiary(CFPrimaryScaleTertiary)

	var rawValue: String {
    switch self {
	case .secondary(let cfColor):
		cfColor.rawValue
	case .primary(let cfColor):
		cfColor.rawValue
	case .tertiary(let cfColor):
		cfColor.rawValue
    	}
	}
    
    var allCases: [String] {
        switch self {
        case .secondary(let cFPrimaryScaleSecondary):
            CFPrimaryScaleSecondary.allCases.map { $0.rawValue }
        case .primary(let cFPrimaryScalePrimary):
            CFPrimaryScalePrimary.allCases.map { $0.rawValue }
        case .tertiary(let cFPrimaryScaleTertiary):
            CFPrimaryScaleTertiary.allCases.map { $0.rawValue }
        }
    }

}


public enum CFColorScaleYellow: String, CaseIterable {
	case lightness = "colorScaleYellowLightness"
	case lighter = "colorScaleYellowLighter"
	case light = "colorScaleYellowLight"
	case base = "colorScaleYellowBase"
	case dark = "colorScaleYellowDark"
	case darker = "colorScaleYellowDarker"
	case darkness = "colorScaleYellowDarkness"

}

public enum CFColorScaleNavy: String, CaseIterable {
	case lightness = "colorScaleNavyLightness"
	case lighter = "colorScaleNavyLighter"
	case light = "colorScaleNavyLight"
	case base = "colorScaleNavyBase"
	case dark = "colorScaleNavyDark"
	case darker = "colorScaleNavyDarker"
	case darkness = "colorScaleNavyDarkness"

}

public enum CFGrayScale: String, CaseIterable {
	case white = "grayScale0White"
	case gray100 = "grayScale100"
	case gray200 = "grayScale200"
	case gray300 = "grayScale300"
	case gray400 = "grayScale400"
	case gray500 = "grayScale500"
	case gray600 = "grayScale600"
	case gray700 = "grayScale700"
	case gray800 = "grayScale800"
	case gray900 = "grayScale900"
	case black = "grayScale1000Black"

}
public enum CFPrimaryScaleSecondary: String, CaseIterable {
	case lightness = "primaryScaleSecondaryLightness"
	case lighter = "primaryScaleSecondaryLighter"
	case light = "primaryScaleSecondaryLight"
	case base = "primaryScaleSecondaryBase"
	case dark = "primaryScaleSecondaryDark"
	case darker = "primaryScaleSecondaryDarker"
	case darkness = "primaryScaleSecondaryDarkness"

}

public enum CFColorScaleRed: String, CaseIterable {
	case lightness = "colorScaleRedLightness"
	case lighter = "colorScaleRedLighter"
	case light = "colorScaleRedLight"
	case base = "colorScaleRedBase"
	case dark = "colorScaleRedDark"
	case darker = "colorScaleRedDarker"
	case darkness = "colorScaleRedDarkness"

}

public enum CFColorScaleBlue: String, CaseIterable {
	case lightness = "colorScaleBlueLightness"
	case lighter = "colorScaleBlueLighter"
	case light = "colorScaleBlueLight"
	case base = "colorScaleBlueBase"
	case dark = "colorScaleBlueDark"
	case darker = "colorScaleBlueDarker"
	case darkness = "colorScaleBlueDarkness"

}

public enum CFUtils: String, CaseIterable {
	case clear = "utilsClear"

}

public enum CFColorScaleGreen: String, CaseIterable {
	case lightness = "colorScaleGreenLightness"
	case lighter = "colorScaleGreenLighter"
	case light = "colorScaleGreenLight"
	case base = "colorScaleGreenBase"
	case dark = "colorScaleGreenDark"
	case darker = "colorScaleGreenDarker"
	case darkness = "colorScaleGreenDarkness"

}

public enum CFColorScaleLightGreen: String, CaseIterable {
	case lightness = "colorScaleLightGreenLightness"
	case lighter = "colorScaleLightGreenLighter"
	case light = "colorScaleLightGreenLight"
	case base = "colorScaleLightGreenBase"
	case dark = "colorScaleLightGreenDark"
	case darker = "colorScaleLightGreenDarker"
	case darkness = "colorScaleLightGreenDarkness"

}

public enum CFColorScaleOrange: String, CaseIterable {
	case lightness = "colorScaleOrangeLightness"
	case lighter = "colorScaleOrangeLighter"
	case light = "colorScaleOrangeLight"
	case base = "colorScaleOrangeBase"
	case dark = "colorScaleOrangeDark"
	case darker = "colorScaleOrangeDarker"
	case darkness = "colorScaleOrangeDarkness"

}

public enum CFColorScaleLavendar: String, CaseIterable {
	case lightness = "colorScaleLavendarLightness"
	case lighter = "colorScaleLavendarLighter"
	case light = "colorScaleLavendarLight"
	case base = "colorScaleLavendarBase"
	case dark = "colorScaleLavendarDark"
	case darker = "colorScaleLavendarDarker"
	case darkness = "colorScaleLavendarDarkness"

}

public enum CFColorScaleViolet: String, CaseIterable {
	case lightness = "colorScaleVioletLightness"
	case lighter = "colorScaleVioletLighter"
	case light = "colorScaleVioletLight"
	case base = "colorScaleVioletBase"
	case dark = "colorScaleVioletDark"
	case darker = "colorScaleVioletDarker"
	case darkness = "colorScaleVioletDarkness"

}

public enum CFColorScalePink: String, CaseIterable {
	case lightness = "colorScalePinkLightness"
	case lighter = "colorScalePinkLighter"
	case light = "colorScalePinkLight"
	case base = "colorScalePinkBase"
	case dark = "colorScalePinkDark"
	case darker = "colorScalePinkDarker"
	case darkness = "colorScalePinkDarkness"

}

public enum CFColorScaleScalet: String, CaseIterable {
	case lightness = "colorScaleScaletLightness"
	case lighter = "colorScaleScaletLighter"
	case light = "colorScaleScaletLight"
	case base = "colorScaleScaletBase"
	case dark = "colorScaleScaletDark"
	case darker = "colorScaleScaletDarker"
	case darkness = "colorScaleScaletDarkness"

}

public enum CFColorScaleTeal: String, CaseIterable {
	case lightness = "colorScaleTealLightness"
	case lighter = "colorScaleTealLighter"
	case light = "colorScaleTealLight"
	case base = "colorScaleTealBase"
	case dark = "colorScaleTealDark"
	case darker = "colorScaleTealDarker"
	case darkness = "colorScaleTealDarkness"

}

public enum CFPrimaryScalePrimary: String, CaseIterable {
	case lightness = "primaryScalePrimaryLightness"
	case lighter = "primaryScalePrimaryLighter"
	case light = "primaryScalePrimaryLight"
	case base = "primaryScalePrimaryBase"
	case dark = "primaryScalePrimaryDark"
	case darker = "primaryScalePrimaryDarker"
	case darkness = "primaryScalePrimaryDarkness"

}

public enum CFColorScaleDeepBlue: String, CaseIterable {
	case lightness = "colorScaleDeepBlueLightness"
	case lighter = "colorScaleDeepBlueLighter"
	case light = "colorScaleDeepBlueLight"
	case base = "colorScaleDeepBlueBase"
	case dark = "colorScaleDeepBlueDark"
	case darker = "colorScaleDeepBlueDarker"
	case darkness = "colorScaleDeepBlueDarkness"

}

public enum CFColorScalePurple: String, CaseIterable {
	case lightness = "colorScalePurpleLightness"
	case lighter = "colorScalePurpleLighter"
	case light = "colorScalePurpleLight"
	case base = "colorScalePurpleBase"
	case dark = "colorScalePurpleDark"
	case darker = "colorScalePurpleDarker"
	case darkness = "colorScalePurpleDarkness"

}

public enum CFShadow: String, CaseIterable {
	case none = "shadowNone"
	case base = "shadowBase"

}

public enum CFPrimaryScaleTertiary: String, CaseIterable {
	case lightness = "primaryScaleTertiaryLightness"
	case lighter = "primaryScaleTertiaryLighter"
	case light = "primaryScaleTertiaryLight"
	case base = "primaryScaleTertiaryBase"
	case dark = "primaryScaleTertiaryDark"
	case darker = "primaryScaleTertiaryDarker"
	case darkness = "primaryScaleTertiaryDarkness"

}


public extension ShapeStyle where Self == Color {
    static func cf(_ name: CFColor) -> Color {
        name.color
    }
}
