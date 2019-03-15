//
//  IngredientCellViewModel.swift
//  Chefling
//
//  Created by Akhila Haridas on 15/03/19.
//  Copyright © 2019 Akhila Haridas. All rights reserved.
//

import Foundation

class IngredientCellViewModel{
    let inpantry: Bool
    let description: String
    let foodname: String
    
    init(ingredient: Ingredient) {
        self.inpantry = ingredient.inpantry
        self.description = ingredient.description
        self.foodname = ingredient.foodname
    }
}


