//
//  SetEmptyStateExtension.swift
//  Link-Shorter
//
//  Created by Tahir Uzelli on 20.03.2022.
//

import Foundation
import UIKit
extension UITableView {
    func setEmptyView() {
        var currentHeight = bounds.height / 10
        let emptyView = UIView()
        emptyView.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height)
        
        let logo = UIImageView(image: UIImage(named: "logo.svg"))
        logo.frame = CGRect(x: bounds.width * 0.375, y: currentHeight, width: bounds.width / 4  , height: bounds.width / 16)
        emptyView.addSubview(logo)
        
        currentHeight = currentHeight + bounds.height / 16 + 50
        let illustration = UIImageView(image: UIImage(named: "illustration.svg"))
        illustration.frame = CGRect(x:0, y: currentHeight, width: bounds.width  , height: bounds.width * 0.864 )
        emptyView.addSubview(illustration)
        
        currentHeight = currentHeight + bounds.width * 0.86
        let title = UILabel()
        title.text = "Let's get started!"
        title.font = UIFont.systemFont(ofSize: 32,weight: .bold)
        title.frame = CGRect(x: 0, y: currentHeight, width: bounds.width, height: 50)
        title.textAlignment = .center
        emptyView.addSubview(title)
        
        
        currentHeight = currentHeight + 50
        let subTitle = UILabel()
        subTitle.text = "Paste your first link into the field to shorten it"
        subTitle.font = UIFont.systemFont(ofSize: 20,weight: .medium)
        subTitle.frame = CGRect(x:bounds.width / 4, y: currentHeight, width: bounds.width / 2, height: 75)
        subTitle.numberOfLines = 3
        subTitle.textAlignment = .center
        emptyView.addSubview(subTitle)
        
        self.backgroundView = emptyView
    }
    func restore() {
        self.backgroundView = nil
    }
}
