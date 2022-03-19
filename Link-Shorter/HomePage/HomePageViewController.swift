//
//  HomePageViewController.swift
//  Link-Shorter
//
//  Created by Tahir Uzelli on 18.03.2022.
//

import UIKit
var shortenLinkHistoryIsCopied : Array<Bool>?
class HomePageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var longLinkTextField: UITextField!
    @IBOutlet weak var shortenItButtonOutlet: UIButton!
    @IBOutlet weak var shortenLinkHistoryTableView: UITableView!
    @IBAction func shortenItButtonAction(_ sender: Any) {
        
        getJson(url: linkShorterUrl + longLinkTextField.text!)
    }
    
    var shortenLinkHistory : Array<Dictionary<String,String>>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getShortenLinkHistory()
        shortenLinkHistoryIsCopied = Array(repeating: false, count: shortenLinkHistory!.count)
        changeState()
        shortenLinkHistoryTableView.delegate = self
        shortenLinkHistoryTableView.dataSource = self
        
    }
    func changeState(){
        if(shortenLinkHistory?.count == 0){
            shortenLinkHistoryTableView.setEmptyView()
        }
        else{
            shortenLinkHistoryTableView.restore()
          
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        getShortenLinkHistory()
        return shortenLinkHistory?.count ?? 0
    }
    


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! ShortenLinkHistoryTableViewCell
        getShortenLinkHistory()
        let history : [String : String] = shortenLinkHistory![indexPath.row]
        cell.isCopied = shortenLinkHistoryIsCopied![indexPath.row]
        cell.longLink.text = history["longLink"]
        cell.shortenLink.text = history["shortenLink"]
        cell.currentIndex = indexPath.row
        cell.shortenLinkHistory = self.shortenLinkHistory
        cell.shortenLinkHistoryTableView = self.shortenLinkHistoryTableView
      
        return cell
    }
    func getShortenLinkHistory(){
        shortenLinkHistory = UserDefaults.standard.object(forKey: shortenLinkHistoryUserDefaultKey) as?
        Array<Dictionary<String,String>> ?? []
    }
    func appendNewShorthenLinkHistory(jsonResponse : Dictionary<String,Any>){
        let result : Dictionary<String, String> = jsonResponse["result"] as! Dictionary<String, String>
        let tmp : Dictionary<String,String> = [
          "longLink" : longLinkTextField.text!,
          "shortenLink" : result["short_link"]!
        ]
        shortenLinkHistory?.append(tmp)
        shortenLinkHistoryIsCopied?.append(false)
        
        changeState()
        UserDefaults.standard.set(shortenLinkHistory, forKey: shortenLinkHistoryUserDefaultKey)
        shortenLinkHistoryTableView.reloadData()
        
    }
    func getJson(url: String){
          let url = URL(string: url)
          let session = URLSession.shared
          let task = session.dataTask(with: url!){(data, response, error) in
              if error != nil{
                  let alert = UIAlertController(title: "Hata", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                  let okButton = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: nil)
                  alert.addAction(okButton)
                  self.present(alert,animated: true,completion: nil)
              }
              else{
                  if data != nil{
                      do{
                          let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String,Any>
                          DispatchQueue.main.async { [self] in
                              
                              if(jsonResponse["ok"] as! Bool == false){
                                  let alert = UIAlertController(title: "Error", message: jsonResponse["error"] as? String ??  "Unknown Error", preferredStyle: UIAlertController.Style.alert)
                                  let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                                  alert.addAction(okButton)
                                  self.present(alert,animated: true,completion: nil)
                                  print("error")
                                  longLinkTextField.text = ""
                              }else{
                                  appendNewShorthenLinkHistory(jsonResponse: jsonResponse)
                                  longLinkTextField.text = ""
                              }
                              
                          }
                          
                      }
                      catch{
                          print("error")
                      }
                  }
              }
              
          }
          task.resume()
      }
}

