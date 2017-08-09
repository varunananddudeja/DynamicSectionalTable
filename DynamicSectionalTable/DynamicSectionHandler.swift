//
//  DynamicSectionHandler.swift
//  DynamicSectionalTable
//
//  Created by Varun Dudeja on 09/08/17.
//  Copyright © 2017 Varun Dudeja. All rights reserved.
//

import Foundation
import UIKit

class DynamicSectionHandler: NSObject {
    
    fileprivate var sections: [Section]!
    
    init(sections: [Section]) {
        self.sections = sections
    }
}

extension DynamicSectionHandler: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].rowsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return sections[indexPath.section].getCell(tableView: tableView, indexPath: indexPath)
    }
}

extension DynamicSectionHandler: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].sectionHeader
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        sections[indexPath.section].rowAction(tableView, indexPath)
    }
}
