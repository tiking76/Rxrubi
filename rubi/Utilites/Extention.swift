//
//  Extention.swift
//  rubi
//
//  Created by 舘佳紀 on 2020/07/27.
//  Copyright © 2020 yoshiki Tachi. All rights reserved.
//

import UIKit
import JGProgressHUD

protocol StoryBoardInstantiatable {}
extension UIViewController: StoryBoardInstantiatable {}

extension StoryBoardInstantiatable where Self: UIViewController {

    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: self.className, bundle: nil)
        return storyboard.instantiateInitialViewController() as! Self
    }

    static func instantiate(withStoryboard storyboard: String) -> Self {
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: self.className) as! Self
    }
}

protocol ClassNameProtocol {
    static var className: String { get }
    var className: String { get }
}

extension ClassNameProtocol {

    static var className: String {
        return String(describing: self)
    }

    var className: String {
        return type(of: self).className
    }
}

extension NSObject: ClassNameProtocol {}

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
