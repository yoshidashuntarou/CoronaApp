//
//  TableViewController.swift
//  CoronaApp
//
//  Created by 吉田俊太郎 on 2020/05/19.
//  Copyright © 2020 Shuntaro Yoshida. All rights reserved.
//

// 国内のデータ -> "https://covid19-japan-web-api.now.sh/api/v1/total"
// 国内の過去からの集計データ -> "https://covid19-japan-web-api.now.sh/api/v1/total?history=true"
// 各都道府県のデータ -> "https://covid19-japan-web-api.now.sh/api/v1/prefectures"

import UIKit
import Alamofire
import SwiftyJSON


var searchResults: [(id: Int, name: String, patients: Int, deaths: Int, patients2: Int, deaths2: Int, url: String)] = []

class TableViewController: UITableViewController, UISearchBarDelegate, StyleColorDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    let serchBar = UISearchBar()
    var styleNumber = 0
    
    func setColer(styleNumber: Int) {
        self.styleNumber = styleNumber
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 100
        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        
//        tableView.reloadData()
        
        serchBar.delegate = self
        serchBar.enablesReturnKeyAutomatically = false
    
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
        
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if searchResults.count != 0 {
            return searchResults.count
        }
        else {
            return dataArray.count
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell

        // Configure the cell...

        let index: Int = indexPath.row

        
        //セルのスタイル変更
        
//        switch styleNumber {
//        case 0:
//            cell.nameLabel.textColor = .init(red: 0 / 255, green: 0 / 255, blue: 5 / 255, alpha: 1)
//            if index % 2 == 0 {
//                cell.backgroundColor = .init(red: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 1)
//                
//            }
//            else {
//                cell.backgroundColor = .init(red: 240 / 255, green: 240 / 255, blue: 240 / 255, alpha: 1)
//                
//            }
//            
//        case 1:
//            if index % 2 == 0 {
//                cell.backgroundColor = .init(red: 255 / 255, green: 245 / 255, blue: 180 / 255, alpha: 1)
//                
//            }
//            else {
//                cell.backgroundColor = .init(red: 255 / 255, green: 245 / 255, blue: 160 / 255, alpha: 1)
//                
//            }
//            
//        default:
//            if index % 2 == 0 {
//                cell.backgroundColor = .init(red: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 1)
//                
//            }
//            else {
//                cell.backgroundColor = .init(red: 230 / 255, green: 230 / 255, blue: 230 / 255, alpha: 1)
//                
//            }
//        }
        
        if searchResults.count == 0 { //searchbarに値がなかったら（検索していない状態）
        
                
                cell.nameLabel.text = dataArray[index].name
                
            if dataArray[index].patients != -1 {
                cell.casesLabel.text = "\(dataArray[index].patients)人"
                cell.deathsLabel.text = "\(dataArray[index].deaths)人"
            }
            
            
                
                let patientsDifference = dataArray[index].patients - dataArray[index].patients2 //前日比
                let deathsDifference = dataArray[index].deaths - dataArray[index].deaths2
                
            //前日比の処理
            
                if patientsDifference > 0 {
                    
                    cell.casesChangeLabel.text = "+\(patientsDifference)"
                    cell.casesChangeLabel.textColor = .red
                    
                    
                }
                else if patientsDifference < 0 {
                    
                    cell.casesChangeLabel.text = "-\(patientsDifference)"
                    cell.casesChangeLabel.textColor = .blue
                 
                }
                else {
                    
                    cell.casesChangeLabel.text = "±\(patientsDifference)"
                    cell.casesChangeLabel.textColor = .gray

                }
                
                
                if deathsDifference > 0 {
                    
                    cell.deathsChangeLabel.text = "+\(deathsDifference)"
                    cell.deathsChangeLabel.textColor = .red
                    
                }
                else {
                    
                    cell.deathsChangeLabel.text = "±\(deathsDifference)"
                    cell.deathsChangeLabel.textColor = .gray

                    
                }
                
            
            
        }
        else { //検索している状態だったら
                
                cell.nameLabel.text = searchResults[index].name
            if searchResults[index].patients != -1 {
                cell.casesLabel.text = "\(searchResults[index].patients)人"
                cell.deathsLabel.text = "\(searchResults[index].deaths)人"
            }
                
                let patientsDifference = searchResults[index].patients - searchResults[index].patients2
                let deathsDifference = searchResults[index].deaths - searchResults[index].deaths2
                
                
                if patientsDifference > 0 {
                    
                    cell.casesChangeLabel.text = "+\(patientsDifference)"
                    cell.casesChangeLabel.textColor = .red
                    
                    
                }
                else if patientsDifference < 0 {
                    
                    cell.casesChangeLabel.text = "-\(patientsDifference)"
                    cell.casesChangeLabel.textColor = .blue
                 
                }
                else {
                    
                    cell.casesChangeLabel.text = "±\(patientsDifference)"
                    cell.casesChangeLabel.textColor = .gray

                }
                
                
                if deathsDifference > 0 {
                    
                    cell.deathsChangeLabel.text = "+\(deathsDifference)"
                    cell.deathsChangeLabel.textColor = .red
                    
                }
                else {
                    
                    cell.deathsChangeLabel.text = "±\(deathsDifference)"
                    cell.deathsChangeLabel.textColor = .gray
                    
                }
                
            
        }

        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        performSegue(withIdentifier: "next", sender: index)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        if segue.identifier == "next" {
            let nextVC = segue.destination as! ViewController
            nextVC.id = sender as! Int
        }
        
        if segue.identifier == "setting" {
            let settingVC = segue.destination as! SettingViewController
            settingVC.delegate = self
        }
    
    }
    
    
//    var searchResults = [String]()
//    var searchResults: [(id: Int, name: String, cases: Int, deaths: Int)] = []

    func searchInfo(searchText: String) {
        //要素を検索する
        if searchText != "" {
            searchResults = dataArray.filter { item in
                
                return item.name.contains(searchText)
            } as Array
        } else {
            //渡された文字列が空の場合は全てを表示
            searchResults = dataArray
        }
        //tableViewを再読み込みする
        self.tableView.reloadData()
    }

    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchInfo(searchText: searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
       
        searchBar.resignFirstResponder()

    }
    
    
    func searchBarResultsListButtonClicked(_ searchBar: UISearchBar) {
         searchBar.resignFirstResponder()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        searchBar.resignFirstResponder()
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
