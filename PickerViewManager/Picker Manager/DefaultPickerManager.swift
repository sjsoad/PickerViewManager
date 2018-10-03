//
//  PickerDataSource.swift
//  Nioxin
//
//  Created by Sergey on 16.06.17.
//  Copyright © 2017 grossum solutions. All rights reserved.
//

import UIKit

open class DefaultPickerManager: NSObject, PickerManager {

    private let configuration: PickerDataSourceConfigurable
    private let handler: PickerManagerSelectionHandler?
    
    open var selectedIndexes = [IndexPath]()
    
    public init(configuration: PickerDataSourceConfigurable, selectionHandler: PickerManagerSelectionHandler? = nil) {
        self.configuration = configuration
        self.handler = selectionHandler
    }
    
    // MARK: - UIPickerViewDataSource -
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return configuration.numberOfComponents()
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return configuration.numberOfItems(inComponent: component)
    }
    
    // MARK: - UIPickerViewDelegate -
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return configuration.item(atIndex: row, inComponent: component)?.title
    }

    public func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        return configuration.item(atIndex: row, inComponent: component)?.attributedTitle
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard let rowObject = configuration.item(atIndex: row, inComponent: component) else { return }
        let selectedIndex = IndexPath(row: row, section: component)
        if let indexPath = selectedIndexes.first(where: { $0.section == component }), let index = selectedIndexes.index(of: indexPath) {
            selectedIndexes[index] = selectedIndex
        } else {
            selectedIndexes.append(selectedIndex)
        }
        handler?(rowObject, component, row)
    }
    
}
