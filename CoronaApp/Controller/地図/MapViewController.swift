//
//  MapViewController.swift
//  CoronaApp
//
//  Created by 吉田俊太郎 on 2020/07/03.
//  Copyright © 2020 Shuntaro Yoshida. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {

    @IBOutlet weak var Hokkaido: UIImageView!
    @IBOutlet weak var Aomori: UIImageView!
    @IBOutlet weak var Iwate: UIImageView!
    @IBOutlet weak var Miyagi: UIImageView!
    @IBOutlet weak var Yamagata: UIImageView!
    @IBOutlet weak var Ibaraki: UIImageView!
    @IBOutlet weak var Chiba: UIImageView!
    @IBOutlet weak var Shiga: UIImageView!
    @IBOutlet weak var Mie: UIImageView!
    @IBOutlet weak var Wakayama: UIImageView!
    @IBOutlet weak var Tokusima: UIImageView!
    @IBOutlet weak var Aiti: UIImageView!
    @IBOutlet weak var Kouti: UIImageView!
    @IBOutlet weak var Okinawa: UIImageView!
    @IBOutlet weak var Kagawa: UIImageView!
    @IBOutlet weak var Yamaguti: UIImageView!
    @IBOutlet weak var Hirosima: UIImageView!
    @IBOutlet weak var Simane: UIImageView!
    @IBOutlet weak var Hyougo: UIImageView!
    @IBOutlet weak var Osaka: UIImageView!
    @IBOutlet weak var Kyoto: UIImageView!
    @IBOutlet weak var Hukui: UIImageView!
    @IBOutlet weak var Gihu: UIImageView!
    @IBOutlet weak var Isikawa: UIImageView!
    @IBOutlet weak var Sizuoka: UIImageView!
    @IBOutlet weak var Nagano: UIImageView!
    @IBOutlet weak var Ehima: UIImageView!
    @IBOutlet weak var Kanagawa: UIImageView!
    @IBOutlet weak var Yamanasi: UIImageView!
    @IBOutlet weak var Tokyo: UIImageView!
    @IBOutlet weak var Niigata: UIImageView!
    @IBOutlet weak var Saitama: UIImageView!
    @IBOutlet weak var Gunma: UIImageView!
    @IBOutlet weak var Totigi: UIImageView!
    @IBOutlet weak var Akita: UIImageView!
    @IBOutlet weak var Hukusima: UIImageView!
    @IBOutlet weak var Toyama: UIImageView!
    @IBOutlet weak var Nara: UIImageView!
    @IBOutlet weak var Tottori: UIImageView!
    @IBOutlet weak var Okayama: UIImageView!
    @IBOutlet weak var Saga: UIImageView!
    @IBOutlet weak var Oita: UIImageView!
    @IBOutlet weak var Hukuoka: UIImageView!
    @IBOutlet weak var Kumamoto: UIImageView!
    @IBOutlet weak var Kagosima: UIImageView!
    @IBOutlet weak var Nagasaki: UIImageView!
    @IBOutlet weak var Miyazaki: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        changColoer(name: Hokkaido, id: 1)
        changColoer(name: Aomori, id: 2)
        changColoer(name: Iwate, id: 3)
        changColoer(name: Miyagi, id: 4)
        changColoer(name: Akita, id: 5)
        changColoer(name: Yamagata, id: 6)
        changColoer(name: Hukusima, id: 7)
        changColoer(name: Ibaraki, id: 8)
        changColoer(name: Totigi, id: 9)
        changColoer(name: Gunma, id: 10)
        changColoer(name: Saitama, id: 11)
        changColoer(name: Chiba, id: 12)
        changColoer(name: Tokyo, id: 13)
        changColoer(name: Kanagawa, id: 14)
        changColoer(name: Niigata, id: 15)
        changColoer(name: Toyama, id: 16)
        changColoer(name: Isikawa, id: 17)
        changColoer(name: Hukui, id: 18)
        changColoer(name: Yamanasi, id: 19)
        changColoer(name: Nagano, id: 20)
        changColoer(name: Gihu, id: 21)
        changColoer(name: Sizuoka, id: 22)
        changColoer(name: Aiti, id: 23)
        changColoer(name: Mie, id: 24)
        changColoer(name: Shiga, id: 25)
        changColoer(name: Kyoto, id: 26)
        changColoer(name: Osaka, id: 27)
        changColoer(name: Hyougo, id: 28)
        changColoer(name: Nara, id: 29)
        changColoer(name: Wakayama, id: 30)
        changColoer(name: Tottori, id: 31)
        changColoer(name: Simane, id: 32)
        changColoer(name: Okayama, id: 33)
        changColoer(name: Hirosima, id: 34)
        changColoer(name: Yamaguti, id: 35)
        changColoer(name: Tokusima, id: 36)
        changColoer(name: Kagawa, id: 37)
        changColoer(name: Ehima, id: 38)
        changColoer(name: Kouti, id: 39)
        changColoer(name: Hukuoka, id: 40)
        changColoer(name: Saga, id: 41)
        changColoer(name: Nagasaki, id: 42)
        changColoer(name: Kumamoto, id: 43)
        changColoer(name: Oita, id: 44)
        changColoer(name: Miyazaki, id: 45)
        changColoer(name: Kagosima, id: 46)
        changColoer(name: Okinawa, id: 47)
               
    }
    
    func changColoer(name: UIImageView, id: Int){
        
        // 0: 灰
        // 1 ~ 99:  緑
        // 100 ~ 199: 黄
        // 200 ~ 499: オレンジ
        // 500 ~ 999: 赤
        // 1000 ~ 1999: 濃い赤
        // 2000 ~ : 黒
                
        switch dataArray[id - 1].patients {
        case 0:
            name.tintColor = .init(red: 200/255, green: 200/255, blue: 200/255, alpha: 1)
        case 1..<100:
            name.tintColor = .init(red: 0/255, green: 255/255, blue: 0/255, alpha: 1)
        case 100..<200:
            name.tintColor = .init(red: 255/255, green: 255/255, blue: 0/255, alpha: 1)
        case 200..<500:
            name.tintColor = .init(red: 255/255, green: 130/255, blue: 0/255, alpha: 1)
        case 500..<1000:
            name.tintColor = .init(red: 255/255, green: 0/255, blue: 0/255, alpha: 1)
        case 1000..<2000:
            name.tintColor = .init(red: 130/255, green: 0/255, blue: 0/255, alpha: 1)
        case 2000..<1000000:
            name.tintColor = .init(red: 80/255, green: 0/255, blue: 0/255, alpha: 1)
        default:
            break
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
