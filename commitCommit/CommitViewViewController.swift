//
//  CommitViewViewController.swift
//  commitCommit
//
//  Created by togashi yoshiki on 2017/08/08.
//  Copyright © 2017年 Yoshiki Togashi. All rights reserved.
//

import UIKit
import GoogleMobileAds
class CommitViewViewController: UIViewController,GADBannerViewDelegate {
    
    ///項目名
    var item1:String = ""
    var item2:String = ""
    var item3:String = ""
    var item4:String = ""
    var item5:String = ""
    var item6:String = ""
    var item7:String = ""
    var item8:String = ""
    var item9:String = ""
    var item10:String = ""
    var item11:String = ""
    var item12:String = ""
    var item13:String = ""
    
    ///セレクトされた開始時間
    var targetTime1:String = ""
    var targetTime2:String = ""
    var targetTime3:String = ""
    var targetTime4:String = ""
    var targetTime5:String = ""
    var targetTime6:String = ""
    var targetTime7:String = ""
    var targetTime8:String = ""
    var targetTime9:String = ""
    var targetTime10:String = ""
    var targetTime11:String = ""
    var targetTime12:String = ""
    var targetTime13:String = ""
    
    ///セレクトされた終了
    var targetTime111:String = ""
    var targetTime222:String = ""
    var targetTime333:String = ""
    var targetTime444:String = ""
    var targetTime555:String = ""
    var targetTime666:String = ""
    var targetTime777:String = ""
    var targetTime888:String = ""
    var targetTime999:String = ""
    var targetTime101010:String = ""
    var targetTime111111:String = ""
    var targetTime121212:String = ""
    var targetTime131313:String = ""

    
    
    ///各項目
    @IBOutlet weak var Label1: UILabel!
    @IBOutlet weak var Label2: UILabel!
    @IBOutlet weak var Label3: UILabel!
    @IBOutlet weak var Label4: UILabel!
    @IBOutlet weak var Label5: UILabel!
    @IBOutlet weak var Label6: UILabel!
    @IBOutlet weak var Label7: UILabel!
    @IBOutlet weak var Label8: UILabel!
    @IBOutlet weak var Label9: UILabel!
    @IBOutlet weak var Label10: UILabel!
    @IBOutlet weak var Label11: UILabel!
    @IBOutlet weak var Label12: UILabel!
    @IBOutlet weak var Label13: UILabel!
    
    
    //          MARK:割り出された時間の表示
    
    @IBOutlet weak var timeLabel1: UILabel!
    @IBOutlet weak var timeLabel2: UILabel!
    @IBOutlet weak var timeLabel3: UILabel!
    @IBOutlet weak var timeLabel4: UILabel!
    @IBOutlet weak var timeLabel5: UILabel!
    @IBOutlet weak var timeLabel6: UILabel!
    @IBOutlet weak var timeLabel7: UILabel!
    @IBOutlet weak var timeLabel8: UILabel!
    @IBOutlet weak var timeLabel9: UILabel!
    @IBOutlet weak var timeLabel10: UILabel!
    @IBOutlet weak var timeLabel11: UILabel!
    @IBOutlet weak var timeLabel12: UILabel!
    @IBOutlet weak var timeLabel13: UILabel!
    
    
    ///コミット計算の表示
    @IBOutlet weak var commitTime: UILabel!
    
    ///コミット計算用
    var commitTimeText1 : Double = 0.0
    var commitTimeText2 : Double = 0.0
    var commitTimeText3: Double = 0.0
    var commitTimeText4 : Double = 0.0
    var commitTimeText5 : Double = 0.0
    var commitTimeText6 : Double = 0.0
    var commitTimeText7 : Double = 0.0
    var commitTimeText8 : Double = 0.0
    var commitTimeText9 : Double = 0.0
    var commitTimeText10 : Double = 0.0
    var commitTimeText11 : Double = 0.0
    var commitTimeText12 : Double = 0.0
    var commitTimeText13 : Double = 0.0
    
    var commitTextChange:String = ""

    @IBOutlet weak var commit100: UILabel!
    
    //    戻る
    @IBAction func back(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    ///じぶんのAdMobIDを指定指定します
    let AdMobID = "ca-app-pub-3530000000000000/0123456789"
    let TEST_DEVICE_ID = "61b0154xxxxxxxxxxxxxxxxxxxxxxxe0"
    
    ///テスト用
    let AdMobTest:Bool = true
    let SimulatorTest:Bool = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        Label1.text = item1
        Label2.text = item2
        Label3.text = item3
        Label4.text = item4
        Label5.text = item5
        Label6.text = item6
        Label7.text = item7
        Label8.text = item8
        Label9.text = item9
        Label10.text = item10
        Label11.text = item11
        Label12.text = item12
        Label13.text = item13
        
        //            時間の計算(分の割り出し)
        var ret1 = commitTimeText1/60
        var ret2 = commitTimeText2/60
        var ret3 = commitTimeText3/60
        var ret4 = commitTimeText4/60
        var ret5 = commitTimeText5/60
        var ret6 = commitTimeText6/60
        var ret7 = commitTimeText7/60
        var ret8 = commitTimeText8/60
        var ret9 = commitTimeText9/60
        var ret10 = commitTimeText10/60
        var ret11 = commitTimeText11/60
        var ret12 = commitTimeText12/60
        var ret13 = commitTimeText13/60
        
        ///時間分岐表示
        if ret1 > 60 {
            print("１時間以上です。")
            ret1  = ret1 / 60
            var str1: String = String("\(ret1)時間")
            timeLabel1.text = str1
        }else{
            print("１時間未満")
            var str1: String = String("\(ret1)分")
            timeLabel1.text = str1
        }
        
        if ret2 > 60 {
            print("１時間以上です。")
            ret2  = ret2 / 60
            var str2: String = String("\(ret2)時間")
            timeLabel2.text = str2
        }else{
            print("１時間未満")
            var str2: String = String("\(ret2)分")
            timeLabel2.text = str2
        }
        
        if ret3 > 60 {
            print("１時間以上です。")
            ret3  = ret3 / 60
            var str3: String = String("\(ret3)時間")
            timeLabel3.text = str3
        }else{
            print("１時間未満")
            var str3: String = String("\(ret3)分")
            timeLabel3.text = str3
        }
        
        if ret4 > 60 {
            print("１時間以上です。")
            ret4  = ret4 / 60
            var str4: String = String("\(ret4)時間")
            timeLabel4.text = str4
        }else{
            print("１時間未満")
            var str4: String = String("\(ret4)分")
            timeLabel4.text = str4
        }
        
        if ret5 > 60 {
            print("１時間以上です。")
            ret5  = ret5 / 60
            var str5: String = String("\(ret5)時間")
            timeLabel5.text = str5
        }else{
            print("１時間未満")
            var str5: String = String("\(ret5)分")
            timeLabel5.text = str5
        }
        
        if ret6 > 60 {
            print("１時間以上です。")
            ret6  = ret6 / 60
            var str6: String = String("\(ret6)時間")
            timeLabel6.text = str6
        }else{
            print("１時間未満")
            var str6: String = String("\(ret6)分")
            timeLabel6.text = str6
        }
        
        
        if ret7 > 60 {
            print("１時間以上です。")
            ret7  = ret7 / 60
            var str7: String = String("\(ret7)時間")
            timeLabel7.text = str7
        }else{
            print("１時間未満")
            var str7: String = String("\(ret7)分")
            timeLabel7.text = str7
        }
        
        if ret8 > 60 {
            print("１時間以上です。")
            ret8  = ret8 / 60
            var str8: String = String("\(ret8)時間")
            timeLabel8.text = str8
        }else{
            print("１時間未満")
            var str8: String = String("\(ret8)分")
            timeLabel8.text = str8
        }
        
        
        if ret9 > 60 {
            print("１時間以上です。")
            ret9  = ret9 / 60
            var str9: String = String("\(ret9)時間")
            timeLabel9.text = str9
        }else{
            print("１時間未満")
            var str9: String = String("\(ret9)分")
            timeLabel9.text = str9
        }
        
        if ret10 > 60 {
            print("１時間以上です。")
            ret10  = ret10 / 60
            var str10: String = String("\(ret10)時間")
            timeLabel10.text = str10
        }else{
            print("１時間未満")
            var str10: String = String("\(ret10)分")
            timeLabel10.text = str10
        }
        
        if ret11 > 60 {
            print("１時間以上です。")
            ret11  = ret11 / 60
            var str11: String = String("\(ret11)時間")
            timeLabel11.text = str11
        }else{
            print("１時間未満")
            var str11: String = String("\(ret11)分")
            timeLabel11.text = str11
        }
        
        if ret12 > 60 {
            print("１時間以上です。")
            ret12  = ret12 / 60
            var str12: String = String("\(ret12)時間")
            timeLabel12.text = str12
        }else{
            print("１時間未満")
            var str12: String = String("\(ret12)分")
            timeLabel12.text = str12
        }
        
        if ret13 > 60 {
            print("１時間以上です。")
            ret13  = ret13 / 60
            var str13: String = String("\(ret13)時間")
            timeLabel13.text = str13
        }else{
            print("１時間未満")
            var str13: String = String("\(ret13)分")
            timeLabel13.text = str13
        }
        
        
        ///commit計算表示
        if item1 == "コミット" {
            //                    時間の取得
            commitTimeText1 = ret1
        }
        
        if item2 == "コミット" {
            //                    時間の取得
            commitTimeText2 = ret2
        }
        
        if item3 == "コミット" {
            //                    時間の取得
            commitTimeText3 = ret3
        }
        
        if item4 == "コミット" {
            //                    時間の取得
            commitTimeText4 = ret4
        }
        
        if item5 == "コミット" {
            //                    時間の取得
            commitTimeText5 = ret5
        }
        
        if item6 == "コミット" {
            //                    時間の取得
            commitTimeText6 = ret6
        }
        
        if item7 == "コミット" {
            //                    時間の取得
            commitTimeText7 = ret7
        }
        
        if item8 == "コミット" {
            //                    時間の取得
            commitTimeText8 = ret8
        }
        
        if item9 == "コミット" {
            //                    時間の取得
            commitTimeText1 = ret9
        }
        
        if item10 == "コミット" {
            //                    時間の取得
            commitTimeText10 = ret10
        }
        
        if item11 == "コミット" {
            //                    時間の取得
            commitTimeText11 = ret11
        }
        
        if item12 == "コミット" {
            //                    時間の取得
            commitTimeText12 = ret12
        }
        if item13 == "コミット" {
            //                    時間の取得
            commitTimeText13 = ret13
        }
        
//        
//        var total = commitTimeText1+commitTimeText2+commitTimeText3+commitTimeText4+commitTimeText5+commitTimeText6+commitTimeText7+commitTimeText8+commitTimeText9+commitTimeText10+commitTimeText11+commitTimeText12+commitTimeText13
//        
//        if total > 60{
//            total = total/60
//            
//            commitTime.text = String("\(total)時間")
//        }else if  total > 1 {
//            commitTime.text = String("\(total)分")
//        }else{
//            commitTime.text = String("コミットはありません。")
//        }
//        if total != 0 {
//            total = 6000/total
//            commit100.text = String("約\(total)日")
//        }else{
//            commit100.text = String("コミットはありません。")
//        }

              
        //広告を表示するメソッドを呼び出す
        showAdBanner()
        
    }
    
    
    
    @IBAction func homeBack(_ sender: UIButton) {
         performSegue(withIdentifier: "Segue1", sender: nil)
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
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

