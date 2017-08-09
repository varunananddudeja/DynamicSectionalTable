//
//  DynamicSectionBase.swift
//  DynamicSectionalTable
//
//  Created by Varun Dudeja on 09/08/17.
//  Copyright © 2017 Varun Dudeja. All rights reserved.
//

import Foundation
import UIKit

protocol BaseCell {
    associatedtype R
    func configureCell(viewModel: R)
}

protocol Section {
    
    var sectionHeader: String {get}
    var rowsCount: Int {get}
    func getCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
    var rowAction: (UITableView,IndexPath) -> () {get}
}

class BaseSection<T,S: UITableViewCell> where S: BaseCell, S.R == T {
    
    var list: [T]
    var id: String
    var rowBaseAction: (UITableView,IndexPath) -> ()
    
    init(list: [T], id: String, rowBaseAction: @escaping (UITableView,IndexPath) -> ()) {
        self.list = list
        self.id = id
        self.rowBaseAction = rowBaseAction
    }
    
    func getCellFromBase(table: UITableView, path: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: id, for: path) as! S
        cell.configureCell(viewModel: list[path.row])
        return cell
    }
    
}
