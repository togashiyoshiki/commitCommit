//
//  addCommitViewController.swift
//  commitCommit
//
//  Created by togashi yoshiki on 2017/08/12.
//  Copyright © 2017年 Yoshiki Togashi. All rights reserved.
//

import UIKit
import GoogleMobileAds
class addCommitViewController: UIViewController,GADBannerViewDelegate {

    var item:String = ""
    var tit:String = ""
    ///じぶんのAdMobIDを指定指定します
    let AdMobID = "ca-app-pub-3530000000000000/0123456789"
    let TEST_DEVICE_ID = "61b0154xxxxxxxxxxxxxxxxxxxxxxxe0"
    ///テスト用
    let AdMobTest:Bool = true
    let SimulatorTest:Bool = true
    
    
    
    @IBOutlet weak var mytit: UILabel!
    
    
    var timer = Timer()                 // Timerクラス
    var startTime: TimeInterval = 0     // Startボタンを押した時刻
    var elapsedTime: Double = 0.0       // Stopボタンを押した時点で経過していた時間
    var time : Double = 0.0             // ラベルに表示する時間
    
    var targetTimeDeta :Double = 0.0
    
    @IBOutlet weak var labelTimer: UILabel!     // タイムを表示するラベル
    @IBOutlet weak var buttonStart: UIButton!   // Startボタン
    @IBOutlet weak var buttonStop: UIButton!    // Stopボタン
    @IBOutlet weak var buttonReset: UIButton!   // Resetボタン
    
    // Startボタンを押した時の処理
    @IBAction func tapStart() {
        // Startボタン、Resetボタンを無効化
        buttonStart.isEnabled = false
        buttonReset.isEnabled = false
        // Stopボタンを有効化
        buttonStop.isEnabled = true
        // Startボタンを押した時刻を保存
        startTime = Date().timeIntervalSince1970
        // 0.01秒おきに関数「update」を呼び出す
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
    }
    
    // 0.01秒ごとに呼び出される処理
    func update() {
        // 経過時間は以下の式で計算する
        // (現在の時刻 - Startボタンを押した時刻) + Stopボタンを押した時点で経過していた時刻
        time = Date().timeIntervalSince1970 - startTime + elapsedTime
        // 時間を小数点前後で分割(小数点以下は2桁だけ取得)
        let sec = Int(time)
        let msec = Int((time - Double(sec)) * 100)
        // 「XX:XX.XX」形式でラベルに表示する
        let displayStr = NSString(format: "%02d:%02d.%02d", sec/60, sec%60, msec) as String
        labelTimer.text = displayStr
    }
    
    // Stopボタンを押した時の処理
    @IBAction func tapStop() {
        // Startボタン、Resetボタンを有効化
        buttonStart.isEnabled = true
        buttonReset.isEnabled = true
        // Stopボタンを無効化
        buttonStop.isEnabled = false
        // タイマー処理を止める
        timer.invalidate()
        // 再度Startボタンを押した時に加算するため、これまでに計測した経過時間を保存
        elapsedTime = time
    }
    
    // Resetボタンを押した時の処理
    @IBAction func tapReset() {
        // 経過時間、ラベルを初期化する
        elapsedTime = 0.0
        labelTimer.text = "00:00.00"
    }
    
//    コアデータに保存する処理
    @IBAction func addBtn(_ sender: UIButton) {
        if elapsedTime < 1 {
            
        }else{
        
        var time1 = Date()

        // context(データベースを扱うのに必要)を定義。
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        // taskにTask(データベースのエンティティです)型オブジェクトを代入します。
        let timeMg = TimeMg(context: context)
        
        timeMg.nowTime = time1 as NSDate
        timeMg.tagetTime = elapsedTime
        timeMg.titleName = tit
    
               // 上で作成したデータをデータベースに保存します。
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        self.dismiss(animated: true, completion: nil)
    }
    }
    
    
    
    
    
    
    
    
    
//　戻る
    @IBAction func back(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mytit.text = tit
        
        //広告を表示するメソッドを呼び出す
        showAdBanner()
        
       labelTimer.text = String(targetTimeDeta)
        
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
