//
//  ViewController.swift
//  test-gu
//
//  Created by Денис Сизов on 04.10.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction func loginButton(_ sender: UIButton) {
        guard let login = loginTextField.text else { return }
        guard let pass = passwordTextField.text else { return }
        
        if login == "login" && pass == "password" {
            print("Sick auth protection")
        } else {
            print("Wrong pass") //надо бы сделать вывод ошибки во вью
        }
    }
}

