//
//  BaseDrinkData.swift
//  CocktailBar
//
//  Created by Lazar Andonov on 1/12/18.
//  Copyright © 2018 Lazar Andonov. All rights reserved.
//

import Foundation
import SwiftyJSON

struct BaseDrinkData {
    
    var id: String
    var name: String
    var description: String
    
    init(data: JSON) {
        self.id = data["idIngredient"].string!
        self.name = data["strIngredient"].string!
        self.description = data["strDescription"].string!
    }
}
