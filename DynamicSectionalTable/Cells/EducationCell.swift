//
//  EducationCell.swift
//  DynamicSectionalTable
//
//  Created by Varun Dudeja on 09/08/17.
//  Copyright © 2017 Varun Dudeja. All rights reserved.
//

import UIKit

class EducationCell: UITableViewCell {
    
    @IBOutlet weak var labelClass: UILabel!
    @IBOutlet weak var labelMarks: UILabel!
    @IBOutlet weak var labelSchool: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension EducationCell: BaseCell {
    
    func configureCell(viewModel: Education) {
        self.labelClass.text = viewModel.className
        self.labelMarks.text = viewModel.marks
        self.labelSchool.text = viewModel.schoolName
    }
}
