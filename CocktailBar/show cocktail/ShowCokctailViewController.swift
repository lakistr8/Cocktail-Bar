//
//  ShowCokctailViewController.swift
//  CocktailBar
//
//  Created by Lazar Andonov on 1/16/18.
//  Copyright © 2018 Lazar Andonov. All rights reserved.
//

import UIKit

class ShowCokctailViewController: UIView {
    
    @IBOutlet var lbls: [UILabel]!
    @IBOutlet weak var detailLbl: UITextView!
    @IBOutlet weak var lblView: UIView!
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var Ingredient1: UILabel!
    @IBOutlet weak var Ingredient2: UILabel!
    @IBOutlet weak var Ingredient3: UILabel!
    @IBOutlet weak var Ingredient4: UILabel!
    @IBOutlet weak var Ingredient5: UILabel!
    @IBOutlet weak var Ingredient6: UILabel!
    @IBOutlet weak var Ingredient7: UILabel!
    @IBOutlet weak var Ingredient8: UILabel!
    @IBOutlet weak var Ingredient9: UILabel!
    @IBOutlet weak var Ingredient10: UILabel!
   
    
    func getDataFromUrl(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            completion(data, response, error)
            }.resume()
    }
    
    func downloadImage(url: String, imageView: UIImageView) {
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 10
        let Url = URL(string: url)
        getDataFromUrl(url: Url!) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() {
                imageView.image = UIImage(data: data)
            }
        }
    }
    
    func initilaze(data: [BaseDrinkData], view: UIView) {
        self.frame = view.frame
        self.lblView.isHidden = true
        self.detailLbl.isHidden = false
        for item in data {
            self.detailLbl.text = item.description
            self.nameLabel.text = item.name
        }
    }
    
    func intializer(data: [BaseCocktailData], view: UIView) {
        self.frame.origin.x = view.frame.origin.x
        self.frame.origin.y = view.frame.origin.y - 65
        self.frame.size.width = view.frame.size.width
        self.frame.size.height = view.frame.size.height + 100
        for item in data {
            nameLabel.text = item.name
            Ingredient1.text = item.Ingredient1
            Ingredient2.text = item.Ingredient2
            Ingredient3.text = item.Ingredient3
            Ingredient4.text = item.Ingredient4
            self.downloadImage(url: item.imgLink, imageView: img)
        }
    }
    
    @IBAction func dismisSelf(_sender: Any) {
        self.removeFromSuperview()
    }
    
}
