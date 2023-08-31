//
//  File.swift
//  
//
//  Created by Yun Dongbeom on 2023/08/31.
//

import Foundation

public extension CGFloat {
    static var spacing100 = 4.0
    static var spacing200 = 8.0
    static var spacing300 = 12.0
    static var spacing600: CGFloat {
        48.0
    }
    static var spacing700: CGFloat {
        64.0
    }
}

public protocol SpacingSize {
    static var spacing100: CGFloat { get }
    static var spacing400: CGFloat { get }
    static var spacing500: CGFloat { get }
    static var spacing700: CGFloat { get }
}

public extension SpacingSize {
    static var spacing100: CGFloat {
        return 4.0
    }
    static var spacing500: CGFloat {
        return 24.0
    }
    static var spacing700: CGFloat {
        return 120.0
    }
}
