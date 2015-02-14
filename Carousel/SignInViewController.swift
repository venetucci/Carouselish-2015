//
//  SignInViewController.swift
//  Carousel
//
//  Created by Michelle Venetucci Harvey on 2/13/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func goBackPopViewController(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func signIn(sender: AnyObject) {
        if countElements(emailTextField.text) == 0 {
            UIAlertView(title: "Email Required", message: "Please enter your email address", delegate: self, cancelButtonTitle: "OK").show()
        } else if countElements(passwordTextField.text) == 0 {
            UIAlertView(title: "Password Required", message: "Please enter your password", delegate: self, cancelButtonTitle: "OK").show()
        } else {
            var alertView = UIAlertView(title: "Signing In", message: "", delegate: nil, cancelButtonTitle: nil)
            alertView.show()
            
            delay(2, { () -> () in
                alertView.dismissWithClickedButtonIndex(0, animated: true)
                if self.emailTextField.text == "michelle@gmail.com" && self.passwordTextField.text == "password" {
                    self.performSegueWithIdentifier("WelcomeSegue", sender: self)
                } else {
                    UIAlertView(title: "Sign In Failed", message: "Incorrect email or password", delegate: self, cancelButtonTitle: "OK").show()
                }
            })
        }
    }
}
