//
//  WorkCell.swift
//  DynamicSectionalTable
//
//  Created by Varun Dudeja on 09/08/17.
//  Copyright © 2017 Varun Dudeja. All rights reserved.
//

import UIKit

class WorkCell: UITableViewCell {

    @IBOutlet weak var labelOffice: UILabel!
    @IBOutlet weak var labelDesignation: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension WorkCell: BaseCell {
    
    func configureCell(viewModel: Work) {
        self.labelOffice.text = viewModel.officeName
        self.labelDesignation.text = viewModel.designation
    }
}
