//
//  LoginController.swift
//  Ridwan-Test
//
//  Created by Ridwan Surya Putra on 27/12/22.
//

import Foundation
import UIKit
import LBTATools
import Alamofire
import SwiftyJSON

private typealias `Self` = LoginViewController

class LoginViewController: UIViewController {
    // MARK: Properties
    var didLoginSuccess: (() -> Void)?

    lazy var titleLabel: UILabel = {
         let view = UILabel(
            text: "Login",
            font: .boldSystemFont(ofSize: 26),
            textColor: .white,
            textAlignment: .left,
            numberOfLines: 1)

         return view
     }()

    lazy var descriptionLabel: UILabel = {
        let view = UILabel(
            text: "Silahkan masukkan username dan kata sandi anda dengan benar",
            font: .systemFont(ofSize: 16),
            textColor: .white,
            textAlignment: .left,
            numberOfLines: 0)

        return view
    }()

    lazy var usernameTextField: UITextField = {
        let view = UITextField(placeholder: "Username" )
        view.withImage(direction: .LEFT,
                       image: UIImage(named: "username"),
                       colorBorder: .lightGray)

        return view
    }()
    
    lazy var passwordTextfield: TextfieldPassword = {
        let view = TextfieldPassword()
        view.isSecureTextEntry = true
        view.placeholder = "Password"
        view.withImage(direction: .LEFT,
                       image: UIImage(named: "IcPassword"),
                       colorBorder: .lightGray)

        return view
    }()
    
    lazy var updateButton: UILabel = {
        let view = UILabel(
            text: "Check Update",
            font: .systemFont(ofSize: 14, weight: .medium),
            textColor: .systemBlue,
            textAlignment: .right,
            numberOfLines: 0)

        return view
    }()
    
    lazy var keepUsernameButton: UILabel = {
        let view = UILabel(
            text: "Keep username",
            font: .systemFont(ofSize: 14,weight: .medium),
            textColor: .systemBlue,
            textAlignment: .left,
            numberOfLines: 0)

        return view
    }()
    
    lazy var loginButton: UIButton = {
        let view = UIButton()
        view.setTitle("Login", for: .normal)
        view.layer.cornerRadius = 8
        view.backgroundColor = .blue
        view.addTarget(
            self,
            action: #selector(loginButtonTapped), for: .touchUpInside)

        return view
    }()

    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeUI()
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
}

//MARK: - Action
extension Self{
    @objc func loginButtonTapped(){
        let username = usernameTextField.text?.lowercased()
        let password = passwordTextfield.text
        self.view.addIndicator()
        let param = ["username": username!, "password": password!];

        AF.upload(multipartFormData: { (multiFormData) in
            for (key, value) in param {
                multiFormData.append(Data(value.utf8), withName: key)
            }
        }, to: AuthService.login).validate().responseDecodable(of: LoginModel.self) { response in
            
            switch response.result{
            case .success(_ ):
                self.view.removeIndicator()
                if response.value?.status == "success" {
                    let loginModel = response.value
                    LoginModel.Storage.save(loginModel!)
                    self.didLoginSuccess!()
                }else {
                    toastUser(response.value?.message, color: .red, duration: 3.0)
                }
            case .failure(_ ):
                self.view.removeIndicator()
                toastUser(response.error.debugDescription, color: .red, duration: 3.0)
            }
        }
//        AF.request(Url.login, method: .post, parameters: param,encoding: JSONEncoding.default, headers: headers).validate().responseDecodable(of: AuthModel.self) { response in
//         
//            switch response.result{
//            case .success(_ ):
//                self.view.removeIndicator()
//                locker.email = email
//                self.gotoHome()
//            case .failure(let error ):
//                self.view.removeIndicator()
//                toastUser("Error: \(error.localizedDescription)",color: .red)
//            }
//        }
    }
}
