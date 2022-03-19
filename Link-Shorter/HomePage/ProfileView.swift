//
//  ProfileView.swift
//  Link-Shorter
//
//  Created by Tahir Uzelli on 19.03.2022.
//

import Foundation
class ProfileView: UIView {

    @IBOutlet var profileView: UIView!
    @IBOutlet weak var chevronImageView: UIImageView!
    
    @IBOutlet weak var circularImageView: CircularView!
    @IBOutlet weak var nameLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        let bundle = Bundle(for: type(of: self))
        bundle.loadNibNamed("ProfileView", owner: self, options: .none)
        addSubview(profileView)
        profileView.frame = self.bounds
        profileView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        circularImageView.image = UIImage(named: "man")
        let chevron = UIImage(systemName: "chevron.right")?.withRenderingMode(.alwaysTemplate)
        chevronImageView.image = chevron
        chevronImageView.tintColor = .black
    }

    func configure(with name: String) {
        nameLabel.text = name
    }
}
