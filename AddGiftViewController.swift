//
//  ViewController.swift
//  FinalExamF23
//
//  Created by Fansahwe College on 2023-12-14.
//

import UIKit

class AddGiftViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var giftTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    
    // TODO: Prompt 2
//    private let giftManager: GiftManager? = nil
    let giftManager: GiftManager = UserDefaultsGiftManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onAddGiftTapped(_ sender: UIButton) {
        guard let recipient = nameTextField.text else {
            return
        }
        
        guard let gift = giftTextField.text else {
            return
        }
        
        guard let price = priceTextField.text else {
            return
        }
        
                
        giftManager.save(gift: Gift(nameOfGift: recipient, recipientName: gift, price: Int(price) ?? 0))
        
        [nameTextField, giftTextField, priceTextField].forEach { textField in
            textField?.text = ""
        }
        
        
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToShoppingListView" {
    
            if let destinationVC = segue.destination as? ShoppingListViewController {
            
                destinationVC.giftManager = giftManager
            }
        }
    }

    
    
    // TODO: Prompt 3
    
    @IBAction func ViewAllGifts(_ sender: UIButton) {
        goToShoppingListView()
    }
    
    private func goToShoppingListView() {
        performSegue(withIdentifier: "goToShoppingListView", sender: self)
    }
    
}

