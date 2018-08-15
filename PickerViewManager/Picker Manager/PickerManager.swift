//
//  PickerDataSource.swift
//  Nioxin
//
//  Created by Sergey on 16.06.17.
//  Copyright © 2017 grossum solutions. All rights reserved.
//

import UIKit

public protocol PickerRow {
    
    var title: String? { get }
    var attributedTitle: NSAttributedString? { get }
    
}

open class PickerComponentObject: NSObject {
    
    public var items: [PickerRow] = [PickerRow]()
    
    public init(items: [PickerRow]) {
        self.items = items
    }
    
}

open class PickerRowObject: NSObject, PickerRow {

    public private(set) var title: String?
    public private(set) var attributedTitle: NSAttributedString?

    public init(title: String? = nil,
         attributedTitle: NSAttributedString? = nil) {
        self.title = title
        self.attributedTitle = attributedTitle
    }
    
}

open class PickerDataSourceConfigurator {

    public var components: [PickerComponentObject] = [PickerComponentObject]()

    public init(components: [PickerComponentObject]) {
        self.components = components
    }
    
}

public typealias PickerManagerSelectionHandler = (PickerRow, _ component: Int, _ row: Int) -> Void
public typealias PickerManagerSelectionSettingHandler = ([IndexPath]) -> Void

open class PickerManager: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {

    private var configuration: PickerDataSourceConfigurator!
    private var handler: PickerManagerSelectionHandler?
    
    public private(set) var selectedIndexes = [IndexPath]()
    
    public var selectionSettingHandler: PickerManagerSelectionSettingHandler?
    
    public init(configuration: PickerDataSourceConfigurator,
                selectionHandler: PickerManagerSelectionHandler? = nil) {
        self.configuration = configuration
        self.handler = selectionHandler
    }
    
    // MARK: - Setter -
    
    public func set(selectedIndexes: [IndexPath]) {
        self.selectedIndexes = selectedIndexes
        selectionSettingHandler?(selectedIndexes)
    }
    
    // MARK: - UIPickerViewDataSource -
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return configuration.components.count
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return configuration.components[component].items.count
    }
    
    // MARK: - UIPickerViewDelegate -
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard itemExistsIn(component: component, at: row) else { return nil }
        return configuration.components[component].items[row].title
    }

    public func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        guard itemExistsIn(component: component, at: row) else { return nil }
        return configuration.components[component].items[row].attributedTitle
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard itemExistsIn(component: component, at: row) else { return }
        let rowObject = configuration.components[component].items[row]
        let selectedIndex = IndexPath(row: row, section: component)
        if let indexPath = selectedIndexes.first(where: { $0.section == component }), let index = selectedIndexes.index(of: indexPath) {
            selectedIndexes[index] = selectedIndex
        } else {
            selectedIndexes.append(selectedIndex)
        }
        handler?(rowObject, component, row)
    }
    
    // MARK: - Private -
    
    private func itemExistsIn(component: Int, at row: Int) -> Bool {
        guard configuration.components.indices.contains(component),
            configuration.components[component].items.indices.contains(row) else { return false }
        return true
    }
    
}
