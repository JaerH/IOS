//
//  RegistrateViewController.swift
//  JulianExamenDos
//
//  Created by Jaer on 6/6/21.
//  Copyright © 2021 Jaer. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class RegistrateViewController: UIViewController {
    
    
    @IBOutlet weak var correoTex: UITextField!
    
    @IBOutlet weak var passwordTex: UITextField!
    
    private let db=Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    @IBAction func registrarButtonAction(_ sender: Any) {
        view.endEditing(true)
        
        if let email=correoTex.text,let contrasena=passwordTex.text{
            
            Auth.auth().createUser(withEmail: email, password: contrasena) { (result, error) in
                if error != nil {
                let alert=UIAlertController(title: "error", message: "Error de al crear el usuario", preferredStyle: .alert   )
                    
                    alert.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    
                    self.present(alert,animated: true,completion: nil)
                    
                
                }
                else {
                    
                    self.db.collection("usuario").document(email).setData([
                        "nombre":""
                        
                        ])
                    
                    let alert=UIAlertController(title: "Registro exitoso", message: "Ahora estas registrado en cibertec", preferredStyle: .alert   )
                    
                    
                    alert.addAction(UIAlertAction(title: "aceptar", style: .default, handler: { (action) in
                        self.navigationController?.popViewController(animated: true)
                    }))

                    self.present(alert, animated: true, completion: {
                        self.navigationController?.popViewController(animated: true)
                    })
                }
                
            }
            
        }
        
    }
    
    
    
}
