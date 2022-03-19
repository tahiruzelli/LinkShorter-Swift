//
//  LaunchUrl.swift
//  Link-Shorter
//
//  Created by Tahir Uzelli on 19.03.2022.
//

import Foundation
import UIKit

func launchUrl(url : String){
    guard let url = URL(string: url) else {
          return
    }
    UIApplication.shared.open(url, completionHandler: { success in
        if success {
            print("opened")
        } else {
            print("failed")
            
        }
    })
}
