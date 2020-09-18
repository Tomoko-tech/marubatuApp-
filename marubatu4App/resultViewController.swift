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
    
    //var questions:[[String:Any]] = []
    
//    //格納
//    if UserDefaults.standard.object(forKey: "questions") != nil {
//        questions = UserDefaults.standard.object(forKey: "questions") as! [[String : Any]]
//    }
//    //アペンド
//    questions.append(["question":questionField.text!,"answer":marubatuAnswer])
//    
//    //保存
//    UserDefaults.standard.set(questions, forKey: "questions")
    
    
    var resultArray:[Int] = []
    
    
    
    @IBAction func resultShowButton(_ sender: Any) {
        
        
        if UserDefaults.standard.object(forKey: "result") != nil {
            resultArray = UserDefaults.standard.object(forKey: "result") as! [Int]
            print(resultArray.count)
        }
        resultLabel.text! = String(resultArray.count)
        
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
