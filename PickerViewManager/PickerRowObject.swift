//
//  PickerRowObject.swift
//  SKPickerViewManager
//
//  Created by Sergey Kostyan on 02.09.2018.
//

import Foundation

public struct PickerRowObject: PickerRow {
    
    public let title: String?
    public let attributedTitle: NSAttributedString?
    
    public init(title: String? = nil, attributedTitle: NSAttributedString? = nil) {
        self.title = title
        self.attributedTitle = attributedTitle
    }
    
}
