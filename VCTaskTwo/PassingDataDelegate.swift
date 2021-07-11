//
//  Delegate.swift
//  VCTaskTwo
//
//  Created by Alex Han on 11.07.2021.
//
import  UIKit

protocol PassingDataDelegate {
    func didPassText(inTextField: UITextField)
    func didChange(backgroundColor color: UIColor)
}
