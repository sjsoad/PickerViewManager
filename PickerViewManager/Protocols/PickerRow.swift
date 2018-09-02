//
//  PickerRow.swift
//  SKPickerViewManager
//
//  Created by Sergey Kostyan on 02.09.2018.
//

import Foundation

public protocol PickerRow {
    
    var title: String? { get }
    var attributedTitle: NSAttributedString? { get }
    
}
