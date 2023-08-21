//
//  ViewController.swift
//  test
//
//  Created by 윤제 on 2023/04/19.
//

import UIKit
import SwiftUI
import Then

class UITestViewController: UIViewController {
    
    let signUpBtn: UIButton = {
        let view = UIButton()
        view.setTitle("signUp", for: .normal)
        view.backgroundColor = .systemPink
        return view
    }()
    
    //vpButton과 동일하지만 타이틀만 "브이피"로 변경된 버튼 만들어줘
    let IDtextField = UITextField().then { view in
        view.placeholder = "아이디를 입력해"
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
    }
    
    let PWtextField = UITextField().then { view in
        view.placeholder = "비밀번호를 입력해"
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
    }
    
    let PWChecktextField = UITextField().then { view in
        view.placeholder = "비밀번호를 한번 더 입력해"
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        signUpBtn.addTarget(self, action: #selector(signUpTouch), for: .touchUpInside)
        
        view.addSubview(signUpBtn)
        signUpBtn.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(IDtextField)
        IDtextField.translatesAutoresizingMaskIntoConstraints = false
        
        [PWtextField, PWChecktextField].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            signUpBtn.widthAnchor.constraint(equalToConstant: 100),
            signUpBtn.heightAnchor.constraint(equalToConstant: 100),
            signUpBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            IDtextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            IDtextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            IDtextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            IDtextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            PWtextField.topAnchor.constraint(equalTo: IDtextField.bottomAnchor, constant: 20),
            PWtextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            PWtextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            PWtextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            PWChecktextField.topAnchor.constraint(equalTo: PWtextField.bottomAnchor, constant: 20),
            PWChecktextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            PWChecktextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            PWChecktextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        signUpBtn.accessibilityIdentifier = "sign"
        IDtextField.accessibilityIdentifier = "id"
        PWtextField.accessibilityIdentifier = "pw"
        PWChecktextField.accessibilityIdentifier = "pwcheck"
    }
    
    @objc func signUpTouch() {
        if PWtextField.text != PWChecktextField.text {
            let alert = UIAlertController(title: "Error", message:"비밀번호와 확인 비밀번호가 다릅니다", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            DispatchQueue.main.async {
                //테스트를 위해 accessibilityIdentifier를 정해줘야함
                alert.view.accessibilityIdentifier = "errorAlertDialog"
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}

//
//#if DEBUG
//struct ViewControllerPreview: PreviewProvider {
//    static var previews: some View {
//        UITestViewController()
//            .toPreview()
//    }
//}
//#endif



class LoginValidator {
    
    func isValidEmail(email:String) -> Bool {
        return email.contains("@")
    }
    
    func isValidPasword(password:String) -> Bool {
        return password.count < 5
    }
    
}


struct User {
    let email:String
    let password:String
    
    init(email:String,password:String) {
        self.email = email
        self.password = password
    }
}
