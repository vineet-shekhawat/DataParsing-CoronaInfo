//
//  CountryWiseCellTableViewCell.swift
//  ConceptCheck
//
//  Created by vineet singh on 13/02/21.
//

import UIKit

class CountryWiseCell: UITableViewCell {

    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var active: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.countryName.text = ""
        self.active.text = ""
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
