//
//  memoSaveViewController.swift
//  Swift4Memo
//
//  Created by tatsumi kentaro on 2018/02/03.
//  Copyright © 2018年 tatsumi kentaro. All rights reserved.
//

import UIKit

class memoSaveViewController: UIViewController,UITextFieldDelegate {
    
    
    
    
    
    let saveData: UserDefaults = UserDefaults.standard
    
    
    
    @IBOutlet var title_content:UITextField!
    
    @IBOutlet var main_conrent:UITextView!
    
    var title_content_h:String!
    var main_conrent_h:String!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title_content.text = saveData.object(forKey: "title") as? String
        main_conrent.text = saveData.object(forKey: "main") as? String
        title_content.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func save(){
        title_content_h = title_content.text
        main_conrent_h = main_conrent.text
        
        saveData.set(title_content_h, forKey: "title")
        saveData.set(main_conrent_h, forKey: "main")
        let alert: UIAlertController = UIAlertController(title:"確認",message:"保存しますがよろしいですか？",preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            print("OKボタンが押されました")
        }))
        present(alert,animated: true,completion: nil)
        
        
    }
    

    
}
