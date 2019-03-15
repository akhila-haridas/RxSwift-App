//
//  Models.swift
//  Chefling
//
//  Created by Akhila Haridas on 14/03/19.
//  Copyright © 2019 Akhila Haridas. All rights reserved.
//

import Foundation

struct Ingredient: Codable {
    let inpantry: Bool
    let description: String
    let foodname: String
}

struct Chef: Codable {
    let name: String
    let websiteurl: String
    let chefid: Int
    let imageurl: String
}

struct Image: Codable {
    let url: String
    let source: String
}
struct Data: Codable {
    let availableingredients: String
    let rid: Int
    let ingredients: [Ingredient]
    let cooktime: String
    let name: String
    let mainingredients: String
    let tags: [String]
    let chef: Chef
    let totoalLikes: Int
    let favourite: Bool
    let images: [Image]
}

struct Response: Codable {
    let code: Int
    let data: Data
}
