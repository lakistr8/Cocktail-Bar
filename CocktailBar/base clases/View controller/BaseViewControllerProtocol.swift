//
//  BaseViewControllerProtocol.swift
//  CocktailBar
//
//  Created by Lazar Andonov on 1/12/18.
//  Copyright © 2018 Lazar Andonov. All rights reserved.
//

import Foundation
import UIKit

protocol BaseViewControllerProtocol {
    
    func openControllerUsing(Controller:String, Array: [BaseCocktailData], view: UIView)
    func openController(Controller:String, Array: [BaseDrinkData])
    
    func close()
    
}
