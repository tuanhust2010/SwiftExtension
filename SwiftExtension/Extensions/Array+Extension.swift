//
//  Array+Extension.swift
//  SwiftExtension
//
//  Created by nguyen.manh.tuanb on 12/02/2019.
//  Copyright © 2019 nguyen.manh.tuanb. All rights reserved.
//

import Foundation

extension Array where Element: Hashable {
    func difference(with other: [Element]) -> [Element] {
        let thisSet = Set(self)
        let otherSet = Set(other)
        return Array(thisSet.symmetricDifference(otherSet))
    }
}
