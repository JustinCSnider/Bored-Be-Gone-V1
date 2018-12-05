//
//  NewAccountViewController.swift
//  BoredBeGone
//
//  Created by Justin Snider on 10/26/18.
//  Copyright © 2018 Justin Snider. All rights reserved.
//

import UIKit
import CoreData

class NewAccountViewController: UIViewController, UITextFieldDelegate, ManagedObjectContextDependentType {
    
    //========================================
    //MARK: - Properties
    //========================================	
    
    var managedObjectContext: NSManagedObjectContext!
    var accounts: [Account] = []
    
    //========================================
    //MARK: - Outlets
    //========================================
    
    @IBOutlet var bottomView: UIView!
    @IBOutlet weak var usernameErrorLabel: UILabel!
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    @IBOutlet weak var confirmPasswordErrorLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    //========================================
    //MARK: - Life Cycle Methods
    //========================================
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //fetchAccounts()
        
        usernameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
        
        usernameTextField.becomeFirstResponder()
        
        passwordTextField.isSecureTextEntry = true
        confirmPasswordTextField.isSecureTextEntry = true
        
        bottomView.addBorder(side: .Top, thickness: 1, color: UIColor.lightGray)
        // Do any additional setup after loading the view.
    }
    
    
    //========================================
    //MARK: - Text Field Delegate Methods
    //========================================
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == usernameTextField && !(usernameTextField.text ?? "").isEmpty {
            var accountUserNames: [String] = []
            for i in accounts {
                accountUserNames.append(i.username)
            }
            if accountUserNames.contains(usernameTextField.text ?? "") {
                usernameErrorLabel.isHidden = false
            } else {
                usernameErrorLabel.isHidden = true
            }
        } else if textField == emailTextField && !(emailTextField.text ?? "").isEmpty {
            if !isValid(emailTextField.text ?? "") {
                emailErrorLabel.isHidden = false
            } else {
                emailErrorLabel.isHidden = true
            }
        }
    }
    
    //========================================
    //MARK: - Core Data
    //========================================
    
    func fetchAccounts() {
        let accountsFetchRequest = NSFetchRequest<Account>(entityName: Account.entityName)
        
        do {
            self.accounts = try self.managedObjectContext.fetch(accountsFetchRequest)
        } catch {
            self.accounts = []
            print("Something went wrong \(error)")
        }
    }
    
    func saveToCoreData() {
        do {
            try managedObjectContext.save()
        } catch {
            print("Something went wrong \(error)")
            managedObjectContext.rollback()
        }
    }
    
    
    //========================================
    //MARK: - Helper methods
    //========================================

    
    func isValid(_ email: String) -> Bool {
        let emailRegEx = "(?:[a-zA-Z0-9!#$%\\&‘*+/=?\\^_`{|}~-]+(?:\\.[a-zA-Z0-9!#$%\\&'*+/=?\\^_`{|}" +
        "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" +
        "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-" +
        "z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5" +
        "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" +
        "9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" +
        "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        
        let emailTest = NSPredicate(format:"SELF MATCHES[c] %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
}
