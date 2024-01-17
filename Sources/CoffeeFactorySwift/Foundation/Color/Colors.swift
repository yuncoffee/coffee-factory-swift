

//
//	color.swift
//	Coffee Factory
//
//	Created by YunCoffee on 2024. 1. 17.
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
	case colorScale(CFColorScale)
	case shadow(CFShadow)
	case primaryScale(CFPrimaryScale)
	case utils(CFUtils)
	case grayScale(CFGrayScale)


    var color: Color {
        switch self {
		case .colorScale(let cfColor):
			Color(cfColor.rawValue)
		case .shadow(let cfColor):
			Color(cfColor.rawValue)
		case .primaryScale(let cfColor):
			Color(cfColor.rawValue)
		case .utils(let cfColor):
			Color(cfColor.rawValue)
		case .grayScale(let cfColor):
			Color(cfColor.rawValue)

        }
    }
}

public enum CFColorScale {
	case purple(CFColorScalePurple)
	case blue(CFColorScaleBlue)
	case scalet(CFColorScaleScalet)
	case navy(CFColorScaleNavy)
	case lightGreen(CFColorScaleLightGreen)
	case violet(CFColorScaleViolet)
	case orange(CFColorScaleOrange)
	case deepBlue(CFColorScaleDeepBlue)
	case pink(CFColorScalePink)
	case red(CFColorScaleRed)
	case yellow(CFColorScaleYellow)
	case teal(CFColorScaleTeal)
	case green(CFColorScaleGreen)
	case lavendar(CFColorScaleLavendar)

}

public enum CFPrimaryScale {
	case primary(CFPrimaryScalePrimary)
	case secondary(CFPrimaryScaleSecondary)
	case tertiary(CFPrimaryScaleTertiary)

}


public enum CFColorScalePurple: String {
	case lightness = "colorScalePurpleLightness"
	case lighter = "colorScalePurpleLighter"
	case light = "colorScalePurpleLight"
	case base = "colorScalePurpleBase"
	case dark = "colorScalePurpleDark"
	case darker = "colorScalePurpleDarker"
	case darkness = "colorScalePurpleDarkness"

}

public enum CFPrimaryScalePrimary: String {
	case lightness = "primaryScalePrimaryLightness"
	case lighter = "primaryScalePrimaryLighter"
	case light = "primaryScalePrimaryLight"
	case base = "primaryScalePrimaryBase"
	case dark = "primaryScalePrimaryDark"
	case darker = "primaryScalePrimaryDarker"
	case darkness = "primaryScalePrimaryDarkness"

}

public enum CFColorScaleBlue: String {
	case lightness = "colorScaleBlueLightness"
	case lighter = "colorScaleBlueLighter"
	case light = "colorScaleBlueLight"
	case base = "colorScaleBlueBase"
	case dark = "colorScaleBlueDark"
	case darker = "colorScaleBlueDarker"
	case darkness = "colorScaleBlueDarkness"

}

public enum CFColorScaleScalet: String {
	case lightness = "colorScaleScaletLightness"
	case lighter = "colorScaleScaletLighter"
	case light = "colorScaleScaletLight"
	case base = "colorScaleScaletBase"
	case dark = "colorScaleScaletDark"
	case darker = "colorScaleScaletDarker"
	case darkness = "colorScaleScaletDarkness"

}

public enum CFColorScaleNavy: String {
	case lightness = "colorScaleNavyLightness"
	case lighter = "colorScaleNavyLighter"
	case light = "colorScaleNavyLight"
	case base = "colorScaleNavyBase"
	case dark = "colorScaleNavyDark"
	case darker = "colorScaleNavyDarker"
	case darkness = "colorScaleNavyDarkness"

}

public enum CFColorScaleLightGreen: String {
	case lightness = "colorScaleLightGreenLightness"
	case lighter = "colorScaleLightGreenLighter"
	case light = "colorScaleLightGreenLight"
	case base = "colorScaleLightGreenBase"
	case dark = "colorScaleLightGreenDark"
	case darker = "colorScaleLightGreenDarker"
	case darkness = "colorScaleLightGreenDarkness"

}

public enum CFColorScaleViolet: String {
	case lightness = "colorScaleVioletLightness"
	case lighter = "colorScaleVioletLighter"
	case light = "colorScaleVioletLight"
	case base = "colorScaleVioletBase"
	case dark = "colorScaleVioletDark"
	case darker = "colorScaleVioletDarker"
	case darkness = "colorScaleVioletDarkness"

}

public enum CFPrimaryScaleSecondary: String {
	case lightness = "primaryScaleSecondaryLightness"
	case lighter = "primaryScaleSecondaryLighter"
	case light = "primaryScaleSecondaryLight"
	case base = "primaryScaleSecondaryBase"
	case dark = "primaryScaleSecondaryDark"
	case darker = "primaryScaleSecondaryDarker"
	case darkness = "primaryScaleSecondaryDarkness"

}

public enum CFShadow: String {
	case none = "shadowNone"
	case base = "shadowBase"

}

public enum CFPrimaryScaleTertiary: String {
	case lightness = "primaryScaleTertiaryLightness"
	case lighter = "primaryScaleTertiaryLighter"
	case light = "primaryScaleTertiaryLight"
	case base = "primaryScaleTertiaryBase"
	case dark = "primaryScaleTertiaryDark"
	case darker = "primaryScaleTertiaryDarker"
	case darkness = "primaryScaleTertiaryDarkness"

}

public enum CFColorScaleOrange: String {
	case lightness = "colorScaleOrangeLightness"
	case lighter = "colorScaleOrangeLighter"
	case light = "colorScaleOrangeLight"
	case base = "colorScaleOrangeBase"
	case dark = "colorScaleOrangeDark"
	case darker = "colorScaleOrangeDarker"
	case darkness = "colorScaleOrangeDarkness"

}

public enum CFColorScaleDeepBlue: String {
	case lightness = "colorScaleDeepBlueLightness"
	case lighter = "colorScaleDeepBlueLighter"
	case light = "colorScaleDeepBlueLight"
	case base = "colorScaleDeepBlueBase"
	case dark = "colorScaleDeepBlueDark"
	case darker = "colorScaleDeepBlueDarker"
	case darkness = "colorScaleDeepBlueDarkness"

}

public enum CFColorScalePink: String {
	case lightness = "colorScalePinkLightness"
	case lighter = "colorScalePinkLighter"
	case light = "colorScalePinkLight"
	case base = "colorScalePinkBase"
	case dark = "colorScalePinkDark"
	case darker = "colorScalePinkDarker"
	case darkness = "colorScalePinkDarkness"

}

public enum CFUtils: String {
	case clear = "utilsClear"

}

public enum CFColorScaleRed: String {
	case lightness = "colorScaleRedLightness"
	case lighter = "colorScaleRedLighter"
	case light = "colorScaleRedLight"
	case base = "colorScaleRedBase"
	case dark = "colorScaleRedDark"
	case darker = "colorScaleRedDarker"
	case darkness = "colorScaleRedDarkness"

}

public enum CFColorScaleYellow: String {
	case lightness = "colorScaleYellowLightness"
	case lighter = "colorScaleYellowLighter"
	case light = "colorScaleYellowLight"
	case base = "colorScaleYellowBase"
	case dark = "colorScaleYellowDark"
	case darker = "colorScaleYellowDarker"
	case darkness = "colorScaleYellowDarkness"

}

public enum CFColorScaleTeal: String {
	case lightness = "colorScaleTealLightness"
	case lighter = "colorScaleTealLighter"
	case light = "colorScaleTealLight"
	case base = "colorScaleTealBase"
	case dark = "colorScaleTealDark"
	case darker = "colorScaleTealDarker"
	case darkness = "colorScaleTealDarkness"

}

public enum CFColorScaleGreen: String {
	case lightness = "colorScaleGreenLightness"
	case lighter = "colorScaleGreenLighter"
	case light = "colorScaleGreenLight"
	case base = "colorScaleGreenBase"
	case dark = "colorScaleGreenDark"
	case darker = "colorScaleGreenDarker"
	case darkness = "colorScaleGreenDarkness"

}

public enum CFGrayScale: String {
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
public enum CFColorScaleLavendar: String {
	case lightness = "colorScaleLavendarLightness"
	case lighter = "colorScaleLavendarLighter"
	case light = "colorScaleLavendarLight"
	case base = "colorScaleLavendarBase"
	case dark = "colorScaleLavendarDark"
	case darker = "colorScaleLavendarDarker"
	case darkness = "colorScaleLavendarDarkness"

}


