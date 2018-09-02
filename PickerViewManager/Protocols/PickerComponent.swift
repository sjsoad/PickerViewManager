//
//  PickerComponent.swift
//  SKPickerViewManager
//
//  Created by Sergey Kostyan on 02.09.2018.
//

import Foundation

public protocol PickerComponent {
    
    var items: [PickerRow] { get }
    func numberOfItems() -> Int
    func item(atIndex index: Int) -> PickerRow?
}

public extension PickerComponent {
    
    func numberOfItems() -> Int {
        return items.count
    }
    
    func item(atIndex index: Int) -> PickerRow? {
        guard items.indices.contains(index) else { return nil }
        return items[index]
    }
    
}
