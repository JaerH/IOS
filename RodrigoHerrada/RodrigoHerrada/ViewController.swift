//
//  ViewController.swift
//  JulianExamenDos
//
//  Created by Jaer on 6/5/21.
//  Copyright © 2021 Jaer. All rights reserved.
//

import UIKit
import FirebaseAuth


class ViewController: UIViewController {
    
    
    @IBOutlet weak var emailTex: UITextField!
    
    @IBOutlet weak var passwordTex: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func loginButoonAction(_ sender: Any) {
        
        if let email = emailTex.text, let password = passwordTex.text {
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                if let result = result , error == nil {
                    self.emailTex.text=""
                    self.passwordTex.text=""
                    self.navigationController?.pushViewController(RodrigoHomeViewController(email: result.user.email!), animated: true)
        
                    
                    
                }else {
                    
                    let alertController = UIAlertController(title: "Atención", message: "Verifique los datos ingresados", preferredStyle: .alert)
                    
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    
                    self.present(alertController, animated: true, completion: nil)
                    
                }
                
            }
        }

        
    }
    
    
    
    @IBAction func registrateButtonAction(_ sender: Any) {
      navigationController?.pushViewController(RegistrateViewController(), animated: true)
        
        
    }
    
    
    
}

