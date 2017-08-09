//
//  ViewController.swift
//  DynamicSectionalTable
//
//  Created by Varun Dudeja on 09/08/17.
//  Copyright © 2017 Varun Dudeja. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableViewObj: UITableView!
    
    let educationNibStr = "EducationCell"
    let workNibStr = "WorkCell"
    var handler: DynamicSectionHandler!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeTable()
        setHandler(sections: getRandomSections())
    }
    
    func initializeTable() {
        let nib1 = UINib(nibName: educationNibStr, bundle: nil)
        let nib2 = UINib(nibName: workNibStr, bundle: nil)
        tableViewObj.register(nib1, forCellReuseIdentifier: educationNibStr)
        tableViewObj.register(nib2, forCellReuseIdentifier: workNibStr)
        tableViewObj.rowHeight = UITableViewAutomaticDimension
        tableViewObj.estimatedRowHeight = 44
    }
    
    func getRandomSections() -> [Section] {
        
        // education section
        let education1 = Education(className: "10th", marks: "91", schoolName: "DAV")
        let education2 = Education(className: "12th", marks: "87", schoolName: "MVN")
        let list1 = [education1, education2]
        
        let educSec = EducationSection(list: list1, id: educationNibStr) { (tableView, indexPath) in
            print(list1[indexPath.row].schoolName)
        }
        
        // work section
        let work1 = Work(officeName: "innovationm", designation: "ios developer")
        let list2 = [work1]
        let workSec = WorkSection(list: list2, id: workNibStr) { (tableView, indexPath) in
            print(list2[indexPath.row].officeName)
        }
        
        return Int(arc4random_uniform(2)) == 0 ? [educSec, workSec] : [workSec, educSec]
    }
    
    func setHandler(sections: [Section]) {
        handler = DynamicSectionHandler(sections: sections)
        tableViewObj.dataSource = handler
        tableViewObj.delegate = handler
        tableViewObj.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


class EducationSection: BaseSection<Education,EducationCell>, Section {
    
    var sectionHeader: String = "School Life"
    
    lazy var rowsCount: Int = self.list.count
    
    func getCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        return getCellFromBase(table: tableView, path: indexPath)
    }
    
    var rowAction: (UITableView, IndexPath) -> () {
        return rowBaseAction
    }
}

class WorkSection: BaseSection<Work,WorkCell>, Section {
    
    var sectionHeader: String = "Work Life"
    
    lazy var rowsCount: Int = self.list.count
    
    func getCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        return getCellFromBase(table: tableView, path: indexPath)
    }
    
    var rowAction: (UITableView, IndexPath) -> () {
        return rowBaseAction
    }

}

