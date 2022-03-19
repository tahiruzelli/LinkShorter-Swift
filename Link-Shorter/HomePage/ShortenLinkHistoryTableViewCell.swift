//
//  ShortenLinkHistoryTableViewCell.swift
//  Link-Shorter
//
//  Created by Tahir Uzelli on 19.03.2022.
//

import Foundation
import UIKit

class ShortenLinkHistoryTableViewCell: UITableViewCell {
    var isCopied : Bool?
    var currentIndex : Int?
    var shortenLinkHistory : Array<Dictionary<String,String>>? = []
    var shortenLinkHistoryTableView: UITableView!
    
    @IBOutlet var copyButtonOutletCollection: [UIButton]!
    @IBOutlet weak var longLink: UILabel!
    @IBOutlet weak var shortenLink: UILabel!
    @IBOutlet weak var copyButtonOutlet: UIButton!
    
    @IBAction func copyButtonAction(_ sender: Any) {
        let oldIndex : Int = trueValueFinder(myArray: shortenLinkHistoryIsCopied!)
        if(oldIndex != -1){
            shortenLinkHistoryIsCopied![oldIndex] = false
        }
        shortenLinkHistoryIsCopied![currentIndex!] = true
        shortenLinkHistoryTableView.reloadData()
    }
    
    @IBAction func deleteButtonAction(_ sender: Any) {
        
        shortenLinkHistory?.remove(at: currentIndex!)
        if(shortenLinkHistory?.count == 0){
            shortenLinkHistoryTableView.setEmptyView()
        }
        UserDefaults.standard.set(shortenLinkHistory, forKey: shortenLinkHistoryUserDefaultKey)
        shortenLinkHistoryTableView.reloadData()
    }

    
    override func layoutSubviews() {
        if(isCopied == true){
            copyButtonOutlet.setTitle("COPIED", for: .normal)
            copyButtonOutlet.tintColor = UIColor(named: "colorPurple")
        }else{
            copyButtonOutlet.setTitle("COPY", for: .normal)
            copyButtonOutlet.tintColor = UIColor(named: "colorBlue")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(launchShortenUrl))
        shortenLink.isUserInteractionEnabled = true
        shortenLink.addGestureRecognizer(gestureRecognizer)
    }
    
    
    @objc func launchShortenUrl(){
        launchUrl(url: shortenLink.text!)
    }
    
}
