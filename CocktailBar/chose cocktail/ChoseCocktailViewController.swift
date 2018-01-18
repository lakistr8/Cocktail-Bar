//
//  ChoseCocktailViewController.swift
//  CocktailBar
//
//  Created by Lazar Andonov on 1/11/18.
//  Copyright © 2018 Lazar Andonov. All rights reserved.
//

import UIKit

class ChoseCocktailViewController: BaseViewController {
    
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var drinkName: UILabel!
    @IBOutlet weak var drinkButtonTitle: UILabel!
    @IBOutlet weak var cocktailButtonTitle: UILabel!
    @IBOutlet weak var searchBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchView.isHidden = true
    }
    
    @IBAction func searchRandomCocktail(_sender: Any) {
        self.searchRandomDrink()
        searchView.isHidden = true
    }
    
    
    @IBAction func searchDring(_sender:Any) {
        self.searchBtn.removeTarget(nil, action: nil, for: .allEvents)
        searchView.isHidden = false
        drinkName.text = drinkButtonTitle.text
        self.textFld.placeholder = "Enter drink name"
        self.searchBtn.addTarget(self, action: Selector(("searchDrinkUsing")), for: .touchUpInside)
    }
    
    
    @IBAction func searchCocktail(_sender: Any) {
        self.searchBtn.removeTarget(nil, action: nil, for: .allEvents)
        searchView.isHidden = false
        drinkName.text = cocktailButtonTitle.text
        self.textFld.placeholder = "Enter cocktail name"
        self.searchBtn.addTarget(self, action:Selector(("searchCocktailUsing")), for: .touchUpInside)
    }
}
