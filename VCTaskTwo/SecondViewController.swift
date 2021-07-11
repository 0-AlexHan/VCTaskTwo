//
//  SecondViewController.swift
//  VCTaskTwo
//
//  Created by Alex Han on 11.07.2021.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet private weak var secondVCTextField: UITextField!
    private var passedText: String?
    
    var secondVCDelegate: PassingDataDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        secondVCTextField.delegate = self
        secondVCTextField.text = passedText
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.navigationController?.popViewController(animated: true)
        secondVCDelegate.didPassText(inTextField: secondVCTextField)
        return true
    }
    
}

extension SecondViewController: PassingDataDelegate, UITextFieldDelegate {
       
    func didPassText(inTextField: UITextField) {
        passedText = inTextField.text
        
    }
    
    func didChange(backgroundColor color: UIColor) {
        self.view.backgroundColor = color
    }
}

    
