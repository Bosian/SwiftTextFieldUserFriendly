//
//  ViewController.swift
//  Test
//
//  Created by 劉柏賢 on 2016/11/7.
//  Copyright © 2016年 劉柏賢. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var text2: UITextField!
    @IBOutlet weak var text3: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        text1.delegate = self
        text2.delegate = self
        text3.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        guard let view = self.view else {
            return false
        }
        
        let lastTextFieldTag = 3
        guard textField.tag == lastTextFieldTag else
        {
            let nextTextFieldTag = textField.tag + 1
            view.viewWithTag(nextTextFieldTag)?.becomeFirstResponder()
            
            return true
        }
        
        self.view.endEditing(true)
        
        let buttonTag = 4
        guard let button = view.viewWithTag(buttonTag) as? UIButton else {
            return false
        }
        
        button.sendActions(for: .touchUpInside)
        
        return textField.resignFirstResponder()
    }
    
    @IBAction func handler(_ sender: UIButton) {
        let alert = UIAlertController(title: "Message", message: "hello", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}

