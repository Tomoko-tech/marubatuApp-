//
//  QuestionViewController.swift
//  marubatu4App
//
//  Created by Takahashi Tomoko on 2020/09/15.
//  Copyright © 2020 takatomo.com. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController,UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var questions:[[String:Any]] = []
    

    @IBOutlet var questionField: UITextField!
    
    
    @IBOutlet var marubatuController: UISegmentedControl!
    
    
    @IBAction func tapSaveButton(_ sender: Any) {
        
        if questionField.text != "" {
            //問題作成者が決めた◯か✕かの正解の方を格納する変数
            var marubatuAnswer:Bool = true

            if marubatuController.selectedSegmentIndex == 0 {
                marubatuAnswer = false
                } else {
                marubatuAnswer = true
            }
            //格納
            if UserDefaults.standard.object(forKey: "questions") != nil {
                questions = UserDefaults.standard.object(forKey: "questions") as! [[String : Any]]
            }
            //アペンド
            questions.append(["question":questionField.text!,"answer":marubatuAnswer])
            
            //保存
            UserDefaults.standard.set(questions, forKey: "questions")
            
            showAlert(message: "問題が保存されました")
            
            questionField.text = ""
            
        } else {
          showAlert(message: "問題を作成してください")
        }
        
    }
    
    @IBAction func tapAllDeleteButton(_ sender: Any) {
        //配列がnilになる
        UserDefaults.standard.removeObject(forKey: "questions")
        //nilになったことのエラーを防ぐために、空の配列を保存
        UserDefaults.standard.set([], forKey: "questions")
        
        showAlert(message: "問題を全て削除しました")
    }
    
    
    @IBAction func tapBackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        
        alert.addAction(close)
        
        present(alert, animated: true, completion: nil)
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
