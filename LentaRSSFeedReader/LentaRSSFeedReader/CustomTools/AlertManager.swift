//
//  AlertManager.swift
//  LentaRSSFeedReader
//
//  Created by Дмитрий Лапунов on 3.02.23.
//

import UIKit

final class AlertManager {
    
    /// Method to create custom alert with a single button
    
    func createAlert(message: String) {
        let alertController = UIAlertController(title: nil,
                                                message: message,
                                                preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(defaultAction)
        let window = UIApplication.shared.windows.first { $0.isKeyWindow }
        window?.rootViewController?.present(alertController, animated: true)
    }
}
