//
//  PickerDataSourceConfigurable.swift
//  SKPickerViewManager
//
//  Created by Sergey Kostyan on 02.09.2018.
//

import Foundation

public protocol PickerDataSourceConfigurable {
    
    var components: [PickerComponent] { get }
    
    func numberOfComponents() -> Int
    func numberOfItems(inComponent component: Int) -> Int
    func item(atIndex index: Int, inComponent component: Int) -> PickerRow?
    
}

public extension PickerDataSourceConfigurable {
    
    func numberOfComponents() -> Int {
        return components.count
    }
    
    func numberOfItems(inComponent component: Int) -> Int {
        guard components.indices.contains(component) else { return 0 }
        return components[component].numberOfItems()
    }
    
    func item(atIndex index: Int, inComponent component: Int) -> PickerRow? {
        guard components.indices.contains(component) else { return nil }
        return components[component].item(atIndex: index)
    }
    
}
