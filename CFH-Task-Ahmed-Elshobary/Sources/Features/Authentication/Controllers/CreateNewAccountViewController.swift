//
//  CreateNewAccountViewController.swift
//  CFH-Task-Ahmed-Elshobary
//
//  Created by ahmed elshobary on 16/03/2024.
//

import UIKit
class CreateNewAccountViewController: AuthenticationBaseController {
    
    var viewModel: CreateNewAccountViewModel = .init()
    let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
    var profilePhoto: String?
    
    
    @IBOutlet weak var ageButtonOutlet: UIButton!
    @IBOutlet var inputsFields: [InputTextField]!
    
    @IBAction func login(_ sender: Any) {
        self.navigator.navigate(to: .login)
    }
    @IBAction func createAccount(_ sender: Any) {
        var result = false
        for item in inputsFields {
            result = item.validateField()
            if result == false {
                return
            }
        }
        if let emailView =  inputsFields.first(where: { $0.tag == 5 }) {
            if emailView.validateEmail() == false {
                return
            }
        }
        
        if let passWordView =  inputsFields.first(where: { $0.tag == 6}) {
            if passWordView.validatePassword() == false {
                return
            }
        }
        viewModel.registerNewUser(fields: inputsFields)
    }
    
    @IBAction func selectAge(_ sender: Any) {
        showYearPicker()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindCreateAccount()
    }
    
    func bindCreateAccount(){

        viewModel.accountCreatedResponse.listen(on: { [weak self] value in
            UserDefaultsManager.shared.setLoggedIn(isLoggedIn: true)
            self?.navigator.setRootHome()
        })
        
    }
    
}

extension CreateNewAccountViewController {
    // Function to present the year picker
    func showYearPicker() {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        let currentDate = Date()
        let calendar = Calendar.current
        let currentYear = calendar.component(.year, from: Date())
        var dateComponents = DateComponents()
        dateComponents.year = -18
        let maxDate = calendar.date(byAdding: dateComponents, to: currentDate)

        // Set the maximum date of the date picker
        datePicker.maximumDate = maxDate
        
        // Handle date picker value change
        datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        if let ageView =   inputsFields.first(where: { $0.tag == 4 }) {
            ageButtonOutlet.addSubview(datePicker)
            ageView.placeHolderText = ""
            let selectedYear = calendar.component(.year, from: datePicker.date)
                let age = currentYear - selectedYear
            ageView.inputTextField.text = "\(age)"
            ageView.inputTextField.isHidden = true
            datePicker.translatesAutoresizingMaskIntoConstraints = false
               NSLayoutConstraint.activate([
                   datePicker.centerXAnchor.constraint(equalTo: ageView.centerXAnchor, constant: -60),
                   datePicker.centerYAnchor.constraint(equalTo: ageView.centerYAnchor, constant: 5), // Adjust the constant as needed
                   datePicker.widthAnchor.constraint(equalTo: ageView.widthAnchor, multiplier: 0.8)
               ])
        }
    }
    // Handle date picker value change
    @objc func dateChanged(_ datePicker: UIDatePicker) {
        // Prevent selecting a date other than the year
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: datePicker.date)
        if let selectedYear = calendar.date(from: components) {
            datePicker.setDate(selectedYear, animated: true)
        }
    }
}
