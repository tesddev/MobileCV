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
        textField.placeholder = "Item Name"
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
        textField.placeholder = "Old password"
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        return textField
    }()
    
    let slackNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Item Name"
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
        textField.placeholder = "Old password"
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        return textField
    }()
    
    let githubHandleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Item Name"
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
        textField.placeholder = "Old password"
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
    
    var theBriefBioLabel: UILabel = {
        let label = UILabel()
        label.text = "Experienced iOS developer with a strong background in Swift and other iOS frameworks."
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 16)
        return label
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
        activateConstraint()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        populateViewWithCVModel()
    }
    
    func populateViewWithCVModel() {
        fullNameTextField.text = CVModel.fullName
        slackNameTextField.text = CVModel.slackName
        githubHandleTextField.text = CVModel.githubHandle
        theBriefBioLabel.text = CVModel.bio
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
        view.addSubview(theBriefBioLabel)
        
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
            
            theBriefBioLabel.topAnchor.constraint(equalTo: briefBioLabel.bottomAnchor, constant: 20),
            theBriefBioLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            theBriefBioLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            saveButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            saveButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    @objc func didTapSaveButton(){
        let alertView = UIAlertController(title: "Alert!", message: "Information updated", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler:{_ in
            self.navigationController?.popViewController(animated: true)
        })
        alertView.addAction(okAction)
        self.present(alertView, animated: true, completion: nil)
    }
    
    @objc func didTapBackButton() {
        self.navigationController?.popViewController(animated: true)
    }

}

extension EditCVDetailsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
