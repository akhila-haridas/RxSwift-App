//
//  IngredientsTableViewModel.swift
//  Chefling
//
//  Created by Akhila Haridas on 15/03/19.
//  Copyright © 2019 Akhila Haridas. All rights reserved.
//

import RxSwift
import RxCocoa

class IngredientsTableViewModel {
    
    var ingredientCells = BehaviorRelay<[IngredientCellViewModel]>(value: [])
//    var ingredientCells: Observable<[IngredientCellViewModel]> {
//        return cells.asObservable()
//    }
    private let cells = BehaviorRelay<[IngredientCellViewModel]>(value: [])
    
    var ingredients: [Ingredient]? {
        didSet {
            self.ingredientCells.accept((ingredients?.compactMap({ IngredientCellViewModel(ingredient: $0)
            }))!)
        }
    }
}
