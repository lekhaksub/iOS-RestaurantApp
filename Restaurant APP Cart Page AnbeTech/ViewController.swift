//
//  ViewController.swift
//  Restaurant APP Cart Page AnbeTech
//
//  Created by Shubham Lekhak on 17/05/2023.
//

import UIKit

struct CartItem {
    let image: UIImage
    let name: String
    let price: Double
    let tax: Double = 0.13
    var quantity: Int
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    // This label will display the total price
    @IBOutlet weak var totalPrice: UILabel!
    
    // These labels will display User's Name and delivery location
    @IBOutlet weak var userInfo: UILabel!
    @IBOutlet weak var deliveryInfo: UILabel!
    
    var selectedRow: CartItem?

    // This array will contain all the list of items in the cart
    var cartItems: [CartItem] = [
        CartItem(image: UIImage(named: "pizza")!, name: "Pizza", price: 1000, quantity: 1),
        CartItem(image: UIImage(named: "biryani")!, name: "Chicken Biryani", price: 800, quantity: 1),
        CartItem(image: UIImage(named: "burger")!, name: "Ham Burger", price: 400, quantity: 1),
        CartItem(image: UIImage(named: "coffee")!, name: "Coffee Black", price: 100, quantity: 1),
        CartItem(image: UIImage(named: "chicken-wrap")!, name: "Chicken Wrap", price: 200, quantity: 1),
        CartItem(image: UIImage(named: "french-fries")!, name: "French Fries", price: 200, quantity: 1),
        CartItem(image: UIImage(named: "chicken-chowmein")!, name: "Chicken Chowmein", price: 300, quantity: 1),
        CartItem(image: UIImage(named: "popcorn")!, name: "Popcorn", price: 100, quantity: 1),
        CartItem(image: UIImage(named: "sandwich")!, name: "Chicken&Egg Sandwich", price: 300, quantity: 1),
        CartItem(image: UIImage(named: "burger-fries")!, name: "Burger & Fries", price: 500, quantity: 1),
        CartItem(image: UIImage(named: "cake")!, name: "Choco Cake", price: 150, quantity: 1),
        CartItem(image: UIImage(named: "water")!, name: "Water", price: 50, quantity: 3),
        
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "My Cart"
        
        userInfo.text = "Shubham Lekhak"
        deliveryInfo.text = "Delivery Location: Kalopul, Radramati marg, Kathmandu-05(Near Best Venue)"
        var total: Double = 0
        for item in cartItems {
            total += (item.price * Double(item.quantity) * 1.13)
        }
        totalPrice.text = "Total:  Rs. \(total)"
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cart", for: indexPath) as! CartItemTableViewCell
        let item = cartItems[indexPath.row]
        cell.itemImageView.image = item.image
        cell.itemLabel.text = item.name
        cell.itemPrice.text = "Price:  Rs.\(String(item.price * Double(item.quantity)))"
        cell.itemPriceTax.text = "Tax:  Rs.\(String(item.price * item.tax * Double(item.quantity)))"
        cell.itemQuantity.text = "Quantity: \(String(item.quantity))"
        cell.backgroundColor = .systemGray5
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let item = cartItems[indexPath.row]
        selectedRow = item
        performSegue(withIdentifier: "ToEditItemVC", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! EditItemsViewController
        vc.rowData = self.selectedRow
    }

}

