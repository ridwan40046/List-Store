//
//  TextfieldPassword.swift
//  Ridwan-Test
//
//  Created by Ridwan Surya Putra on 27/12/22.
//

import Foundation
import UIKit

class TextfieldPassword : UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        initCustom()
    }

    // MARK: - Helper

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        initCustom()
    }

    func initCustom() {
        let hintButton = UIButton()
        hintButton.translatesAutoresizingMaskIntoConstraints = false
        hintButton.widthAnchor.constraint(equalToConstant: 44).isActive = true
        hintButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        hintButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16)
        self.rightView = hintButton
        hintButton.addTarget(self, action: #selector(changeSecureText), for: .touchUpInside)
        self.clearButtonMode = .never
        self.rightViewMode = .always
        changeIcon()
    }

    // MARK: - Actions

    @objc private func changeSecureText(sender: UIButton) {
        changeIcon()
    }

    private func changeIcon() {
        let button = self.rightView as! UIButton
        let icVisibiltyOff = UIImage(named: "IcHide")
        let icVisibiltyOn = UIImage(named: "IcUnhide")
        self.isSecureTextEntry = !self.isSecureTextEntry
        button.setImage(
            self.isSecureTextEntry ? icVisibiltyOff : icVisibiltyOn,
            for: .normal)
    }

}

