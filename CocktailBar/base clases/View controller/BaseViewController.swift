//
//  BaseViewController.swift
//  CocktailBar
//
//  Created by Lazar Andonov on 1/12/18.
//  Copyright © 2018 Lazar Andonov. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class BaseViewController: UIViewController, BaseViewControllerProtocol {
    
    
    @IBOutlet weak var centralView: UIView!
    @IBOutlet weak var textFld: UITextField!
    let searchCocktailUrl = "http://www.thecocktaildb.com/api/json/v1/1/search.php?s="
    let searcDrinkUrl = "http://www.thecocktaildb.com/api/json/v1/1/search.php?i="
    let randomDrinkUrl = "http://www.thecocktaildb.com/api/json/v1/1/random.php"
    
    var cocktailArr : [BaseCocktailData] = []
    var drinkArr : [BaseDrinkData] = []
    
    var alert = UIAlertController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    @objc func searchCocktailUsing() {
        if (textFld.text?.isEmpty)! {
            self.alert = UIAlertController(title: "Error", message: "Please input cocktail name", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
            self.alert.addAction(cancel)
            self.present(self.alert, animated: true, completion: nil)
        } else {
            let newStr = textFld.text?.replacingOccurrences(of: " ", with: "_")
            let fullUrl = "\(self.searchCocktailUrl)\(newStr ?? "")"
            let fullURL = URL(string:fullUrl)
            Alamofire.request(fullURL!).responseJSON {response in
                if let json = response.result.value {
                    let jSON = JSON(json)["drinks"].array
                    if jSON == nil {
                        self.alert = UIAlertController(title: "Error", message: "Wrong cocktail name input", preferredStyle: .alert)
                        let cancel = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
                        self.alert.addAction(cancel)
                        self.present(self.alert, animated: true, completion: nil)
                    } else {
                        for item in jSON! {
                            self.cocktailArr.append(BaseCocktailData(data: item))
                        }
                        self.openControllerUsing(Controller: "ShowCokctailViewController", Array: self.cocktailArr, view: self.centralView)
                    }
                }
            }.resume()
        }
    }
    
    @objc func searchDrinkUsing() {
        if (textFld.text?.isEmpty)! {
            self.alert = UIAlertController(title: "Error", message: "Please input drink name", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
            self.alert.addAction(cancel)
            self.present(self.alert, animated: true, completion: nil)
        } else {
            let newStr = textFld.text?.replacingOccurrences(of: " ", with: "_")
            let fullUrl = "\(self.searcDrinkUrl)\(newStr ?? "")"
            let fullURL = URL(string:fullUrl)
            Alamofire.request(fullURL!).responseJSON {response in
                if let json = response.result.value {
                    let jSON = JSON(json)["ingredients"].array
                    if jSON == nil {
                        self.alert = UIAlertController(title: "Error", message: "Wrong drink name input", preferredStyle: .alert)
                        let cancel = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
                        self.alert.addAction(cancel)
                        self.present(self.alert, animated: true, completion: nil)
                    } else {
                        for item in jSON! {
                            self.drinkArr.append(BaseDrinkData(data: item))
                        }
                        self.openController(Controller: "ShowCokctailViewController", Array: self.drinkArr)
                    }
                }
            }.resume()
        }
    }
    
    func searchRandomDrink() {
        let fullURL = URL(string:randomDrinkUrl)
        Alamofire.request(fullURL!).responseJSON {response in
            if let json = response.result.value {
                let jSON = JSON(json)["drinks"].array
                for item in jSON! {
                    self.cocktailArr.append(BaseCocktailData(data: item))
                }
                self.openControllerUsing(Controller: "ShowCokctailViewController", Array: self.cocktailArr, view: self.centralView)
            }
        }.resume()
    }
    
    func close() {
         self.dismiss(animated: true, completion: nil)
    }
    
    func openController(Controller:String, Array: [BaseDrinkData]) {
        let nib = UINib(nibName: Controller, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! ShowCokctailViewController
        nib.initilaze(data: Array, view: self.centralView)
        self.view.addSubview(nib)
    }
    
    
    func openControllerUsing(Controller:String, Array: [BaseCocktailData], view: UIView) {
        let nib = UINib(nibName: Controller, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! ShowCokctailViewController
        nib.intializer(data: Array, view: view)
        view.addSubview(nib)
    }
    
}
