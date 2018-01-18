//
//  BaseCocktailData.swift
//  CocktailBar
//
//  Created by Lazar Andonov on 1/12/18.
//  Copyright © 2018 Lazar Andonov. All rights reserved.
//

import Foundation
import SwiftyJSON

struct BaseCocktailData {
    
    var id : String
    var name: String
    var category: String
    var glass: String
    var imgLink: String
    
    var Ingredient1: String
    var Ingredient2: String
    var Ingredient3: String
    var Ingredient4: String
    var Ingredient5: String
    
    
    init(data: JSON) {
        self.id = data["idDrink"].string!
        self.name = data["strDrink"].string!
        self.category = data["strCategory"].string!
        self.glass = data["strGlass"].string!
        self.imgLink = data["strDrinkThumb"].string!
        
        self.Ingredient1 = data["strIngredient1"].string!
        self.Ingredient2 = data["strIngredient2"].string!
        self.Ingredient3 = data["strIngredient3"].string!
        self.Ingredient4 = data["strIngredient4"].string!
        self.Ingredient5 = data["strIngredient5"].string!
    }
}
