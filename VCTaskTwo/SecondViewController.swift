//
//  SecondViewController.swift
//  VCTaskTwo
//
//  Created by Alex Han on 11.07.2021.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet private weak var secondVCTextField: UITextField!
    var passedText: String?
    var didPassTextBack: ((_ text: String?) -> Void)?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondVCTextField.delegate = self
        secondVCTextField.text = passedText
    }
    
    
}

extension SecondViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        didPassTextBack?(secondVCTextField.text)
        self.navigationController?.popViewController(animated: true)
        
        return true
    }
}

    
