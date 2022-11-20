//
//  ViewController.swift
//  StringConversionDemo
//
//  Created by Guest on 19.11.22.
//

import UIKit
import StringConversion

class ViewController: UIViewController {
    @IBOutlet private weak var initialTextField: UITextField!
    @IBOutlet private weak var targetTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialTextField.addTarget(
            self,
            action: #selector(textFieldEditingChanged(_:)),
            for: .editingChanged
        )
        targetTextField.addTarget(
            self,
            action: #selector(textFieldEditingChanged(_:)),
            for: .editingChanged
        )
        showConversionResult()
    }

    private func showConversionResult() {
        let color = StringConversion().can(
            initialTextField.text ?? "",
            beConvertedInto: targetTextField.text ?? ""
        ) ? UIColor.green.cgColor : UIColor.red.cgColor
        targetTextField.layer.borderWidth = 1
        targetTextField.layer.borderColor = color
        initialTextField.layer.borderWidth = 1
        initialTextField.layer.borderColor = color
    }
}

extension ViewController {
    @objc private func textFieldEditingChanged(_ textField: UITextField) {
        showConversionResult()
    }
}

