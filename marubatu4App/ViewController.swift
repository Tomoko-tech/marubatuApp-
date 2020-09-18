//
//  ViewController.swift
//  marubatu4App
//
//  Created by Takahashi Tomoko on 2020/09/15.
//  Copyright © 2020 takatomo.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resultButton.isHidden = true
        showQuestion()
    }

    override func viewWillAppear(_ animated: Bool) {
        
        questions = []
        
        if UserDefaults.standard.object(forKey: "questions") != nil {
            questions = UserDefaults.standard.object(forKey: "questions") as! [[String : Any]]
        }
        showQuestion()
    }
    
    
    @IBOutlet var questionLabel: UILabel!
    
    var currentQuestionNum = 0
    
    var questions:[[String:Any]] = []
    
//    let questions:[[String:Any]] =
//
//        [
//            ["question":"iphoneの開発環境はxcodeである","answer":true],
//            ["question":"青は黄色","answer":false],
//            ["question":"白は白色","answer":true]
//
//        ]
    
    
    func showQuestion() {
        
        
        if questions.count > currentQuestionNum {
            
            let question = questions[currentQuestionNum]
            
            if let que = question["question"] as? String{
                questionLabel.text = que
                falseButton.isEnabled = true
                trueButton.isEnabled = true
            }
        } else {
            //questionLabel.text = "問題を作ってください"
            falseButton.isEnabled = false
            trueButton.isEnabled = false
            
        }
        
    }
    

    var trueNumber = 0
    //var array = [Int]()
    
    func checkAnswer(userAnswer:Bool) {
        let question = questions[currentQuestionNum]
        
        if let ans = question["answer"] as? Bool {
            
            //正解と一致したら、trueNumber(正解数)に＋1する
            if userAnswer == ans {
                currentQuestionNum += 1
                showAlert(message: "正解")
                trueNumber += 1
                print(trueNumber)
            } else {
                currentQuestionNum += 1
                showAlert(message: "不正解") //不正解
            }
                
                
        
            //UserDefaultsにtrueNumberを保存 アプリの中に一時的に保存
            UserDefaults.standard.set(trueNumber, forKey: "result")
            print(trueNumber)
            
        } else {
            print("答えがありません")
            return
        }
        
        if questions.count <= currentQuestionNum {
           resultButton.isHidden = false
        }
        
//        if currentQuestionNum >= questions.count {
//            currentQuestionNum = 0
        
        showQuestion()
    }
    
    
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        
        alert.addAction(close)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    
    @IBAction func falseButton(_ sender: Any) {
        checkAnswer(userAnswer: false)
    }
    
    
    @IBAction func trueButton(_ sender: Any) {
        checkAnswer(userAnswer: true)
    }
    
    
    @IBOutlet var falseButton: UIButton!
    
    
    
    @IBOutlet var trueButton: UIButton!
   
    
    
    
    @IBAction func resultButton(_ sender: Any) {
    //self.performSegue(withIdentifier: "resultSegue", sender: nil)
        // ①storyboardのインスタンス取得
               let storyboard: UIStoryboard = self.storyboard!
        
               // ②遷移先ViewControllerのインスタンス取得
               let nextView = storyboard.instantiateViewController(withIdentifier: "view3") as! resultViewController
        
               // ③画面遷移
               self.present(nextView, animated: true, completion: nil)
    
    }
    
    
    @IBOutlet var resultButton: UIButton!
        
}

