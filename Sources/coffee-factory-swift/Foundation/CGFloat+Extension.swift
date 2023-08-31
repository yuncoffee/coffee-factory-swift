//
//  File.swift
//  
//
//  Created by Yun Dongbeom on 2023/08/31.
//

import Foundation

public protocol SpacingSize {
    static var spacing100: CGFloat { get }
    static var spacing800: CGFloat { get }
}

public extension SpacingSize {
    static var spacing100: CGFloat{
            20.0
    }
    static var spacing800: CGFloat{
            60.0
    }
}

extension CGFloat: SpacingSize {}
