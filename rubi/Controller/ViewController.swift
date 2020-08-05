//
//  ViewController.swift
//  rubi
//
//  Created by 舘佳紀 on 2020/05/18.
//  Copyright © 2020 yoshiki Tachi. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import JGProgressHUD

protocol AuthenticationControllerProtocol {
    func checkFormStatus()
}

class ViewController: UIViewController {
    
    private var viewModel = MainViewModel()
    
    private var text : String?
    private let api = APIClient()

    
    @IBOutlet weak var inputTextView: PlaceHolderTextView!
    
    @IBOutlet weak var goNextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextView.delegate = self
        configureGradientLayer()
        configButton()
        configTextField()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func goNext(_ sender: Any) {
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "resultView") as? ResultViewController
        nextView?.modalPresentationStyle = .fullScreen
        showLoader(true)
        text = inputTextView.text!
        nextView?.context = text ?? ""
        api.postText = text ?? ""
        api.postData { (str) in
            DispatchQueue.main.async {
                nextView?.resText = str
                self.showLoader(false)
                self.present(nextView!, animated: true)
                self.inputTextView.text = nil
            }
        }
    }
    
    func configButton() {
        view.addSubview(goNextButton)
        goNextButton.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        goNextButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        goNextButton.setTitle("変換!", for: .normal)
        goNextButton.frame = CGRect(x: (self.view.frame.size.width / 2) - 150,
                                    y: (self.view.frame.size.height / 2) - 50,
                                    width: 300,
                                    height: 100)
        goNextButton.layer.cornerRadius = 10.0
        goNextButton.layer.shadowOffset = CGSize(width: 3, height: 3 )
        goNextButton.layer.shadowOpacity = 0.5
        goNextButton.layer.shadowRadius = 10
        goNextButton.isEnabled = false
    }
    
    func configTextField() {
        view.addSubview(inputTextView)
        inputTextView.backgroundColor = UIColor(named: "BackgroundColor")
        inputTextView.placeHolder = "ここに変換したい漢字をいれてね"
        
    }
    
    //UITextVieの範囲外をタップしたら閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc func handleisPush() {
        textDidChange(sender: inputTextView)
    }
    
    func textDidChange(sender: PlaceHolderTextView) {
        if sender == inputTextView {
            viewModel.text = sender.text
        }
        checkFormStatus()
    }
}

extension ViewController : AuthenticationControllerProtocol {
    
    func checkFormStatus() {
        if viewModel.formIsVaild {
            goNextButton.isEnabled = true
            goNextButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            goNextButton.setTitleColor(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), for: .normal)
            } else {
            goNextButton.isEnabled = false
            goNextButton.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
            goNextButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        }
    }
    
}

extension ViewController: UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
        handleisPush()
    }
}
