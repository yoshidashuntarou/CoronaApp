//
//  JapanViewController.swift
//  CoronaApp
//
//  Created by 吉田俊太郎 on 2020/07/03.
//  Copyright © 2020 Shuntaro Yoshida. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class JapanViewController: UIViewController {

    
    @IBOutlet weak var casesLabel: UILabel!
    @IBOutlet weak var deathsLabel: UILabel!
    
    @IBOutlet weak var casesChangeLabel: UILabel!
    @IBOutlet weak var deathsChangeLabel: UILabel!
    
    var alertController: UIAlertController!

    func alert(title:String, message:String) {
            alertController = UIAlertController(title: title, message: message,preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AF.request("https://covid19-japan-web-api.now.sh/api/v1/total?history=true").responseJSON { response in
               switch response.result {
               case .success:

                   print("----------ネットワーク接続に成功----------")


               case .failure(let error):

                   self.alert(title: "接続エラー", message: "インターネットに接続してください")
                   print("----------ネットワーク接続に失敗----------")
                   print(error.localizedDescription)
               
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            // 0.5秒後に実行したい処理
            
            if japanCases != -1 {
                self.casesLabel.text = "\(String(japanCases))人"
                self.deathsLabel.text = "\(String(japanDeaths))人"
            }
            
            let japanPatientsDifference = japanCases - japanCases2 //前日比
            let japanDeathsDifference = japanDeaths - japanDeaths2
            //前日比の処理
            
                if japanPatientsDifference > 0 {
                    
                    self.casesChangeLabel.text = "+\(japanPatientsDifference)"
                    self.casesChangeLabel.textColor = .red
                    
                    
                }
                else if japanPatientsDifference < 0 {
                    
                    self.casesChangeLabel.text = "-\(japanPatientsDifference)"
                    self.casesChangeLabel.textColor = .blue
                 
                }
                else {
                    
                    self.casesChangeLabel.text = "±\(japanPatientsDifference)"
                    self.casesChangeLabel.textColor = .gray

                }
                
                
                if japanDeathsDifference > 0 {
                    
                    self.deathsChangeLabel.text = "+\(japanDeathsDifference)"
                    self.deathsChangeLabel.textColor = .red
                    
                }
                else {
                    
                    self.deathsChangeLabel.text = "±\(japanDeathsDifference)"
                    self.deathsChangeLabel.textColor = .gray

                    
                }
            
        }
        
        
        
        
        
    }
    
            
    override func viewWillAppear(_ animated: Bool) {

        if japanCases != -1 {
            self.casesLabel.text = "\(String(japanCases))人"
            self.deathsLabel.text = "\(String(japanDeaths))人"
        }
        
        let japanPatientsDifference = japanCases - japanCases2 //前日比
        let japanDeathsDifference = japanDeaths - japanDeaths2
        //前日比の処理
        
            if japanPatientsDifference > 0 {
                
                casesChangeLabel.text = "+\(japanPatientsDifference)"
                casesChangeLabel.textColor = .red
                
                
            }
            else if japanPatientsDifference < 0 {
                
                casesChangeLabel.text = "-\(japanPatientsDifference)"
                casesChangeLabel.textColor = .blue
             
            }
            else {
                
                casesChangeLabel.text = "±\(japanPatientsDifference)"
                casesChangeLabel.textColor = .gray

            }
            
            
            if japanDeathsDifference > 0 {
                
                deathsChangeLabel.text = "+\(japanDeathsDifference)"
                deathsChangeLabel.textColor = .red
                
            }
            else {
                
                deathsChangeLabel.text = "±\(japanDeathsDifference)"
                deathsChangeLabel.textColor = .gray

                
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
