//
//  ViewController.swift
//  sampleAdMob
//
//  Created by togashi yoshiki on 2017/07/25.
//  Copyright © 2017年 Yoshiki Togashi. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController,GADBannerViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate {
    
    ///    detaを配列で使用する
    var commitList = ["勉強","仕事","趣味"]
    
    
    ///じぶんのAdMobIDを指定指定します
    let AdMobID = "ca-app-pub-3530000000000000/0123456789"
    let TEST_DEVICE_ID = "61b0154xxxxxxxxxxxxxxxxxxxxxxxe0"
    
    ///テスト用
    let AdMobTest:Bool = true
    let SimulatorTest:Bool = true
    
    
    //    ピッカービューの列数を決定する。メソッド追加
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //    ピッカービューの行数を決定する。メソッド追加
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //        配列の要素の個数と同じ数を指定
        return commitList.count
    }
    //    ピッカービューに表示する文字の設定。　メソッド追加
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //        teaList[0]　ダージリン
        //        teaList[1]     アールグレイ
        
        //rowの中に配列が入ります。
        return commitList[row]
        
    }
    //    ピッカービューが選択された時に発動
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //        ユー pザが選んだ時にデバックエリアに選んだものを表示します。
        print(commitList[row])
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //広告を表示するメソッドを呼び出す
        showAdBanner()
        
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

