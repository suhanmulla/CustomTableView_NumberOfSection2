//
//  ViewController.swift
//  CustomTableView_NumberOfSection2
//
//  Created by Macintosh on 18/03/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var FoodItemTableView: UITableView!
    
    var arrVeg : [Menus] = [
        Menus(foodItemName: "Paneer_Masala", foodItemDescription: "delicious", foodItemPrice: 150, foodItemImage: UIImage(named: "paneer_masala")!),
        Menus(foodItemName: "Kofta_Curry", foodItemDescription: "delicious", foodItemPrice: 200, foodItemImage: UIImage(named: "Kofta_Curry")!),
        Menus(foodItemName: "Veg_Pulaav", foodItemDescription: "delicious", foodItemPrice: 100, foodItemImage: UIImage(named: "Veg_Pulaav")!),
        Menus(foodItemName: "Aalu_Matar", foodItemDescription: "delicious", foodItemPrice: 70, foodItemImage: UIImage(named: "Aalu_Matar")!),
        Menus(foodItemName: "Kaju_Curry", foodItemDescription: "delicious", foodItemPrice: 120, foodItemImage: UIImage(named: "Kaju_Curry")!)
    ]
    
    var arrNonveg: [Menus] = [
        Menus(foodItemName: "Chicken Biryani", foodItemDescription: "Spicy and delicious", foodItemPrice: 250, foodItemImage: UIImage(named: "Chiken_Biryani")!),
        Menus(foodItemName: "Chicken Handi", foodItemDescription: "Rich and creamy", foodItemPrice: 300, foodItemImage: UIImage(named: "Chiken_Handi")!),
        Menus(foodItemName: "Fish Fry", foodItemDescription: "Crispy and tasty", foodItemPrice: 180, foodItemImage: UIImage(named: "Fish_Fry")!),
        Menus(foodItemName: "Egg Curry", foodItemDescription: "Spicy and tangy", foodItemPrice: 120, foodItemImage: UIImage(named: "Egg_Curry")!),
        Menus(foodItemName: "Chicken Masala", foodItemDescription: "Hot and delicious", foodItemPrice: 220, foodItemImage: UIImage(named: "Chicken_masala")!)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeViews()
        registerCellWithXIB()
    }
    
    func initializeViews() {
        FoodItemTableView.delegate = self
        FoodItemTableView.dataSource = self
    }
    
    func registerCellWithXIB() {
        let uiNib = UINib(nibName: "VegNonvegTableViewCell", bundle: nil)
        self.FoodItemTableView.register(uiNib, forCellReuseIdentifier: "VegNonvegTableViewCell")
    }

}

// Delegate Methods :-
extension ViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}

// Data Source Methods :-
extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Vegetarian" : "Non-Vegetarian"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2           // One section for Veg, one for Non-Veg
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return arrVeg.count            // Veg section
        }
        else {
            return arrNonveg.count         // Non-Veg section
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.FoodItemTableView.dequeueReusableCell(withIdentifier: "VegNonvegTableViewCell", for: indexPath) as! VegNonvegTableViewCell
        
        let itemMenu : Menus
        
        if indexPath.section == 0 {
            itemMenu = arrVeg[indexPath.row]             // Veg section
        }
        else {
            itemMenu = arrNonveg[indexPath.row]          // Non-Veg section
        }
        
        cell.foodItemNameLabel.text = itemMenu.foodItemName
        cell.foodItemDescriptionLabel.text = itemMenu.foodItemDescription
        cell.foodItemPriceLabel.text = "₹\(itemMenu.foodItemPrice)"
        cell.foodItemImageView.image = itemMenu.foodItemImage
        
       return cell
    }
    
}



