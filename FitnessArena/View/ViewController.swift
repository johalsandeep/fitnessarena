//
//  ViewController.swift
//  FitnessArena
//
//  Created by Akshay on 2021-11-12.
//

import UIKit
import FirebaseAuth
class ViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        
        // validate text fields
        
        // create cleaned versions of the text field
        
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // signing in the user
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if error != nil {
                // cooulnt sign in
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
            }
            else {
                
                // transition to the home screen
                self.transitionToHomeScreen()
            }
            
        }
        
    }
    func transitionToHomeScreen() {
        
      let homeScreen = storyboard?.instantiateViewController(withIdentifier: Constants.storyboard.homeScreen) as? HomeScreen
        
        view.window?.rootViewController = homeScreen
        view.window?.makeKeyAndVisible()
        
    }
    
    
}

