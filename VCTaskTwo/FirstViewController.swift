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
    
    
    private let viewControllerID = "SecondVC"
    
    
    
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
        if let color = redButton.backgroundColor {
            performPush(viewControllerWithID: viewControllerID, color: color, andText: firstVCTextField)
        }
    }
    
    @IBAction func didTapPushBlue(_ sender: Any) {
        if let color = redButton.backgroundColor {
            performPush(viewControllerWithID: viewControllerID, color: color, andText: firstVCTextField)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func performPush(viewControllerWithID: String, color: UIColor, andText: UITextField) {
        
        if let viewController =  storyboard?.instantiateViewController(identifier: viewControllerID) as? SecondViewController {
            viewController.secondVCDelegate = self
            
            self.navigationController?.pushViewController(viewController, animated: true)
            viewController.didPassText(inTextField: firstVCTextField)
            viewController.didChange(backgroundColor: color)
        }
    }    
}


extension FirstViewController: PassingDataDelegate, UITextFieldDelegate {
       
    func didPassText(inTextField: UITextField) {
        firstVCTextField.text = inTextField.text
    }
    
    func didChange(backgroundColor color: UIColor) {
        self.view.backgroundColor = color
    }
}
