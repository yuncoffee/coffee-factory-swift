//
//  File.swift
//  
//
//  Created by Yun Dongbeom on 2023/08/31.
//

import Foundation

public protocol SpacingSize {
    static var spacing100: CGFloat { get }
    static var spacing400: CGFloat { get }
    static var spacing500: CGFloat { get }
    static var spacing700: CGFloat { get }
    static var spacing800: CGFloat { get }
}

extension CGFloat: SpacingSize {
    public static var spacing100: CGFloat {
        20.0
    }
    
    public static var spacing400: CGFloat {
        40.0
    }
    
    public static var spacing500: CGFloat {
        60.0
    }
    
    public static var spacing700: CGFloat {
        80.0
    }
    
    public static var spacing800: CGFloat {
        120.0
    }
}
