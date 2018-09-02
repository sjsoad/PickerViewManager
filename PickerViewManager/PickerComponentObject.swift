//
//  PickerComponentObject.swift
//  SKPickerViewManager
//
//  Created by Sergey Kostyan on 02.09.2018.
//

import Foundation

public struct PickerComponentObject: PickerComponent {
    
    public let items: [PickerRow]
    
    public init(items: [PickerRow]) {
        self.items = items
    }
    
}
