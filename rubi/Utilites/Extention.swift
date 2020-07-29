//
//  Extention.swift
//  rubi
//
//  Created by 舘佳紀 on 2020/07/27.
//  Copyright © 2020 yoshiki Tachi. All rights reserved.
//

import UIKit
import JGProgressHUD

extension UIViewController {

    static let hud = JGProgressHUD(style: .dark)

    //グラデーションをかけてる Red X Yellow
    func configureGradientLayer() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemRed.cgColor, UIColor.systemYellow.cgColor]
        gradient.locations = [0,1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
    }

    //オプションで付けたい引数はOptinalで宣言する。
    func showLoader(_ show : Bool, withText text: String? = "Loading") {
        view.endEditing(true)
        if show {
            UIViewController.hud.show(in: view)
        } else {
            UIViewController.hud.dismiss()
        }
    }
}


