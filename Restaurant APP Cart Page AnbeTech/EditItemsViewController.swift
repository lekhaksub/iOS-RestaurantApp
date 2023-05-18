//
//  EditItemsViewController.swift
//  Restaurant APP Cart Page AnbeTech
//
//  Created by Shubham Lekhak on 17/05/2023.
//

import UIKit

class EditItemsViewController: UIViewController {
    
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var itemTax: UILabel!
    @IBOutlet weak var itemQuantity: UILabel!
    
    var rowData: CartItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        checks if rowData received data from other view
        if let rowDataUnwrapped = rowData {
            
            itemImage.image = rowDataUnwrapped.image
            itemImage.layer.cornerRadius = 20
            itemImage.clipsToBounds = true
            itemName.text = rowDataUnwrapped.name
            itemPrice.text = "Price:  Rs.\(String(rowDataUnwrapped.price * Double(rowDataUnwrapped.quantity)))"
            itemTax.text = "Tax:  Rs.\(String(rowDataUnwrapped.price * 0.13 * Double(rowDataUnwrapped.quantity)))"
            itemQuantity.text = "Quantity: \(String(rowDataUnwrapped.quantity))"
            view.backgroundColor = .systemGray6
        }
    }
}
