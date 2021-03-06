//
//  RodrigoHomeViewController.swift
//  RodrigoExamenDos
//
//  Created by Jaer on 6/5/21.
//  Copyright © 2021 Jaer. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth


class RodrigoHomeViewController: UIViewController {
    
    private let db=Firestore.firestore()
    
    private let email: String
    
    @IBOutlet weak var correoLabel: UILabel!
    
    @IBOutlet weak var correoTex: UITextField!
    
    init(email: String) {
        self.email=email
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        correoLabel.text=email
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        

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

    
    @IBAction func actualizarButtonAction(_ sender: Any) {
        view.endEditing(true)
        db.collection("usuario").document(email).setData([
            "nombre":correoTex.text ?? ""
            ])
        
        
    }
    
    
    @IBAction func refrescarButtonAction(_ sender: Any) {
        
        view.endEditing(true)
        db.collection("usuario").document(email).getDocument { (documentSnapshot, error) in
            if let document=documentSnapshot,error==nil{
                
                self.correoTex.text=document.get("nombre") as? String
            }
        }
        
        
    }
    
    
    @IBAction func eliminarButtonAction(_ sender: Any) {
        
        view.endEditing(true)
        
        db.collection("usuario").document(email).delete()
        
        cerrarSesion()
        
    }
    
    @IBAction func cerrarButtonAction(_ sender: Any) {
        
        cerrarSesion()
        
    }
    
    func cerrarSesion(){
        do {
            try Auth.auth().signOut()
            navigationController?.popViewController(animated: true)
        } catch  {
            //
        }
        
    }
    
    
}
