//
//  LoginViewLayout.swift
//  Ridwan-Test
//
//  Created by Ridwan Surya Putra on 27/12/22.
//

import UIKit
import LBTATools

extension LoginViewController {
    func initializeUI(){
        view.stack(titleLabel,
                   descriptionLabel,
                   UIView().stack(
                       usernameTextField.withHeight(50),
                       spacing: 6),
                   UIView().stack(
                       passwordTextfield.withHeight(50),
                       UIView().hstack(keepUsernameButton, updateButton),
                       spacing: 10),
                   UIView(),
                   UIView().stack(
                       loginButton.withHeight(50)),
                   UIView(),
                   spacing: 25).withMargins(.allSides(16))
    }
}

