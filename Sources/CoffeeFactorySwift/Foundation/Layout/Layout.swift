//
//	Layout.swift
//	Coffee Factory
//
//	Created by YunCoffee on 2024. 1. 22.
//
import Foundation
import SwiftUI

public extension CGFloat {
	static func cfRadius(_ scale: CFRadius) -> CGFloat {
		scale.rawValue
	}

	static func cfStroke(_ scale: CFStroke) -> CGFloat {
		scale.rawValue
	}

	static func cfFrame(_ scale: CFFrame) -> CGFloat {
		scale.rawValue
	}

	static func cfSpacing(_ scale: CFSpacing) -> CGFloat {
		scale.rawValue
	}


}

public enum CFRadius: CGFloat {
	case square = 0.0
	case xxxsmall = 2.0
	case xxsmall = 4.0
	case xsmall = 6.0
	case small = 8.0
	case medium = 12.0
	case large = 16.0
	case xlarge = 24.0
	case xxlarge = 32.0
	case xxxlarge = 40.0
	case round = 1000.0
}

public enum CFStroke: CGFloat {
	case xsmall = 1.0
	case small = 2.0
}

public enum CFFrame: CGFloat {
	case xxxsmall = 20.0
	case xxsmall = 24.0
	case xsmall = 28.0
	case small = 32.0
	case medium = 36.0
	case large = 40.0
	case xlarge = 48.0
	case xxlarge = 56.0
	case xxxlarge = 64.0
}

public enum CFSpacing: CGFloat {
	case xxxsmall = 1.0
	case xxsmall = 2.0
	case xsmall = 4.0
	case small = 8.0
	case medium = 10.0
	case large = 12.0
	case xlarge = 16.0
	case xxlarge = 20.0
	case xxxlarge = 24.0
}

public extension View {
    func frame(_ width: CGFloat, ratio: CFAspectRatio, alignment: Alignment = .center) -> some View {
        return frame(width: width, height: ratio.calcSize(from: width).height, alignment: alignment)
    }
}


public extension CGSize {
    static func cfRatio(_ width: CGFloat, ratio: CFAspectRatio) -> CGSize {
        ratio.calcSize(from: width)
    }
}

public enum CFAspectRatio {
    case oneToOne
    case oneToTwo
    case oneToThree
    case oneToFour
    case twoToOne
    case twoToThree
    case twoToFive
    case threeToOne
    case threeToTwo
    case threeToFour
    case threeToFive
    case fourToOne
    case fourToThree
    case fourToFive
    case fiveToTwo
    case fiveToThree
    case fiveToFour
    case nineToSixteen
    case nineToTwentyone
    case nineToThirtytwo
    case tenToSixteen
    case sixteenToNine
    case sixteenToTen
    case twentyoneToNine
    case thirtytwoToNine
    
    func calcSize(from width: CGFloat) -> CGSize {
        switch self {
        case .oneToOne:
            return CGSize(width: width, height: width * 1)
        case .oneToTwo:
            return CGSize(width: width, height: width * 1)
        case .oneToThree:
            return CGSize(width: width, height: width * 3)
        case .oneToFour:
            return CGSize(width: width, height: width * 4)
        case .twoToOne:
            return CGSize(width: width, height: width / 2)
        case .twoToThree:
            return CGSize(width: width, height: width / 2 * 3)
        case .twoToFive:
            return CGSize(width: width, height: width / 2 * 5)
        case .threeToOne:
            return CGSize(width: width, height: width / 3)
        case .threeToTwo:
            return CGSize(width: width, height: width / 3 * 2)
        case .threeToFour:
            return CGSize(width: width, height: width / 3 * 4)
        case .threeToFive:
            return CGSize(width: width, height: width / 3 * 5)
        case .fourToOne:
            return CGSize(width: width, height: width / 4)
        case .fourToThree:
            return CGSize(width: width, height: width / 4 * 3)
        case .fourToFive:
            return CGSize(width: width, height: width / 4 * 5)
        case .fiveToTwo:
            return CGSize(width: width, height: width / 5 * 2)
        case .fiveToThree:
            return CGSize(width: width, height: width / 5 * 3)
        case .fiveToFour:
            return CGSize(width: width, height: width / 5 * 4)
        case .nineToSixteen:
            return CGSize(width: width, height: width / 9 * 16)
        case .nineToTwentyone:
            return CGSize(width: width, height: width / 9 * 21)
        case .nineToThirtytwo:
            return CGSize(width: width, height: width / 9 * 32)
        case .tenToSixteen:
            return CGSize(width: width, height: width / 10 * 16)
        case .sixteenToNine:
            return CGSize(width: width, height: width / 16 * 9)
        case .sixteenToTen:
            return CGSize(width: width, height: width / 16 * 10)
        case .twentyoneToNine:
            return CGSize(width: width, height: width / 21 * 9)
        case .thirtytwoToNine:
            return CGSize(width: width, height: width / 32 * 9)
        }
    }
}
