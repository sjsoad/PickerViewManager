//
//  PickerDataSourceConfigurator.swift
//  SKPickerViewManager
//
//  Created by Sergey Kostyan on 02.09.2018.
//

import Foundation

public struct PickerDataSourceConfigurator: PickerDataSourceConfigurable {
    
    public let components: [PickerComponent]
    
    public init(components: [PickerComponent]) {
        self.components = components
    }
    
}
