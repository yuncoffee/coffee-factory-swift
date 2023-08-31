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
//
//extension SpacingSize {
//    static var spacing100: CGFloat {
//        40.0
//    }
//}

public extension SpacingSize {
    static var spacing100: CGFloat{
            20.0
    }
}
