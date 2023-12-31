//
//  EditCVDetailsViewController.swift
//  MobileCV
//
//  Created by Tes on 11/09/2023.
//

import UIKit

class EditCVDetailsViewController: UIViewController {
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Curriculum Vitae"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Full Name:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.textColor = .gray
        return label
    }()
    
    var slackNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Slack Username:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.textColor = .gray
        return label
    }()
    
    var githubLabel: UILabel = {
        let label = UILabel()
        label.text = "Github Handle:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.textColor = .gray
        return label
    }()
    
    let fullNameTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        textField.leftViewMode = .always
        textField.font = .systemFont(ofSize: 14)
        textField.adjustsFontSizeToFitWidth = true
        textField.textAlignment = .left
        textField.backgroundColor = .lightGray.withAlphaComponent(0.1)
        textField.isUserInteractionEnabled = true
        textField.layer.cornerRadius = 5
        textField.placeholder = "Full Name"
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        return textField
    }()
    
    let slackNameTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        textField.leftViewMode = .always
        textField.font = .systemFont(ofSize: 14)
        textField.adjustsFontSizeToFitWidth = true
        textField.textAlignment = .left
        textField.backgroundColor = .lightGray.withAlphaComponent(0.1)
        textField.isUserInteractionEnabled = true
        textField.layer.cornerRadius = 5
        textField.placeholder = "Slack Name"
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        return textField
    }()
    
    let githubHandleTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        textField.leftViewMode = .always
        textField.font = .systemFont(ofSize: 14)
        textField.adjustsFontSizeToFitWidth = true
        textField.textAlignment = .left
        textField.backgroundColor = .lightGray.withAlphaComponent(0.1)
        textField.isUserInteractionEnabled = true
        textField.layer.cornerRadius = 5
        textField.placeholder = "Github Handle"
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        return textField
    }()
    
    var briefBioLabel: UILabel = {
        let label = UILabel()
        label.text = "Personal Bio"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 17)
        label.textColor = .gray
        return label
    }()
    
    let bioTextView: UITextView = {
        let textView = UITextView()
        textView.contentInsetAdjustmentBehavior = .automatic
        textView.backgroundColor = .lightGray.withAlphaComponent(0.1)
        textView.font = .systemFont(ofSize: 14)
        textView.layer.cornerRadius = 8
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        button.addTarget(self, action: #selector(didTapSaveButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.navigationController?.isNavigationBarHidden = true
        fullNameTextField.delegate = self
        slackNameTextField.delegate = self
        githubHandleTextField.delegate = self
        bioTextView.delegate = self
        activateConstraint()
        hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        populateViewWithCVModel()
    }
    
    func populateViewWithCVModel() {
        fullNameTextField.text = CVModel.fullName
        slackNameTextField.text = CVModel.slackName
        githubHandleTextField.text = CVModel.githubHandle
        bioTextView.text = CVModel.bio
    }
    
    private func activateConstraint() {
        view.addSubview(backButton)
        view.addSubview(headerLabel)
        view.addSubview(saveButton)
        view.addSubview(nameLabel)
        view.addSubview(githubLabel)
        view.addSubview(slackNameLabel)
        view.addSubview(fullNameTextField)
        view.addSubview(githubHandleTextField)
        view.addSubview(slackNameTextField)
        view.addSubview(briefBioLabel)
        view.addSubview(bioTextView)
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            backButton.widthAnchor.constraint(equalToConstant: 40),
            backButton.heightAnchor.constraint(equalToConstant: 40),
            
            headerLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: headerLabel.topAnchor, constant: 40),
            nameLabel.leadingAnchor.constraint(equalTo: backButton.leadingAnchor, constant: 20),
            
            slackNameLabel.topAnchor.constraint(equalTo: fullNameTextField.bottomAnchor, constant: 16),
            slackNameLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            githubLabel.topAnchor.constraint(equalTo: slackNameTextField.bottomAnchor, constant: 16),
            githubLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            fullNameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            fullNameTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            fullNameTextField.heightAnchor.constraint(equalToConstant: 40),
            fullNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            slackNameTextField.topAnchor.constraint(equalTo: slackNameLabel.bottomAnchor, constant: 4),
            slackNameTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            slackNameTextField.heightAnchor.constraint(equalToConstant: 40),
            slackNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            githubHandleTextField.topAnchor.constraint(equalTo: githubLabel.bottomAnchor, constant: 4),
            githubHandleTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            githubHandleTextField.heightAnchor.constraint(equalToConstant: 40),
            githubHandleTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                        
            briefBioLabel.topAnchor.constraint(equalTo: githubHandleTextField.bottomAnchor, constant: 16),
            briefBioLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            bioTextView.topAnchor.constraint(equalTo: briefBioLabel.bottomAnchor, constant: 6),
            bioTextView.widthAnchor.constraint(equalTo: saveButton.widthAnchor),
            bioTextView.heightAnchor.constraint(equalToConstant: 200),
            bioTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            saveButton.topAnchor.constraint(equalTo: bioTextView.bottomAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            saveButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            saveButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    @objc func didTapSaveButton(){
        let newName = self.fullNameTextField.text?.trimmingCharacters(in: .whitespaces) ?? ""
        let newSlackName = self.slackNameTextField.text?.trimmingCharacters(in: .whitespaces) ?? ""
        let newGithubHandle = self.githubHandleTextField.text?.trimmingCharacters(in: .whitespaces) ?? ""
        let newBio = self.bioTextView.text ?? ""
        if newName == "" {
            self.throwAlertWith(message: "Name field cannot be empty")
            return
        }
        if newSlackName == "" {
            self.throwAlertWith(message: "Slack name field cannot be empty")
            return
        }
        if newGithubHandle == "" {
            self.throwAlertWith(message: "Github handle field cannot be empty")
            return
        }
        if newBio == "" {
            self.throwAlertWith(message: "Bio field cannot be empty")
            return
        }
        CVModel.bio = newBio
        CVModel.fullName = newName
        CVModel.githubHandle = newGithubHandle
        CVModel.slackName = newSlackName
        let alertView = UIAlertController(title: "Alert!", message: "Information successfully updated.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {_ in
            self.navigationController?.popViewController(animated: true)
        })
        alertView.addAction(okAction)
        self.present(alertView, animated: true, completion: nil)
    }
    
    @objc func didTapBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func throwAlertWith(message: String) {
        let alertView = UIAlertController(title: "Alert!", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertView.addAction(okAction)
        self.present(alertView, animated: true, completion: nil)
    }

}

extension EditCVDetailsViewController: UITextFieldDelegate, UITextViewDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        self.view.frame.origin.y = 0 - 200
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        self.view.frame.origin.y = 0
    }
    
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
