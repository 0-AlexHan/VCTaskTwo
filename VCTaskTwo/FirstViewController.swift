//
//  ViewController.swift
//  VCTaskTwo
//
//  Created by Alex Han on 11.07.2021.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet private weak var firstVCTextField: UITextField!
    @IBOutlet private weak var redButton: UIButton!
    @IBOutlet private weak var greenButton: UIButton!
    @IBOutlet private weak var blueButton: UIButton!
    
    // нашел такой вариант. Но по факту же все равно используется идентификатор. А как без идентификатора вообще сделать - не нашел. Разве что весь UI прописать в коде.
    private let viewControllerID = String(describing: SecondViewController.self)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstVCTextField.delegate = self
    }

    @IBAction func didTapPushRed(_ sender: Any) {
        if let color = redButton.backgroundColor {
            performPush(viewControllerWithID: viewControllerID, color: color, andText: firstVCTextField)
        }
    }
    
    @IBAction func didTapPushGreen(_ sender: Any) {
        if let color = greenButton.backgroundColor {
            performPush(viewControllerWithID: viewControllerID, color: color, andText: firstVCTextField)
        }
    }
    
    @IBAction func didTapPushBlue(_ sender: Any) {
        if let color = blueButton.backgroundColor {
            performPush(viewControllerWithID: viewControllerID, color: color, andText: firstVCTextField)
        }
    }
    
   
    
    func performPush(viewControllerWithID: String, color: UIColor, andText: UITextField) {
        
        if let viewController =  storyboard?.instantiateViewController(identifier: viewControllerID) as? SecondViewController {
                        
            viewController.passedText = firstVCTextField.text
            viewController.didPassTextBack = { text in
                self.firstVCTextField.text = text
            }
            
            viewController.view.backgroundColor = color
            
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }    
}


extension FirstViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
   
}
