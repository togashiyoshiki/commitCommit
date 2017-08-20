//
//  ViewController.swift
//  sampleAdMob
//
//  Created by togashi yoshiki on 2017/07/25.
//  Copyright © 2017年 Yoshiki Togashi. All rights reserved.
//

import UIKit
import CoreData
import GoogleMobileAds

class ViewController: UIViewController,GADBannerViewDelegate,UITableViewDelegate,UITableViewDataSource {
    
//    コミットを追加するテキストフィールド
    @IBOutlet weak var addTextField: UITextField!
    
    ///    detaを配列で使用する
    var titText:String = ""
    var arrayList:[String] = [""]
    var now:[NSDate] = []
    var targettime:[Double] = []
    
    ///じぶんのAdMobIDを指定指定します
    let AdMobID = "ca-app-pub-3530000000000000/0123456789"
    let TEST_DEVICE_ID = "61b0154xxxxxxxxxxxxxxxxxxxxxxxe0"
    
    ///テスト用
    let AdMobTest:Bool = true
    let SimulatorTest:Bool = true
    
    
    @IBOutlet weak var TableView: UITableView!
    
//    コミットをする
    @IBAction func addCommit(_ sender: UIButton) {
        if addTextField.text == "" {
        addTextField.placeholder = "コミットタイトルを入力してください"
        }else{
         performSegue(withIdentifier: "Segue3", sender: nil)
        }
    }
    
    //    セグエの設定　設定したセグエの名前を記入
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        どこのセグのどの値をと聞いている↓
        performSegue(withIdentifier: "Segue4", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //        guestの中身segueに飛んだSecondViewControllerクラスの継承している
        if (segue.identifier == "Segue3") {
            let guest = segue.destination as! addCommitViewController
            titText = addTextField.text!
            ///項目
            guest.tit = titText
        }else if (segue.identifier == "Segue4") {
            let guest = segue.destination as! addCommitViewController
             guest.tit = titText
            guest.targetTimeDeta = targettime[sender! as! Int]
        }
    }
    
    //    ⑵行数を決める
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrayList.count
    }
    //    ⑶リストに表示する文字列を決定し、表示
    func tableView(_ tableView: UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell {
        //        文字を表示するセルの取得(セルの再利用)
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        //        表示したい文字の設定
        
          cell.textLabel?.text = arrayList[indexPath.row]
            return cell
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //広告を表示するメソッドを呼び出す
        showAdBanner()
        read()
        
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
    //    データを取ります。
    func read(){
        //        カラの配列を用意します。
        arrayList = []
        
        //        AppDelegateを使う準備
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        //        エンティティを操作するためのオブジェクト
        let viewContext = appDelegate.persistentContainer.viewContext
        //        どのエンティティからデータを取得してくるか設定
        let query: NSFetchRequest<TimeMg> = TimeMg.fetchRequest()
        
        do{
            query.sortDescriptors = [NSSortDescriptor(key: "nowTime",ascending: false)]
            //            データを一括取得
            let fetchResults = try viewContext.fetch(query)
            //            データの取得
            for result: AnyObject in fetchResults {
                let nowTime :NSDate! = result.value(forKey: "nowTime") as! NSDate
                let tagetTime = result.value(forKey: "tagetTime") as! Double
                let nameTitle = result.value(forKey: "titleName")
                let time = result.value(forKey: "nowTime")
                
                arrayList.append(nameTitle as! String)
                targettime.append(tagetTime)
                now.append(time as! NSDate)
                
            }
        }catch{
        }
    }
    
    
                    
                
            
                    
    override func viewWillAppear(_ animated: Bool) {
        read()
       TableView.reloadData()
    }
}

