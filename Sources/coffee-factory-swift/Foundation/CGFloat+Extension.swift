//
//  File.swift
//  
//
//  Created by Yun Dongbeom on 2023/08/31.
//

import Foundation

public protocol SpacingSize {
    static var spacing100: CGFloat { get set }
    static var spacing800: CGFloat { get set }
}
//
//extension SpacingSize {
//    static var spacing100: CGFloat {
//        40.0
//    }
//}

extension CGFloat: SpacingSize {
    private static var _spacing100 = 20.0
    private static var _spacing800 = 80.0
    
    public static var spacing100: CGFloat {
        get {
            self._spacing100
        }
        set {
            self._spacing100 = newValue
        }
    }

    public static var spacing800: CGFloat {
        get {
            self._spacing800
        }
        set {
            self._spacing800 = newValue
        }
    }
//
//    public static var spacing100: CGFloat {
//        20.0
//    }
//
//    public static var spacing400: CGFloat {
//        40.0
//    }
//
//    public static var spacing500: CGFloat {
//        60.0
//    }
//
//    public static var spacing700: CGFloat {
//        80.0
//    }
//
//    public static var spacing800: CGFloat {
//        120.0
//    }
}
