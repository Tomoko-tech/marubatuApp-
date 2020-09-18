//
//  rootViewController.swift
//  marubatu4App
//
//  Created by Takahashi Tomoko on 2020/09/18.
//  Copyright © 2020 takatomo.com. All rights reserved.
//

import UIKit

class rootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
   
        
    @IBAction func answerButton(_ sender: Any) {
    
    // ①storyboardのインスタンス取得
               let storyboard: UIStoryboard = self.storyboard!
        
               // ②遷移先ViewControllerのインスタンス取得
               let nextView = storyboard.instantiateViewController(withIdentifier: "view1") as! ViewController
        
               // ③画面遷移
               self.present(nextView, animated: true, completion: nil)
    
    }
    
    
    
    @IBAction func makeButton(_ sender: Any) {
        
        // ①storyboardのインスタンス取得
               let storyboard: UIStoryboard = self.storyboard!
        
               // ②遷移先ViewControllerのインスタンス取得
               let nextView = storyboard.instantiateViewController(withIdentifier: "view2") as! QuestionViewController
        
               // ③画面遷移
               self.present(nextView, animated: true, completion: nil)
        
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
