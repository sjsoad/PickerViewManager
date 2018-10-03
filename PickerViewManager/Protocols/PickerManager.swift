//
//  PickerManager.swift
//  AERecord
//
//  Created by Sergey Kostyan on 02.09.2018.
//

import Foundation

public protocol PickerManager: UIPickerViewDataSource, UIPickerViewDelegate {
    
    var selectedIndexes: [IndexPath] { get set }
    
}
