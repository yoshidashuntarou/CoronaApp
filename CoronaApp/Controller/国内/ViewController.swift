//
//  ViewController.swift
//  CoronaApp
//
//  Created by 吉田俊太郎 on 2020/05/19.
//  Copyright © 2020 Shuntaro Yoshida. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var cases: UILabel!
    @IBOutlet weak var deaths: UILabel!
    @IBOutlet weak var casesChangeLabel: UILabel!
    @IBOutlet weak var deathsChangeLabel: UILabel!
    
    var id = Int()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let patientsDifference = dataArray[id].patients - dataArray[id].patients2 //前日比
        let deathsDifference = dataArray[id].deaths - dataArray[id].deaths2
        
        if searchResults.count == 0 { //検索してなかったら
                
            placeNameLabel.text = dataArray[id].name
            
            if dataArray[id].patients != -1 {
                cases.text = "\(dataArray[id].patients)人"
                deaths.text = "\(dataArray[id].deaths)人"
            }
            
            
            //前日比の処理
            if patientsDifference > 0 {
                
                casesChangeLabel.text = "+\(patientsDifference)"
                casesChangeLabel.textColor = .red
                
            }
            else if patientsDifference < 0 {
                
                casesChangeLabel.text = "-\(patientsDifference)"
                casesChangeLabel.textColor = .blue
             
            }
            else {
                
                casesChangeLabel.text = "±\(patientsDifference)"
                casesChangeLabel.textColor = .gray

            }
            
            
            if deathsDifference > 0 {
                
                deathsChangeLabel.text = "+\(deathsDifference)"
                deathsChangeLabel.textColor = .red
                
            }
            else {
                
                deathsChangeLabel.text = "±\(deathsDifference)"
                deathsChangeLabel.textColor = .gray

            }
            
        }
        else {//検索していたら
            
            placeNameLabel.text = searchResults[id].name
            
            if dataArray[id].patients != -1 {
                cases.text = "\(searchResults[id].patients)人"
                deaths.text = "\(searchResults[id].deaths)人"
            }
            
            
            
            let patientsDifference = searchResults[id].patients - searchResults[id].patients2
            let deathsDifference = searchResults[id].deaths - searchResults[id].deaths2
            
            //前日比の処理
            
            if patientsDifference > 0 {
                
                casesChangeLabel.text = "+\(patientsDifference)"
                casesChangeLabel.textColor = .red
                
                
            }
            else if patientsDifference < 0 {
                
                casesChangeLabel.text = "-\(patientsDifference)"
                casesChangeLabel.textColor = .blue
             
            }
            else {
                
                casesChangeLabel.text = "±\(patientsDifference)"
                casesChangeLabel.textColor = .gray

            }
            
            
            if deathsDifference > 0 {
                
                deathsChangeLabel.text = "+\(deathsDifference)"
                deathsChangeLabel.textColor = .red
                
            }
            else {
                
                deathsChangeLabel.text = "±\(deathsDifference)"
                deathsChangeLabel.textColor = .gray
                
            }
            
        }
        
    }
    
    
    @IBAction func webButton(_ sender: Any) {
        
        if searchResults.count == 0 {
            let url = URL(string: dataArray[id].url)
            UIApplication.shared.open(url!)
        }
        else {
            let url = URL(string: searchResults[id].url)
            UIApplication.shared.open(url!)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
