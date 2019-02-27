//
//  UIImageView+Extension.swift
//  SwiftExtension
//
//  Created by nguyen.manh.tuanb on 12/02/2019.
//  Copyright © 2019 nguyen.manh.tuanb. All rights reserved.
//

import UIKit

public extension UIImageView {
    func setImageWithText(_ text: String, color: UIColor?, size: CGFloat = 17) {
        let index = text.index(after: text.startIndex)
        let character = String(text.uppercased()[..<index])
        if let color = color {
            self.backgroundColor = color
        }
        guard self.subviews.count == 0 else {
            guard let label = subviews.first as? UILabel else { return }
            label.text = character
            return
        }
        
        let label = UILabel(frame: CGRect(origin: .zero, size: frame.size))
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: size)
        label.text = character
        self.addSubview(label)
    }
}
