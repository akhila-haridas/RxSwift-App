//
//  IngredientsTableViewCell.swift
//  Chefling
//
//  Created by Akhila Haridas on 15/03/19.
//  Copyright © 2019 Akhila Haridas. All rights reserved.
//

import UIKit

class IngredientsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var pantryIcon: UIImageView?
    @IBOutlet weak var lblIngredientName: UILabel?
    @IBOutlet weak var lblDescription: UILabel?
    
    var ingredientViewModel: IngredientCellViewModel? {
        didSet {
            lblIngredientName?.text = ingredientViewModel?.foodname
            lblDescription?.text = ingredientViewModel?.description
            if ingredientViewModel?.inpantry ?? false {
                pantryIcon?.image = UIImage(named: "inPantry")
            } else {
                pantryIcon?.image = UIImage(named: "notInPantry")
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
