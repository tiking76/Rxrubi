//
//  ResultViewController.swift
//  rubi
//
//  Created by 舘佳紀 on 2020/05/21.
//  Copyright © 2020 yoshiki Tachi. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var context: String = ""
    var resText: String = ""
    
    @IBOutlet weak var inputtedTextField: UITextView!
    
    @IBOutlet weak var resultTextField: UITextView!
    
    @IBOutlet weak var arrowLabel: UILabel!
    
    @IBOutlet weak var backHomeButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureGradientLayer()
        configUI()
        inputtedTextField.text = context
        resultTextField.text = resText
        
    }
    
    @objc func backHome() {
        dismiss(animated: true, completion: nil)
        inputtedTextField.text = ""
        resultTextField.text = ""
    }
    
    func configUI() {
        configButton()
        configTextField()
        view.addSubview(arrowLabel)
    }
    
    func configButton() {
        view.addSubview(backHomeButton)
        backHomeButton.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        backHomeButton.tintColor = .white
        backHomeButton.setTitle("Home", for: .normal)
        backHomeButton.addTarget(self, action: #selector(backHome), for: .touchUpInside)
        backHomeButton.frame = CGRect(x: (self.view.frame.size.width / 2) - 150,
                                      y: (self.view.frame.size.height / 2) - 50,
                                      width: 100,
                                      height: 100)
        backHomeButton.layer.cornerRadius = 10.0
    }
    
    func configTextField() {
        view.addSubview(inputtedTextField)
        view.addSubview(resultTextField)
    }
    
}
