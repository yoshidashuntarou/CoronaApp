//
//  SettingViewController.swift
//  CoronaApp
//
//  Created by 吉田俊太郎 on 2020/05/28.
//  Copyright © 2020 Shuntaro Yoshida. All rights reserved.
//

import UIKit

protocol StyleColorDelegate {
    
    func setColer(styleNumber: Int)
    
}

class SettingViewController: UIViewController {

    var styleNumber: Int = 0
    var delegate: StyleColorDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func style1(_ sender: Any) {
        styleNumber = 0
        delegate?.setColer(styleNumber: styleNumber)
    }
    
    
    @IBAction func style2(_ sender: Any) {
        styleNumber = 1
        delegate?.setColer(styleNumber: styleNumber)
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
