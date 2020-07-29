//
//  PlaceHolderTextView.swift
//  rubi
//
//  Created by 舘佳紀 on 2020/07/21.
//  Copyright © 2020 yoshiki Tachi. All rights reserved.
//

import UIKit

@IBDesignable final class PlaceHolderTextView: UITextView {

    // MARK: Stored Instance Properties

    @IBInspectable var placeHolder: String = "ここに変換したい漢字をいれてね" {
        didSet {
            self.placeHolderLabel.text = self.placeHolder
            self.placeHolderLabel.numberOfLines = 0
            self.placeHolderLabel.sizeToFit()
        }
    }

    lazy var placeHolderLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 6.0, y: 6.0, width: 0.0, height: 0.0))
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.font = self.font
        label.textColor = UIColor(red: 0.0, green: 0.0, blue: 0.0980392, alpha: 0.22)
        label.backgroundColor = .clear
        self.addSubview(label)
        return label
    }()

    // MARK: Initializers

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    // MARK: View Life-Cycle Methods

    override func awakeFromNib() {
        super.awakeFromNib()
        changeVisiblePlaceHolder()
        NotificationCenter.default.addObserver(self, selector: #selector(textChanged),
                                               name: UITextView.textDidChangeNotification, object: nil)
    }

    // MARK: Other Private Methods

    func changeVisiblePlaceHolder() {
        self.placeHolderLabel.alpha = (self.placeHolder.isEmpty || !self.text.isEmpty) ? 0.0 : 1.0
    }

    @objc private func textChanged(notification: NSNotification?) {
        changeVisiblePlaceHolder()
    }

}
