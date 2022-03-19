//
//  ApiRequest.swift
//  Link-Shorter
//
//  Created by Tahir Uzelli on 18.03.2022.
//

import Foundation
import UIKit

//func getJson(url : String )->Dictionary<String, Any>{
//    let url = URL(string: url)!
//    var tmp : Dictionary<String,Any> = [
//      "test" : "test",
//    ]
//    let task = URLSession.shared.dataTask(with: url) { data, response, error in
//        if let data = data {
//            do{
//                let jsonResponse = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String : Any]
//                              DispatchQueue.main.async { [] in
//
//
//                                print(type(of: jsonResponse))
//                              }
//
//                          }
//                          catch{
//                              print("error")
//                          }
//        } else if let error = error {
//            print("HTTP Request Failed \(error)")
//        }
//
//    }
//
//    task.resume()
//    return tmp
//}
