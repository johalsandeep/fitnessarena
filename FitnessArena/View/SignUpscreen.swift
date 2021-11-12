//
//  SignUpscreen.swift
//  FitnessArena
//
//  Created by Akshay on 2021-11-12.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpScreen: UIViewController{
    


    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var mobileNumber: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpElements()
    }
    func setUpElements() {
        // hiding the error label
        errorLabel.alpha = 0
    }
    
    // check the fields and validate the data is correct. if everything is correct, this method returs nil. otherwise, it returns the error message.
  
    func validateFields() -> String? {
        
        // check that all fields are filled in
        if firstName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || lastName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||  email.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            mobileNumber.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || password.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            //
            
            return "Please fill in all Details"
        }
        // Check if the password is secure
        let cleanedPassword = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
       if  Utilities.isPasswordValid(cleanedPassword) == false {
            //Password is not secure enough
           return "Please make sure your password is at least 8 characters. contains a special character and a number."
        }
        return nil
    }
    
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
    
    //validate the fields
    let error = validateFields()
    
    if error != nil {
        // there is something wrong show error message
       showError(error!)
    }
        else {
            
            // create cleaned versions of the data
            let firstName = firstName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let mobileNumber = mobileNumber.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // create the user
            Auth.auth().createUser(withEmail: email, password: password) {(result, err) in
                
                // check for errors
                if  err != nil {
                    
                    // there was an error creating the user
                    self.showError("Error creating user")
                }
                else {
                    // user was created successfully, now store the first name and last name
                    let db =  Firestore.firestore()
                    
                    db.collection("users").addDocument(data:["firstname": firstName,"lastname": lastName,"mobileNumber":mobileNumber, "uid": result!.user.uid]) { (error) in
                        
                        if error != nil{
                            //show error message
                            
                            self.showError("Error saving data")
                        }
                    }
                    // transition to the home screen
                    self.transitionToHomeScreen()
                }
            }
        }
    }
    
    
    func showError(_ message: String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    
    func transitionToHomeScreen() {
        
      let homeScreen = storyboard?.instantiateViewController(withIdentifier: Constants.storyboard.homeScreen) as? HomeScreen
        
        view.window?.rootViewController = homeScreen
        view.window?.makeKeyAndVisible()
        
    }
}

