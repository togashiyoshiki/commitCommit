//
//  oneDayViewController.swift
//  commitCommit
//
//  Created by togashi yoshiki on 2017/08/08.
//  Copyright © 2017年 Yoshiki Togashi. All rights reserved.
//

import UIKit
import GoogleMobileAds
class oneDayViewController: UIViewController,GADBannerViewDelegate {
 
    ///じぶんのAdMobIDを指定指定します
    let AdMobID = "ca-app-pub-3530000000000000/0123456789"
    let TEST_DEVICE_ID = "61b0154xxxxxxxxxxxxxxxxxxxxxxxe0"
    
    ///テスト用
    let AdMobTest:Bool = true
    let SimulatorTest:Bool = true
    
    
    
    //MARK:時間管理 　開始時間
    var time1:String = "2000-01-01 07:00:00"
    var time2:String = "2000-01-01 08:00:00"
    var time3:String = "2000-01-01 10:00:00"
    var time4:String = "2000-01-01 12:00:00"
    var time5:String = "2000-01-01 13:00:00"
    var time6:String = "2000-01-01 15:00:00"
    var time7:String = "2000-01-01 16:00:00"
    var time8:String = "2000-01-01 17:00:00"
    var time9:String = "2000-01-01 19:00:00"
    var time10:String = "2000-01-01 20:00:00"
    var time11:String = "2000-01-01 21:30:00"
    var time12:String = "2000-01-01 22:00:00"
    var time13:String = "2000-01-01 23:00:00"
    //MARK:時間管理 　終了時間
    var time111:String = "2000-01-01 07:30:00"
    var time222:String = "2000-01-01 08:30:00"
    var time333:String = "2000-01-01 10:30:00"
    var time444:String = "2000-01-01 12:30:00"
    var time555:String = "2000-01-01 13:30:00"
    var time666:String = "2000-01-01 15:30:00"
    var time777:String = "2000-01-01 16:30:00"
    var time888:String = "2000-01-01 17:30:00"
    var time999:String = "2000-01-01 20:30:00"
    var time101010:String = "2000-01-01 20:30:00"
    var time111111:String = "2000-01-01 21:30:00"
    var time121212:String = "2000-01-01 22:30:00"
    var time131313:String = "2000-01-01 23:30:00"
    
//    時間計算後受け渡し時間
    var myTime1:Double = 0.0
    var myTime2:Double = 0.0
    var myTime3:Double = 0.0
    var myTime4:Double = 0.0
    var myTime5:Double = 0.0
    var myTime6:Double = 0.0
    var myTime7:Double = 0.0
    var myTime8:Double = 0.0
    var myTime9:Double = 0.0
    var myTime10:Double = 0.0
    var myTime11:Double = 0.0
    var myTime12:Double = 0.0
    var myTime13:Double = 0.0
    

    //MARK:部品　Text
    @IBOutlet weak var TextField1: UITextField!
    @IBOutlet weak var TextField2: UITextField!
    @IBOutlet weak var TextField3: UITextField!
    @IBOutlet weak var TextField4: UITextField!
    @IBOutlet weak var TextField5: UITextField!
    @IBOutlet weak var TextField6: UITextField!
    @IBOutlet weak var TextField7: UITextField!
    @IBOutlet weak var TextField8: UITextField!
    @IBOutlet weak var TextField9: UITextField!
    @IBOutlet weak var TextField10: UITextField!
    @IBOutlet weak var TextField11: UITextField!
    @IBOutlet weak var TextField12: UITextField!
    @IBOutlet weak var TextField13: UITextField!
    
    //MARK:部品   Time　開始時間
    @IBOutlet weak var DatePicker1: UIDatePicker!
    @IBOutlet weak var DatePicker2: UIDatePicker!
    @IBOutlet weak var DatePicker3: UIDatePicker!
    @IBOutlet weak var DatePicker4: UIDatePicker!
    @IBOutlet weak var DatePicker5: UIDatePicker!
    @IBOutlet weak var DatePicker6: UIDatePicker!
    @IBOutlet weak var DatePicker7: UIDatePicker!
    @IBOutlet weak var DatePicker8: UIDatePicker!
    @IBOutlet weak var DatePicker9: UIDatePicker!
    @IBOutlet weak var DatePicker10: UIDatePicker!
    @IBOutlet weak var DatePicker11: UIDatePicker!
    @IBOutlet weak var DatePicker12: UIDatePicker!
    @IBOutlet weak var DatePicker13: UIDatePicker!
    
    //MARK:部品   Time　終了時間
    @IBOutlet weak var DatePicker111: UIDatePicker!
    @IBOutlet weak var DatePicker222: UIDatePicker!
    @IBOutlet weak var DatePicker333: UIDatePicker!
    @IBOutlet weak var DatePicker444: UIDatePicker!
    @IBOutlet weak var DatePicker555: UIDatePicker!
    @IBOutlet weak var DatePicker666: UIDatePicker!
    @IBOutlet weak var DatePicker777: UIDatePicker!
    @IBOutlet weak var DatePicker888: UIDatePicker!
    @IBOutlet weak var DatePicker999: UIDatePicker!
    @IBOutlet weak var DatePicker101010: UIDatePicker!
    @IBOutlet weak var DatePicker111111: UIDatePicker!
    @IBOutlet weak var DatePicker121212: UIDatePicker!
    @IBOutlet weak var DatePicker131313:UIDatePicker!
    
    //    MARK:DatePickerのString変換
    ///開始時間
    
    @IBAction func Date1(_ sender: UIDatePicker) {
        let df  = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        time1 = df.string(from: sender.date)
    }
    
    @IBAction func Date2(_ sender: UIDatePicker) {
        let df  = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        time2 = df.string(from: sender.date)
        
        
        //        選択可能な最小値を設定(最も古い日)
        DatePicker2.minimumDate = df.date(from: time111)
        
    }
    
    @IBAction func Date3(_ sender: UIDatePicker) {
        let df  = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        time3 = df.string(from: sender.date)
        //        選択可能な最小値を設定(最も古い日)
        DatePicker3.minimumDate = df.date(from: time222)
    }
    
    @IBAction func Date4(_ sender: UIDatePicker) {
        let df  = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        time4 = df.string(from: sender.date)
        //        選択可能な最小値を設定(最も古い日)
        DatePicker4.minimumDate = df.date(from: time333)
    }
    
    @IBAction func Date5(_ sender: UIDatePicker) {
        let df  = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        time5 = df.string(from: sender.date)
        //        選択可能な最小値を設定(最も古い日)
        DatePicker5.minimumDate = df.date(from: time444)
    }
    
    @IBAction func Date6(_ sender: UIDatePicker) {
        let df  = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        time6 = df.string(from: sender.date)
        //        選択可能な最小値を設定(最も古い日)
        DatePicker6.minimumDate = df.date(from: time555)
    }
    
    @IBAction func Date7(_ sender: UIDatePicker) {
        let df  = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        time7 = df.string(from: sender.date)
        //        選択可能な最小値を設定(最も古い日)
        DatePicker7.minimumDate = df.date(from: time666)
    }
    
    @IBAction func Date8(_ sender: UIDatePicker) {
        let df  = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        time8 = df.string(from: sender.date)
        //        選択可能な最小値を設定(最も古い日)
        DatePicker8.minimumDate = df.date(from: time777)
    }
    
    @IBAction func Date9(_ sender: UIDatePicker) {
        let df  = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        time9 = df.string(from: sender.date)
        //        選択可能な最小値を設定(最も古い日)
        DatePicker9.minimumDate = df.date(from: time888)
    }
    
    @IBAction func Date10(_ sender: UIDatePicker) {
        let df  = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        time10 = df.string(from: sender.date)
        //        選択可能な最小値を設定(最も古い日)
        DatePicker10.minimumDate = df.date(from: time999)
    }
    
    @IBAction func Date11(_ sender: UIDatePicker) {
        let df  = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        time11 = df.string(from: sender.date)
        //        選択可能な最小値を設定(最も古い日)
        DatePicker11.minimumDate = df.date(from: time101010)
    }
    
    @IBAction func Date12(_ sender: UIDatePicker) {
        let df  = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        time12 = df.string(from: sender.date)
        //        選択可能な最小値を設定(最も古い日)
        DatePicker12.minimumDate = df.date(from: time111111)
    }
    
    @IBAction func Date13(_ sender: UIDatePicker) {
        let df  = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        time13 = df.string(from: sender.date)
        //        選択可能な最小値を設定(最も古い日)
        DatePicker13.minimumDate = df.date(from: time121212)
    }
    
    //    MARK:DatePickerのString変換
    ///終了時間
    @IBAction func Date111(_ sender: UIDatePicker) {
        let df  = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        time111 = df.string(from: sender.date)
    }
    
    @IBAction func Date222(_ sender: UIDatePicker) {
        let df  = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        time222 = df.string(from: sender.date)
    }
    
    @IBAction func Date333(_ sender: UIDatePicker) {
        let df  = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        time333 = df.string(from: sender.date)
    }
    
    @IBAction func Date444(_ sender: UIDatePicker) {
        let df  = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        time444 = df.string(from: sender.date)
    }
    
    @IBAction func Date555(_ sender: UIDatePicker) {
        let df  = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        time555 = df.string(from: sender.date)
    }
    
    @IBAction func Date666(_ sender: UIDatePicker) {
        let df  = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        time666 = df.string(from: sender.date)
    }
    
    @IBAction func Date777(_ sender: UIDatePicker) {
        let df  = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        time777 = df.string(from: sender.date)
    }
    
    @IBAction func Date888(_ sender: UIDatePicker) {
        let df  = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        time888 = df.string(from: sender.date)
    }
    
    @IBAction func Date999(_ sender: UIDatePicker) {
        let df  = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        time999 = df.string(from: sender.date)
    }
    
    @IBAction func Date101010(_ sender: UIDatePicker) {
        let df  = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        time101010 = df.string(from: sender.date)
    }
    
    @IBAction func Date111111(_ sender: UIDatePicker) {
        let df  = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        time111111 = df.string(from: sender.date)
    }
    
    @IBAction func Date121212(_ sender: UIDatePicker) {
        let df  = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        time121212 = df.string(from: sender.date)
    }
    
    @IBAction func Date131313(_ sender: UIDatePicker) {
        let df  = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        time131313 = df.string(from: sender.date)
    }
    
    //    MARK:追加ボタンの処理
    @IBAction func addBtn(_ sender: UIButton) {
                
        
        //        MARK:commitNAME
        if TextField1.text == nil || TextField1.text == "" || TextField2.text == nil || TextField2.text == "" || TextField3.text == nil || TextField3.text == "" || TextField4.text == nil || TextField4.text == "" || TextField5.text == nil || TextField5.text == "" || TextField6.text == nil || TextField6.text == "" || TextField7.text == nil || TextField7.text == "" || TextField8.text == nil || TextField8.text == "" || TextField9.text == nil || TextField9.text == "" || TextField10.text == nil || TextField10.text == "" || TextField11.text == nil || TextField11.text == "" || TextField12.text == nil || TextField12.text == "" || TextField13.text == nil || TextField13.text == "" || time1 == nil || time1 == "" || time2 == nil || time2 == "" || time3 == nil || time3 == "" || time4 == nil || time4 == "" || time5 == nil || time5 == "" || time6 == nil || time6 == "" || time7 == nil || time7 == "" || time8 == nil || time8 == "" || time9 == nil || time9 == "" || time10 == nil || time10 == "" || time11 == nil || time11 == "" || time12 == nil || time12 == "" || time13 == nil || time13 == "" || time111 == nil || time111 == "" || time222 == nil || time222 == "" || time333 == nil || time333 == "" || time444 == nil || time444 == "" || time555 == nil || time555 == "" || time666 == nil || time666 == "" || time777 == nil || time777 == "" || time888 == nil || time888 == "" || time999 == nil || time999 == "" || time101010 == nil || time101010 == "" || time111111 == nil || time111111 == "" || time121212 == nil || time121212 == "" || time131313 == nil || time131313 == "" {
            //           文字が入力されなかった場合の処理
            hoge(huga:TextField1)
            hoge(huga:TextField2)
            hoge(huga:TextField3)
            hoge(huga:TextField4)
            hoge(huga:TextField5)
            hoge(huga:TextField6)
            hoge(huga:TextField7)
            hoge(huga:TextField8)
            hoge(huga:TextField9)
            hoge(huga:TextField10)
            hoge(huga:TextField11)
            hoge(huga:TextField12)
            hoge(huga:TextField13)
            
        }else{
            
            let df  = DateFormatter()
            //            日本時間
            df.locale = NSLocale(localeIdentifier: "ja_JP") as Locale
            //            ２４H表記
            df.dateFormat = "yyyy-MM-dd HH:mm:ss"
            
            var electData1:NSDate = df.date(from: time1) as! NSDate
            var electData2:NSDate = df.date(from: time2) as! NSDate
            var electData3:NSDate = df.date(from: time3) as! NSDate
            var electData4:NSDate = df.date(from: time4) as! NSDate
            var electData5:NSDate = df.date(from: time5) as! NSDate
            var electData6:NSDate = df.date(from: time6) as! NSDate
            var electData7:NSDate = df.date(from: time7) as! NSDate
            var electData8:NSDate = df.date(from: time8) as! NSDate
            var electData9:NSDate = df.date(from: time9) as! NSDate
            var electData10:NSDate = df.date(from: time10) as! NSDate
            var electData11:NSDate = df.date(from: time11) as! NSDate
            var electData12:NSDate = df.date(from: time12) as! NSDate
            var electData13:NSDate = df.date(from: time13) as! NSDate
            
            
            var electData111:NSDate = df.date(from: time111) as! NSDate
            var electData222:NSDate = df.date(from: time222) as! NSDate
            var electData333:NSDate = df.date(from: time333) as! NSDate
            var electData444:NSDate = df.date(from: time444) as! NSDate
            var electData555:NSDate = df.date(from: time555) as! NSDate
            var electData666:NSDate = df.date(from: time666) as! NSDate
            var electData777:NSDate = df.date(from: time777) as! NSDate
            var electData888:NSDate = df.date(from: time888) as! NSDate
            var electData999:NSDate = df.date(from: time999) as! NSDate
            var electData101010:NSDate = df.date(from: time101010) as! NSDate
            var electData111111:NSDate = df.date(from: time111111) as! NSDate
            var electData121212:NSDate = df.date(from: time121212) as! NSDate
            var electData131313:NSDate = df.date(from: time131313) as! NSDate
            //            時間の計算(秒数の割り出し)
            var retInterval1 = electData111.timeIntervalSince(electData1 as Date)
            var retInterval2 = electData222.timeIntervalSince(electData2 as Date)
            var retInterval3 = electData333.timeIntervalSince(electData3 as Date)
            var retInterval4 = electData444.timeIntervalSince(electData4 as Date)
            var retInterval5 = electData555.timeIntervalSince(electData5 as Date)
            var retInterval6 = electData666.timeIntervalSince(electData6 as Date)
            var retInterval7 = electData777.timeIntervalSince(electData7 as Date)
            var retInterval8 = electData888.timeIntervalSince(electData8 as Date)
            var retInterval9 = electData999.timeIntervalSince(electData9 as Date)
            var retInterval10 = electData101010.timeIntervalSince(electData10 as Date)
            var retInterval11 = electData111111.timeIntervalSince(electData11 as Date)
            var retInterval12 = electData121212.timeIntervalSince(electData12 as Date)
            var retInterval13 = electData131313.timeIntervalSince(electData13 as Date)
            
            
            
            if retInterval1 > 86400 || retInterval1 < 0 || retInterval2 > 86400 || retInterval2 < 0 || retInterval3 > 86400 || retInterval3 < 0 || retInterval4 > 86400 || retInterval4 < 0 || retInterval5 > 86400 || retInterval5 < 0 || retInterval6 > 86400 || retInterval6 < 0 || retInterval7 > 86400 || retInterval7 < 0 || retInterval8 > 86400 || retInterval8 < 0 || retInterval9 > 86400 || retInterval9 < 0 || retInterval10 > 86400 || retInterval10 < 0  || retInterval11 > 86400  || retInterval11 < 0  || retInterval12 > 86400  || retInterval12 < 0  || retInterval13 > 86400 || retInterval13 < 0 {
                print("不適切な時間です。")
                
                picker1(pic:retInterval1,DatePicker:DatePicker111)
                picker1(pic:retInterval2,DatePicker:DatePicker222)
                picker1(pic:retInterval3,DatePicker:DatePicker333)
                picker1(pic:retInterval4,DatePicker:DatePicker444)
                picker1(pic:retInterval5,DatePicker:DatePicker555)
                picker1(pic:retInterval6,DatePicker:DatePicker666)
                picker1(pic:retInterval7,DatePicker:DatePicker777)
                picker1(pic:retInterval8,DatePicker:DatePicker888)
                picker1(pic:retInterval9,DatePicker:DatePicker999)
                picker1(pic:retInterval10,DatePicker:DatePicker101010)
                picker1(pic:retInterval11,DatePicker:DatePicker111111)
                picker1(pic:retInterval12,DatePicker:DatePicker121212)
                picker1(pic:retInterval13,DatePicker:DatePicker131313)
            }else{
                
                
                
                //                データピッカーの色を全て黒にする
                timeCollar(Picker:DatePicker111)
                timeCollar(Picker:DatePicker222)
                timeCollar(Picker:DatePicker333)
                timeCollar(Picker:DatePicker444)
                timeCollar(Picker:DatePicker555)
                timeCollar(Picker:DatePicker666)
                timeCollar(Picker:DatePicker777)
                timeCollar(Picker:DatePicker888)
                timeCollar(Picker:DatePicker999)
                timeCollar(Picker:DatePicker101010)
                timeCollar(Picker:DatePicker111111)
                timeCollar(Picker:DatePicker121212)
                timeCollar(Picker:DatePicker131313)
                
                
               
                let df  = DateFormatter()
                //            日本時間
                df.locale = NSLocale(localeIdentifier: "ja_JP") as Locale
                //            ２４H表記
                df.dateFormat = "yyyy-MM-dd HH:mm:ss"
                
                var electData1:NSDate = df.date(from: time1) as! NSDate
                var electData2:NSDate = df.date(from: time2) as! NSDate
                var electData3:NSDate = df.date(from: time3) as! NSDate
                var electData4:NSDate = df.date(from: time4) as! NSDate
                var electData5:NSDate = df.date(from: time5) as! NSDate
                var electData6:NSDate = df.date(from: time6) as! NSDate
                var electData7:NSDate = df.date(from: time7) as! NSDate
                var electData8:NSDate = df.date(from: time8) as! NSDate
                var electData9:NSDate = df.date(from: time9) as! NSDate
                var electData10:NSDate = df.date(from: time10) as! NSDate
                var electData11:NSDate = df.date(from: time11) as! NSDate
                var electData12:NSDate = df.date(from: time12) as! NSDate
                var electData13:NSDate = df.date(from: time13) as! NSDate
                
                
                var electData111:NSDate = df.date(from: time111) as! NSDate
                var electData222:NSDate = df.date(from: time222) as! NSDate
                var electData333:NSDate = df.date(from: time333) as! NSDate
                var electData444:NSDate = df.date(from: time444) as! NSDate
                var electData555:NSDate = df.date(from: time555) as! NSDate
                var electData666:NSDate = df.date(from: time666) as! NSDate
                var electData777:NSDate = df.date(from: time777) as! NSDate
                var electData888:NSDate = df.date(from: time888) as! NSDate
                var electData999:NSDate = df.date(from: time999) as! NSDate
                var electData101010:NSDate = df.date(from: time101010) as! NSDate
                var electData111111:NSDate = df.date(from: time111111) as! NSDate
                var electData121212:NSDate = df.date(from: time121212) as! NSDate
                var electData131313:NSDate = df.date(from: time131313) as! NSDate
                //            時間の計算(秒数の割り出し)
                var retInterval1 = electData111.timeIntervalSince(electData1 as Date)
                var retInterval2 = electData222.timeIntervalSince(electData2 as Date)
                var retInterval3 = electData333.timeIntervalSince(electData3 as Date)
                var retInterval4 = electData444.timeIntervalSince(electData4 as Date)
                var retInterval5 = electData555.timeIntervalSince(electData5 as Date)
                var retInterval6 = electData666.timeIntervalSince(electData6 as Date)
                var retInterval7 = electData777.timeIntervalSince(electData7 as Date)
                var retInterval8 = electData888.timeIntervalSince(electData8 as Date)
                var retInterval9 = electData999.timeIntervalSince(electData9 as Date)
                var retInterval10 = electData101010.timeIntervalSince(electData10 as Date)
                var retInterval11 = electData111111.timeIntervalSince(electData11 as Date)
                var retInterval12 = electData121212.timeIntervalSince(electData12 as Date)
                var retInterval13 = electData131313.timeIntervalSince(electData13 as Date)
            
                
//            double型を変数に格納
                myTime1 = retInterval1
                myTime2 = retInterval2
                myTime3 = retInterval3
                myTime4 = retInterval4
                myTime5 = retInterval5
                myTime6 = retInterval6
                myTime7 = retInterval7
                myTime8 = retInterval8
                myTime9 = retInterval9
                myTime10 = retInterval10
                myTime11 = retInterval11
                myTime12 = retInterval12
                myTime13 = retInterval13
                
                
                
                
                
                
                performSegue(withIdentifier: "Segue", sender: nil)
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //        guestの中身segueに飛んだSecondViewControllerクラスの継承している
        if (segue.identifier == "Segue") {
            let guest = segue.destination as! CommitViewViewController
           
            ///項目
            guest.item1 = TextField1.text!
            guest.item2 = TextField2.text!
            guest.item3 = TextField3.text!
            guest.item4 = TextField4.text!
            guest.item5 = TextField5.text!
            guest.item6 = TextField6.text!
            guest.item7 = TextField7.text!
            guest.item8 = TextField8.text!
            guest.item9 = TextField9.text!
            guest.item10 = TextField10.text!
            guest.item11 = TextField11.text!
            guest.item12 = TextField12.text!
            guest.item13 = TextField13.text!
            
             guest.commitTimeText1 = myTime1
             guest.commitTimeText2 = myTime2
             guest.commitTimeText3 = myTime3
             guest.commitTimeText4 = myTime4
             guest.commitTimeText5 = myTime5
             guest.commitTimeText6 = myTime6
             guest.commitTimeText7 = myTime7
             guest.commitTimeText8 = myTime8
             guest.commitTimeText9 = myTime9
             guest.commitTimeText10 = myTime10
             guest.commitTimeText11 = myTime11
             guest.commitTimeText12 = myTime12
             guest.commitTimeText13 = myTime13
            
            
            
        }
    }
    
    
    
    @IBAction func back(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showAdBanner()
        
        let df  = DateFormatter()
        df.locale = NSLocale(localeIdentifier: "ja_JP") as Locale
        df.dateFormat = "HH:mm"
        
        DatePicker1.date  = df.date(from: "07:00")!
        DatePicker2.date  = df.date(from: "08:00")!
        DatePicker3.date  = df.date(from: "10:00")!
        DatePicker4.date  = df.date(from: "12:00")!
        DatePicker5.date  = df.date(from: "13:00")!
        DatePicker6.date  = df.date(from: "15:00")!
        DatePicker7.date  = df.date(from: "16:00")!
        DatePicker8.date  = df.date(from: "17:00")!
        DatePicker9.date  = df.date(from: "19:00")!
        DatePicker10.date  = df.date(from: "20:00")!
        DatePicker11.date  = df.date(from: "21:00")!
        DatePicker12.date  = df.date(from: "22:00")!
        DatePicker13.date  = df.date(from: "23:00")!
        
        
        DatePicker111.date  = df.date(from: "07:30")!
        DatePicker222.date  = df.date(from: "08:30")!
        DatePicker333.date  = df.date(from: "10:30")!
        DatePicker444.date  = df.date(from: "12:30")!
        DatePicker555.date  = df.date(from: "13:30")!
        DatePicker666.date  = df.date(from: "15:30")!
        DatePicker777.date  = df.date(from: "16:30")!
        DatePicker888.date  = df.date(from: "17:30")!
        DatePicker999.date  = df.date(from: "20:30")!
        DatePicker101010.date  = df.date(from: "20:30")!
        DatePicker111111.date  = df.date(from: "21:30")!
        DatePicker121212.date  = df.date(from: "22:30")!
        DatePicker131313.date  = df.date(from: "23:30")!
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    //  MARK:   テキストを閉じる処理
    //各項目 textEndBtn
    @IBAction func end1(_ sender: UITextField) {
    }
    @IBAction func end2(_ sender: UITextField) {
    }
    @IBAction func end3(_ sender: UITextField) {
    }
    @IBAction func end4(_ sender: UITextField) {
    }
    @IBAction func end5(_ sender: UITextField) {
    }
    @IBAction func end6(_ sender: UITextField) {
    }
    @IBAction func end7(_ sender: UITextField) {
    }
    @IBAction func end8(_ sender: UITextField) {
    }
    @IBAction func end9(_ sender: UITextField) {
    }
    @IBAction func end10(_ sender: UITextField) {
    }
    @IBAction func end11(_ sender: UITextField) {
    }
    @IBAction func end12(_ sender: UITextField) {
    }
    @IBAction func end13(_ sender: UITextField) {
    }
    
    //    エラー表示
    //テキストフィールドのエラー表示
    func hoge(huga:UITextField){
        if huga.text == "" {
            huga.placeholder = "文字を入力してください。"
        }
    }
    
    //デートピッカーの時間計算
    func picker1(pic:Double,DatePicker:UIDatePicker){
        if pic > 86400 || pic < 0 {
            DatePicker.setValue(UIColor.red, forKey:"textColor")
            // アラートを作成
            let alert = UIAlertController(
                title: "入力された時間が間違っています。",
                message: "赤く表示されている場所を編集してください。",
                preferredStyle: .alert)
            
            // アラートにボタンをつける
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            
            // アラート表示
            self.present(alert, animated: true, completion: nil)
        }else{
            DatePicker.setValue(UIColor.black, forKey:"textColor")
        }
    }
    
    
    
    func timeCollar(Picker:UIDatePicker){
        Picker.setValue(UIColor.black, forKey:"textColor")
    }
    //広告を表示するfunc
    
    func showAdBanner(){
        
        var admobView = GADBannerView()     //グーグルマップが用意しているバナー用のviewです。
        
        //今回は下の方にバナーを出します。
        
        admobView = GADBannerView(adSize: kGADAdSizeBanner)
        
        //バナーを下に配置します。
        admobView.frame.origin = CGPoint(x: 0, y: self.view.frame.size.height - admobView.frame.height)
        
        //バナーを横幅いっぱいに配置します。
        admobView.frame.size =  CGSize(width: self.view.frame.width, height: admobView.frame.height)
        
        //各種設定
        admobView.adUnitID = AdMobID
        admobView.delegate = self
        admobView.rootViewController = self
        
        //広告のリクエスト
        let admobRequest = GADRequest()
        
        //テストパターンによって設定を変えます。
        if (AdMobTest == true){
            
            //シュミレーターでのテスト方法
            if (SimulatorTest == true){
                admobRequest.testDevices = [kGADSimulatorID]
                print("Simulator")
            }else{
                //実機テスト
                admobRequest.testDevices = [TEST_DEVICE_ID]
                print("device")
            }
        }
        
        //リクエストのロード
        admobView.load(admobRequest)
        //バナーを画面に追加
        self.view.addSubview(admobView)
    }
    
    
    
    
    
}

    

    
