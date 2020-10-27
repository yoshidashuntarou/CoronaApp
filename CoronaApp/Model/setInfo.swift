//
//  getInfo.swift
//  CoronaApp
//
//  Created by 吉田俊太郎 on 2020/05/22.
//  Copyright © 2020 Shuntaro Yoshida. All rights reserved.
//

// 国内のデータhttps://covid19-japan-web-api.now.sh/api/v1/total

import Foundation
import Alamofire
import SwiftyJSON

var dataDate: String = ""
var didSetData = 0
var japanCases = -1
var japanDeaths = -1
var japanCases2 = -1
var japanDeaths2 = -1

var dataArray: [(id: Int, name: String, patients: Int, deaths: Int, patients2: Int, deaths2: Int, url: String)] = [
    (id: 1, name: "北海道", patients: -1, deaths: -1, patients2: -1, deaths2: -1, url: "http://www.pref.hokkaido.lg.jp/ss/ssa/singatakoronahaien.htm"),
    (id: 2, name: "青森", patients: -1, deaths: -1, patients2: -1, deaths2: -1, url: "https://www.pref.aomori.lg.jp/welfare/health/wuhan-novel-coronavirus2020.html"),
    (id: 3, name: "岩手", patients: -1, deaths: -1, patients2: -1, deaths2: -1, url: "https://www.pref.iwate.jp/kurashikankyou/iryou/covid19/index.html"),
    (id: 4, name: "宮城", patients: -1, deaths: -1, patients2: -1, deaths2: -1, url: "https://www.pref.miyagi.jp/site/covid-19/"),
    (id: 5, name: "秋田", patients: -1, deaths: -1, patients2: -1, deaths2: -1, url: "https://www.pref.akita.lg.jp/pages/archive/47957"),
    (id: 6, name: "山形", patients: -1, deaths: -1, patients2: -1, deaths2: -1, url: "https://www.pref.yamagata.jp/ou/bosai/020072/kochibou/coronavirus/coronavirus.html"),
    (id: 7, name: "福島", patients: -1, deaths: -1, patients2: -1, deaths2: -1, url: "https://www.pref.fukushima.lg.jp/sec/21045c/coronavirus-list.html"),
    (id: 8, name: "茨城", patients: -1, deaths: -1, patients2: -1, deaths2: -1, url: "https://www.pref.ibaraki.jp/hokenfukushi/yobo/kiki/yobo/kansen/idwr/information/other/documents/20200130-corona.html"),
    (id: 9, name: "栃木", patients: -1, deaths: -1, patients2: -1, deaths2: -1, url: "http://www.pref.tochigi.lg.jp/e04/welfare/hoken-eisei/kansen/hp/coronakensahasseijyoukyou.html"),
    (id: 10, name: "群馬", patients: -1, deaths: -1, patients2: -1, deaths2: -1, url: "https://www.pref.gunma.jp/02/d29g_00243.html"),
    (id: 11, name: "埼玉", patients: -1, deaths: -1, patients2: -1, deaths2: -1, url: "https://www.pref.saitama.lg.jp/a0701/shingatacoronavirus.html"),
    (id: 12, name: "千葉", patients: -1, deaths: -1, patients2: -1, deaths2: -1, url: "https://www.pref.chiba.lg.jp/cate/kfk/kenkou-iryou/kenkouzukuri/kansenshou/coronavirus.html"),
    (id: 13, name: "東京", patients: -1, deaths: -1, patients2: -1, deaths2: -1, url: "https://stopcovid19.metro.tokyo.lg.jp/"),
    (id: 14, name: "神奈川", patients: -1, deaths: -1, patients2: -1, deaths2: -1, url: "https://www.pref.kanagawa.jp/osirase/1369/"),
    (id: 15, name: "新潟", patients: -1, deaths: -1, patients2: -1, deaths2: -1, url: "https://www.pref.niigata.lg.jp/sec/kenko/covid19.html"),
    (id: 16, name: "富山", patients: -1, deaths: -1, patients2: -1, deaths2: -1, url: "http://www.pref.toyama.jp/sections/1118/virus/index.html"),
    (id: 17, name: "石川", patients: -1, deaths: -1, patients2: -1, deaths2: -1, url: "https://www.pref.ishikawa.lg.jp/kansen/corona.html"),
    (id: 18, name: "福井", patients: -1, deaths: -1, patients2: -1, deaths2: -1, url: "https://www.pref.fukui.lg.jp/doc/kenkou/kansensyo-yobousessyu/corona.html"),
    (id: 19, name: "山梨", patients: -1, deaths: -1, patients2: -1, deaths2: -1, url: "https://www.pref.yamanashi.jp/koucho/coronavirus/info_coronavirus.html"),
    (id: 20, name: "長野", patients: -1, deaths: -1, patients2: -1, deaths2: -1, url: "https://www.pref.nagano.lg.jp/hoken-shippei/kenko/kenko/kansensho/joho/corona.html"),
    (id: 21, name: "岐阜", patients: -1, deaths: -1, patients2: -1, deaths2: -1, url: "https://www.pref.gifu.lg.jp/kinkyu-juyo-joho/shingata_corona.html"),
    (id: 22, name: "静岡", patients: -1, deaths: -1, patients2: -1, deaths2: -1, url: "https://www.pref.shizuoka.jp/kinkyu/covid-19.html"),
    (id: 23, name: "愛知", patients: -1, deaths: -1, patients2: -1, deaths2: -1, url: "https://www.pref.aichi.jp/site/covid19-aichi/"),
    (id: 24, name: "三重", patients: -1, deaths: -1, patients2: -1, deaths2: -1, url: "https://www.pref.mie.lg.jp/covid19.shtm"),
    (id: 25, name: "滋賀", patients: -1, deaths: -1, patients2: -1, deaths2: -1, url: "https://www.pref.shiga.lg.jp/ippan/kenkouiryouhukushi/yakuzi/309252.html"),
    (id: 26, name: "京都", patients: -1, deaths: -1, patients2: -1, deaths2: -1, url: "https://www.pref.kyoto.jp/kentai/news/novelcoronavirus.html"),
    (id: 27, name: "大阪", patients: -1, deaths: -1, patients2: -1, deaths2: -1, url: "http://www.pref.osaka.lg.jp/iryo/osakakansensho/corona.html"),
    (id: 28, name: "兵庫", patients: -1, deaths: -1, patients2: -1, deaths2: -1, url: "https://web.pref.hyogo.lg.jp/kk03/200129.html"),
    (id: 29, name: "奈良", patients: -1, deaths: -1, patients2: -1, deaths2: -1, url: "http://www.pref.nara.jp/"),
    (id: 30, name: "和歌山", patients: -1, deaths: -1, patients2: -1, deaths2: -1, url: "https://www.pref.wakayama.lg.jp/prefg/000200/covid19.html"),
    (id: 31, name: "鳥取", patients: -1, deaths: -1, patients2: -1, deaths2: -1, url: "https://www.pref.tottori.lg.jp/item/1197213.htm"),
    (id: 32, name: "島根", patients: -1, deaths: -1, patients2: -1, deaths2: -1, url: "https://www.pref.shimane.lg.jp/bousai_info/bousai/kikikanri/shingata_taisaku/new_coronavirus_portal.html"),
    (id: 33, name: "岡山", patients: -1, deaths: -1, patients2: -1, deaths2: -1, url: "https://www.pref.okayama.jp/kinkyu/645925.html"),
    (id: 34, name: "広島", patients: -1, deaths: -1, patients2: -1, deaths2: -1, url: "https://www.pref.hiroshima.lg.jp/site/2019-ncov/"),
    (id: 35, name: "山口", patients: -1, deaths: -1, patients2: -1, deaths2: -1, url: "https://www.pref.yamaguchi.lg.jp/cms/a15200/kansensyou/ncorona.html"),
    (id: 36, name: "徳島", patients: -1, deaths: -1, patients2: -1, deaths2: -1, url: "https://www.pref.tokushima.lg.jp/ippannokata/kenko/kansensho/5034012"),
    (id: 37, name: "香川", patients: -1, deaths: -1, patients2: -1, deaths2: -1, url: "https://www.pref.kagawa.lg.jp/content/etc/subsite/kansenshoujouhou/kansen/sr5cfn200127213457.shtml"),
    (id: 38, name: "愛媛", patients: -1, deaths: -1, patients2: -1, deaths2: -1, url: "https://www.pref.ehime.jp/h25500/kansen/covid19.html"),
    (id: 39, name: "高知", patients: -1, deaths: -1, patients2: -1, deaths2: -1, url: "https://www.pref.kochi.lg.jp/soshiki/111301/info-COVID-19.html"),
    (id: 40, name: "福岡", patients: -1, deaths: -1, patients2: -1, deaths2: -1, url: "https://www.pref.fukuoka.lg.jp/contents/covid-19-portal.html"),
    (id: 41, name: "佐賀", patients: -1, deaths: -1, patients2: -1, deaths2: -1, url: "https://www.pref.saga.lg.jp/list04342.html"),
    (id: 42, name: "長崎", patients: -1, deaths: -1, patients2: -1, deaths2: -1, url: "https://www.pref.nagasaki.jp/bunrui/hukushi-hoken/kansensho/corona_nagasaki/"),
    (id: 43, name: "熊本", patients: -1, deaths: -1, patients2: -1, deaths2: -1, url: "https://www.pref.kumamoto.jp/hpkiji/pub/List.aspx?c_id=3&class_set_id=1&class_id=7049"),
    (id: 44, name: "大分", patients: -1, deaths: -1, patients2: -1, deaths2: -1, url: "https://www.pref.oita.jp/site/bosaianzen/shingatacorona.html"),
    (id: 45, name: "宮崎", patients: -1, deaths: -1, patients2: -1, deaths2: -1, url: "https://www.pref.miyazaki.lg.jp/covid-19/index.html"),
    (id: 46, name: "鹿児島", patients: -1, deaths: -1, patients2: -1, deaths2: -1, url: "https://www.pref.kagoshima.jp/ae06/kenko-fukushi/kenko-iryo/kansen/kansensho/coronavirus.html"),
    (id: 47, name: "沖縄", patients: -1, deaths: -1, patients2: -1, deaths2: -1, url: "https://www.pref.okinawa.jp/site/hoken/chiikihoken/kekkaku/covid19_hasseijoukyou.html"),
]

//func setInfo() {
//
//    for i in 0..<47 {
//        AF.request("https://covid19-japan-web-api.now.sh/api/v1/prefectures").responseJSON { response in
//                       switch response.result {
//                       case .success(let data):
//
//                           let jsonObject = JSON(data)
//                           let cases = jsonObject[i]["cases"].intValue
//                           let deaths = jsonObject[i]["deaths"].intValue
//
////                           print("name: \(dataArray[i].name), cases: \(cases), deaths: \(deaths)")
//
//                           dataArray[i].cases = cases
//                           dataArray[i].deaths = deaths
//
//                       case .failure(let error):
//
//                            print("エラーが発生しました")
//                           print(error)
//                       }
//                   }
//        }
//
//    }
    

    //teratail
// AF.request("https://www.stopcovid19.jp/data/covid19japan-all.json").responseJSON { response in
//             switch response.result {
//             case .success(let data):
//
//                 let jsonObject = JSON(data)
//
//                 let date = jsonObject[jsonObject.count - 1]["lastUpdate"].stringValue
//                 let patients = jsonObject[jsonObject.count - 1]["area"][0]["npatients"].intValue
//                 let deaths = jsonObject[jsonObject.count - 1]["area"][0]["ndeaths"].intValue
//
//
//                 japanPatients = patients
//                 japanDeaths = deaths
//
//             case .failure(let error):
//
//                 print(error.localizedDescription)
//
//             }
//         }


func setData() {
    
    
    AF.request("https://covid19-japan-web-api.now.sh/api/v1/total?history=true").responseJSON { response in
        switch response.result {
        case .success(let data):
                    
            let jsonObject = JSON(data)

//            let date = jsonObject[jsonObject.count - 1]["date"].stringValue
//            let pcr = jsonObject[jsonObject.count - 1]["pcr"].intValue
            let cases = jsonObject[jsonObject.count - 1]["positive"].intValue
            let deaths = jsonObject[jsonObject.count - 1]["death"].intValue
            let cases2 = jsonObject[jsonObject.count - 2]["positive"].intValue
            let deaths2 = jsonObject[jsonObject.count - 2]["death"].intValue
                    
                    
            japanCases = cases
            japanCases2 = cases2
            japanDeaths = deaths
            japanDeaths2 = deaths2
                        
                        
            print("全国の感染者数：\(cases), 死亡者数：\(deaths)")
                        
                        
        case .failure(let error):

            print("setInfoの全国データ取得でエラーが起きました")
            print(error.localizedDescription)
            
                        
        }
    }
    
        
    for i in 0..<47 {
        AF.request("https://www.stopcovid19.jp/data/covid19japan-all.json").responseJSON { response in
            switch response.result {
            case .success(let data):

                let jsonObject = JSON(data)

                let date = jsonObject[jsonObject.count - 1]["lastUpdate"].stringValue
//                let name = jsonObject[jsonObject.count - 1]["area"][i]["name_jp"].stringValue
                let patients = jsonObject[jsonObject.count - 1]["area"][i]["npatients"].intValue
                let deaths = jsonObject[jsonObject.count - 1]["area"][i]["ndeaths"].intValue
                let patients2 = jsonObject[jsonObject.count - 2]["area"][i]["npatients"].intValue
                let deaths2 = jsonObject[jsonObject.count - 2]["area"][i]["ndeaths"].intValue
                
                
                print("id: \(dataArray[i].id), name: \(dataArray[i].name), patients: \(patients), deaths: \(deaths), patients2: \(patients2), deaths2: \(deaths2)")
                
                dataDate = date
                
                dataArray[i].patients = patients
                dataArray[i].deaths = deaths
                dataArray[i].patients2 = patients2
                dataArray[i].deaths2 = deaths2
                
                
            case .failure(let error):

                print("setInfoの国内データ取得でエラーが起きました")
                print(error.localizedDescription)
                
            }
        }
    }
}
