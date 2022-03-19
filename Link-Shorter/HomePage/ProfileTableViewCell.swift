//
//  ProfileTableViewCell.swift
//  Link-Shorter
//
//  Created by Tahir Uzelli on 19.03.2022.
//

import Foundation
import UIKit

class ProfileTableViewCell: UITableViewCell {
    @IBOutlet private var profileView: ProfileView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(name: String) {
        profileView.configure(with: name)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutMarginsDidChange() {
        super.layoutMarginsDidChange()
    }
    
}
