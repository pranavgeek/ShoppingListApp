//
//  ShoppingListViewController.swift
//  FinalExamF23
//
//  Created by Fanshawe College on 2023-12-14.
//

import UIKit

// Prompt 7 & 8 will be completed in this file as well but it is up to you to determine where and what needs to be done
class ShoppingListViewController: UIViewController {
    
    @IBOutlet weak var shoppingListTableView: UITableView!
    @IBOutlet weak var studentNumberTextView: UILabel!
    
    private var items: [Gift] = []
    
    // Prompt 4
    var giftManager: GiftManager = UserDefaultsGiftManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        setStudentNumber()

        items = giftManager.getShoppingList() 
        shoppingListTableView.dataSource = self
    }
    
    // TODO: Prompt 5
    private func setStudentNumber() {
        studentNumberTextView.text = "1178913"
        
    }
    
    // TODO: Prompt 6
    @IBAction func onFinishTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    private func getInexpensiveImage() -> UIImage? {
        return UIImage(systemName: "dollarsign.circle.fill")?
            .applyingSymbolConfiguration(UIImage.SymbolConfiguration(paletteColors: [.systemGreen]))
    }
    
    private func getExpensiveImage() -> UIImage? {
        return UIImage(systemName: "dollarsign.circle")?
            .applyingSymbolConfiguration(UIImage.SymbolConfiguration(paletteColors: [.systemRed]))
    }
}

extension ShoppingListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "giftCell", for: indexPath)
        let item = items[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = item.nameOfGift
        content.secondaryText = "\(item.recipientName),\n\(item.price)$"

        cell.contentConfiguration = content
        
        return cell
    }
}

// TODO: Prompt 8
extension ShoppingListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true) // Deselect the row after tapping
        
        let selectedGift = items[indexPath.row]
        
        // Display an alert indicating the selected gift
        let alert = UIAlertController(title: "Gift selected", message: "\(selectedGift.nameOfGift) for \(selectedGift.recipientName)", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
}

