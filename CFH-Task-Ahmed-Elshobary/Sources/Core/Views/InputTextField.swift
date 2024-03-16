//
//  InputTextField.swift
//  CFH-Task-Ahmed-Elshobary
//
//  Created by ahmed elshobary on 16/03/2024.
//

import UIKit

class InputTextField: UIView {
    
    // MARK: - outlets
    
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var mView: UIView!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var showPasswordButton: UIButton!{
        didSet{
            showPasswordButton.isHidden = !isPassword
        }
    }
    
    @IBInspectable var title:String = ""{
        didSet {
            titleLabel.text = title
        }
    }
    
    @IBInspectable var error:String = ""{
        didSet {
            errorLabel.text = error
        }
    }
    
    @IBInspectable var placeHolderText :String = ""{
        didSet {
            inputTextField.placeholder = placeHolderText
        }
    }
    
    @IBInspectable var isPassword:Bool = false{
        didSet {
            inputTextField.isSecureTextEntry = isPassword
            showPasswordButton.isHidden = !isPassword
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: 1000, height: 90))
        commonInit()
        showPasswordButton.isHidden = !isPassword
    }
    
    @IBAction func showPassword(_ sender: Any) {
        if inputTextField.isSecureTextEntry {
            inputTextField.isSecureTextEntry = false
        } else {
            inputTextField.isSecureTextEntry = true
        }
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
       
        commonInit()
        showPasswordButton.isHidden = !isPassword
    }
    
    fileprivate func commonInit() {
       
        let subView = viewFromNibForClass()
        inputTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        subView.frame = bounds
        subView.autoresizingMask = [
            UIView.AutoresizingMask.flexibleWidth,
            UIView.AutoresizingMask.flexibleHeight
        ]
        addSubview(subView)
    }
    
    func validateField() -> Bool{
        if inputTextField.text == "" {
            mView.layer.borderColor = UIColor.red.cgColor
            errorLabel.isHidden = false
            return false
        }else{
            mView.layer.borderColor = UIColor.defaultFieldBorderColor.cgColor
            errorLabel.isHidden = true
            return true
            
        }
    }
    
    func showError(){
        mView.layer.borderColor = UIColor.red.cgColor
        errorLabel.isHidden = false
    }
    
    func returnToDefaults(){
        mView.layer.borderColor = UIColor.defaultFieldBorderColor.cgColor
        errorLabel.isHidden = true
    }
    
    fileprivate func viewFromNibForClass() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        
        returnToDefaults()
        
}
    
}


extension InputTextField {
    
    // Validate email format
    func validateEmail() -> Bool {
        guard let email = inputTextField.text else { return false }
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        if emailPredicate.evaluate(with: email) == false {
            mView.layer.borderColor = UIColor.red.cgColor
            errorLabel.isHidden = false
        }
        return emailPredicate.evaluate(with: email)
    }
    
    // Validate password format
    func validatePassword() -> Bool {
        guard let password = inputTextField.text else { return false }
        let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        if passwordPredicate.evaluate(with: password) == false {
            mView.layer.borderColor = UIColor.red.cgColor
            errorLabel.isHidden = false
        }
        return passwordPredicate.evaluate(with: password)
    }
    
    // Validate age
    func validateAge() -> Bool {
        guard let ageText = inputTextField.text, let age = Int(ageText) else { return false }
        return age >= 18
    }
    
}
