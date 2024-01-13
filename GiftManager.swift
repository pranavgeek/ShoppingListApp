//
//  GiftManager.swift
//  FinalExamF23
//
//  Created by Fanshawe College on 2023-12-14.
//

import Foundation

struct Gift: Codable {
    // What the actual gift is
    let nameOfGift: String
    
    // Name of the person the gift is intended for
    let recipientName: String
    
    // Price of the gift
    let price: Int
}



protocol GiftManager {
    
    /**
     Saves a Gift to the shopping list
     */
    func save(gift: Gift)
    
    /**
     Retrieves a shopping list containing gifts
     */
    func getShoppingList() -> [Gift]
}

// TODO: Prompt 1

struct UserDefaultsGiftManager: GiftManager {
    
    private static let shoppingListKey = "ShoppingListKey"
    
    // Save a gift to UserDefaults
    func save(gift: Gift) {
        var shoppingList = getShoppingList()
        shoppingList.append(gift)
        
        do {
            let encodedData = try JSONEncoder().encode(shoppingList)
            UserDefaults.standard.set(encodedData, forKey: UserDefaultsGiftManager.shoppingListKey)
        } catch {
            print("Error encoding shopping list: \(error)")
        }
    }
    
    // Retrieve the shopping list from UserDefaults
    func getShoppingList() -> [Gift] {
        if let savedData = UserDefaults.standard.data(forKey: UserDefaultsGiftManager.shoppingListKey) {
            do {
                let shoppingList = try JSONDecoder().decode([Gift].self, from: savedData)
                return shoppingList
            } catch {
                print("Error decoding shopping list: \(error)")
            }
        }
        return []
    }
}




