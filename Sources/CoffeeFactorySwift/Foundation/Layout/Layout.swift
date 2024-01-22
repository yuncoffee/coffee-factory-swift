//
//	Layout.swift
//	Coffee Factory
//
//	Created by YunCoffee on 2024. 1. 22.
//
import Foundation

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


