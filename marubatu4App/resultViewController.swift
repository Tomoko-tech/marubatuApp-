//
//  resultViewController.swift
//  marubatu4App
//
//  Created by Takahashi Tomoko on 2020/09/18.
//  Copyright © 2020 takatomo.com. All rights reserved.
//

import UIKit

class resultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    //受け皿の変数を用意
    var recieveResult = 0
    
    //正答数表示ボタン
    @IBAction func resultShowButton(_ sender: Any) {
        
        //受け皿にUserDefaultsを格納
        if UserDefaults.standard.object(forKey: "result") != nil {
            recieveResult = UserDefaults.standard.object(forKey: "result") as! Int
            print(recieveResult)
        }
        //ラベルに表示 Int型の受け皿の変数をString型に変えて
        resultLabel.text! = String(recieveResult)
        
    }
    
    @IBOutlet var resultLabel: UILabel!
    
    
    
    //self.performSegue(withIdentifier: “resultSegue", sender: nil)

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
