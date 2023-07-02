//
//  AuthorizationViewController.swift
//  HW2
//
//  Created by Тимур Хайруллин on 02.07.2023.
//

import UIKit

class AuthorizationViewController: UIViewController {
    
    private let password = "helloWorld"

    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    func displayErrorModal(message: String) {
        let alertController = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func pushButtonAction(_ sender: Any) {
        
        guard let phoneNumber = phoneTextField.text,  phoneNumber.hasPrefix("8908") && phoneNumber.count == 11 else {
            displayErrorModal(message: "Неверный номер телефона!")
            return
        }
        
        guard let enteredPassword = passwordTextField.text,  enteredPassword == password else {
            displayErrorModal(message: "Неверный пароль!")
            return
        }
        
    
        guard let contactsVC = storyboard?.instantiateViewController(withIdentifier: "ContactTableViewController") as? ContactTableViewController else { return }
        
        navigationController?.pushViewController(contactsVC, animated: true)
        
        let contactCell = ListTableViewData(title: phoneNumber, image: UIImage(imageLiteralResourceName: "contact"))
        

        contactsVC.data.append(contactCell)
        phoneTextField.text = nil
        passwordTextField.text = nil
    }
    
}
