//
//  String+Extension.swift
//  SwiftExtension
//
//  Created by nguyen.manh.tuanb on 12/02/2019.
//  Copyright © 2019 nguyen.manh.tuanb. All rights reserved.
//

import UIKit

public extension String {
    
    func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, value: "**\(self)**", comment: "")
    }
    
    func fromBase64() -> String? {
        guard let data = Data(base64Encoded: self) else {
            return nil
        }
        return String(data: data, encoding: .utf8)
    }
    
    func toBase64() -> String {
        return Data(self.utf8).base64EncodedString()
    }
    
    func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect,
                                            options: .usesLineFragmentOrigin,
                                            attributes: [NSAttributedString.Key.font: font],
                                            context: nil)
        return boundingBox.height
    }
    
    func toAttributeString(font: UIFont?,
                           textColor: UIColor = .white,
                           spaceLine: CGFloat = 0.0,
                           spaceCharacter: CGFloat = 0.0,
                           range: NSRange? = nil,
                           alignment: NSTextAlignment = .left,
                           lineBreakMode: NSLineBreakMode? = nil) -> NSAttributedString? {
        
        let multipletAttribute = [NSAttributedString.Key.font: font as Any,
                                  NSAttributedString.Key.foregroundColor: textColor,
                                  NSAttributedString.Key.kern: spaceCharacter] as [NSAttributedString.Key: Any]
        
        let descAttributeText = NSMutableAttributedString(string: self, attributes: multipletAttribute)
        
        let paragraphStype = NSMutableParagraphStyle()
        paragraphStype.lineSpacing = spaceLine
        paragraphStype.alignment = alignment
        if let lineBreakMode = lineBreakMode {
            paragraphStype.lineBreakMode = lineBreakMode
        }
        descAttributeText.addAttribute(NSAttributedString.Key.paragraphStyle,
                                       value: paragraphStype,
                                       range: range ?? NSRange(location: 0, length: descAttributeText.length))
        return descAttributeText
    }
    
    func underLineAtrribute() -> NSAttributedString {
        let attributes = NSMutableAttributedString(string: self)
        let underLineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
        attributes.addAttributes(underLineAttribute, range: NSRange(location: 0, length: self.count))
        return attributes
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let query = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return query.evaluate(with: self)
    }
    
    func ranges(of substring: String, options: CompareOptions = [], locale: Locale? = nil) -> [Range<Index>] {
        var ranges: [Range<Index>] = []
        while let range = self.range(of: substring,
                                     options: options,
                                     range: (ranges.last?.upperBound ?? self.startIndex)..<self.endIndex,
                                     locale: locale) { ranges.append(range) }
        return ranges
    }
   
    func nsRange(from range: Range<String.Index>) -> NSRange? {
        guard let from = range.lowerBound.samePosition(in: utf16) else { return nil }
        guard let to = range.upperBound.samePosition(in: utf16) else { return nil }
        return NSRange(location: utf16.distance(from: utf16.startIndex, to: from),
                       length: utf16.distance(from: from, to: to))
    }
    
    func toDate(format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)
        return date
    }
    
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
}
