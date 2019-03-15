//
//  RecipeFooterView.swift
//  Chefling
//
//  Created by Akhila Haridas on 15/03/19.
//  Copyright © 2019 Akhila Haridas. All rights reserved.
//

import UIKit

class RecipeFooterView: UIView {
    @IBOutlet weak var containerView: UIView?
    @IBOutlet weak var lblName: UILabel?
    @IBOutlet weak var btnAdd: UIButton?
    @IBOutlet weak var greyView: UIView?
    @IBOutlet weak var borderLabel: UILabel?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("RecipeFooterView", owner: self, options: nil)
        addSubview(containerView!)
        containerView?.frame = self.bounds
        containerView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        Utils.setViewCornerRadius(view: btnAdd)
        Utils.setViewCornerRadius(view: greyView)
        btnAdd?.tintColor = UIColor.lightGreenColor()
        Utils.setViewBorderColor(view: btnAdd, color: UIColor.lightGreenColor())
}
}
