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


class ViewController: UIViewController {
    
    private var viewModel = MainViewModel()
    
    private var text : String?
    private let api = APIClient()
    private let dispseBeg = DisposeBag()

    
    @IBOutlet weak var inputTextView: PlaceHolderTextView!
    
    @IBOutlet weak var goNextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureGradientLayer()
        configButton()
        configTextField()
        
        inputTextView.rx.text.subscribe(onNext: { [weak self] text in
            if let text = text, text.count <= 0 {
                self?.goNextButton.isEnabled = false
                self?.goNextButton.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
                self?.goNextButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
            } else {
                self?.goNextButton.isEnabled = true
                self?.goNextButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                self?.goNextButton.setTitleColor(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), for: .normal)
            }
            }).disposed(by: dispseBeg)
        
        goNextButton.rx.tap.subscribe(onNext: {  [unowned self] _ in
            let storyboard: UIStoryboard = self.storyboard!
            let nextView = storyboard.instantiateViewController(withIdentifier: "resultView") as? ResultViewController
            nextView?.modalPresentationStyle = .fullScreen
            self.showLoader(true)
            self.text = self.inputTextView.text!
            nextView?.context = self.text ?? ""
            self.api.postText = self.text ?? ""
            self.api.postData { (str) in
                DispatchQueue.main.async {
                    nextView?.resText = str
                    self.showLoader(false)
                    self.present(nextView!, animated: true)
                    self.inputTextView.text = ""
                }
            }
            }).disposed(by: dispseBeg)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func configButton() {
        view.addSubview(goNextButton)
        goNextButton.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
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
}
