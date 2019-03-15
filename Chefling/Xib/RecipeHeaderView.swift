//
//  RecipeHeaderView.swift
//  Chefling
//
//  Created by Akhila Haridas on 14/03/19.
//  Copyright © 2019 Akhila Haridas. All rights reserved.
//

import UIKit

class RecipeHeaderView: UIView {
    @IBOutlet weak var containerView: UIView?
    @IBOutlet weak var lblName: UILabel?
    @IBOutlet weak var lblChef: UILabel?
    @IBOutlet weak var mainIngredient: UILabel?
    @IBOutlet weak var lblDuration: UILabel?
    @IBOutlet weak var availableIngredients: UILabel?
    @IBOutlet weak var tagView: UIView?
    @IBOutlet weak var chefImageView: UIImageView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("RecipeHeaderView", owner: self, options: nil)
        addSubview(containerView!)
        containerView?.frame = self.bounds
        containerView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    var recipeData: Data? {
        didSet {
            lblName?.text = recipeData?.name
            lblChef?.text = recipeData?.chef.name
            lblDuration?.text = recipeData?.cooktime
            mainIngredient?.text = recipeData?.mainingredients
            availableIngredients?.text = recipeData?.availableingredients
            let url = (recipeData?.chef.websiteurl)! + (recipeData?.chef.imageurl)!
            chefImageView?.sd_setImage(with: URL(string:url), placeholderImage: UIImage(named: "chef"))
            if recipeData?.tags.count ?? 0 > 0 {
                let fixedSpace: CGFloat = 6.0
                var xOrigin: CGFloat = 52.0
                for tag in (recipeData?.tags)! {
                    let label = UILabel(frame: CGRect(x: xOrigin, y: 20, width: 80, height: 25))
                    label.text = tag
                    label.font = label.font.withSize(13)
                    label.textAlignment = .center
                    Utils.setViewCornerRadius(view: label)
                    Utils.setViewBorderColor(view: label, color: UIColor.lightGray)
                    tagView?.addSubview(label)
                    xOrigin += label.frame.size.width + fixedSpace
                }
            }
            
        }
    }
}
