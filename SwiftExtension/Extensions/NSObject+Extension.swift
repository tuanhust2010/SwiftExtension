//
//  NSObject+Extension.swift
//  SwiftExtension
//
//  Created by nguyen.manh.tuanb on 12/02/2019.
//  Copyright © 2019 nguyen.manh.tuanb. All rights reserved.
//

import Foundation

extension NSObject {
    class var className: String {
        return String(describing: self).components(separatedBy: ".").last!
    }
    var className: String {
        return String(describing: type(of: self)).components(separatedBy: ".").last!
    }
}
