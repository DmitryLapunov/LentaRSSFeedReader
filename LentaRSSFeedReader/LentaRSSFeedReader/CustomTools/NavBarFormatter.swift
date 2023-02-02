//
//  NavBarFormatter.swift
//  LentaRSSFeedReader
//
//  Created by Дмитрий Лапунов on 3.02.23.
//

import UIKit

final class NavBarFormatter {
    
    /// Method to configure app's navigation bar
    
    func configureNavBar() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithDefaultBackground()
        navigationBarAppearance.shadowColor = Colors.clear
        navigationBarAppearance.backgroundColor = Colors.darkGray
        navigationBarAppearance.backgroundImage = Images.Custom.lentaLogo
        navigationBarAppearance.backgroundImageContentMode = .bottom
        
        let navigationAppearance = UINavigationBar.appearance()
        navigationAppearance.standardAppearance = navigationBarAppearance
        navigationAppearance.compactAppearance = navigationBarAppearance
        navigationAppearance.scrollEdgeAppearance = navigationBarAppearance
        navigationAppearance.tintColor = Colors.white
    }
}
