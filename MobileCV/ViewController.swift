//
//  ViewController.swift
//  MobileCV
//
//  Created by Tes on 11/09/2023.
//

import UIKit

class ViewController: UIViewController {
    let scrollView = UIScrollView()
    let contentView = UIView()
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
    
    var theNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Tesleem Amuda"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    var theSlackNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Tes"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    var githubHandleLabel: UILabel = {
        let label = UILabel()
        label.text = "tesddev"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let detailsView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen.withAlphaComponent(0.1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        return view
    }()
    
    lazy var bioView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen.withAlphaComponent(0.1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        return view
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
        label.text = "Experienced iOS developer with a strong background in Swift and other iOS frameworks. \n\nProven track record of developing high-quality, user-friendly mobile apps that have been featured in the App Store. \n\nSkilled in collaborating with cross-functional teams to deliver innovative solutions on time and within budget. \n\nAlso skilled in technologies like Swift Programming Language, Version Control, Cocoa Touch, Jira, Trello, Azure, among others, integrating 3rd party libraries, consuming Restful APIs, working with Agile/Scrum team in Sprints. \n\nCommitted to staying current with the latest technologies and industry trends. Obsessed with detail and quality."
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    lazy var editButton: UIButton = {
        let button = UIButton()
        button.setTitle("Edit", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        button.addTarget(self, action: #selector(didTapEditButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.contentHorizontalAlignment = .right
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.navigationController?.isNavigationBarHidden = true
        activateConstraint()
    }
    
    private func activateConstraint() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(headerLabel)
        contentView.addSubview(editButton)
        contentView.addSubview(detailsView)
        detailsView.addSubview(nameLabel)
        detailsView.addSubview(githubLabel)
        detailsView.addSubview(slackNameLabel)
        detailsView.addSubview(theNameLabel)
        detailsView.addSubview(theSlackNameLabel)
        detailsView.addSubview(githubHandleLabel)
        contentView.addSubview(bioView)
        bioView.addSubview(briefBioLabel)
        bioView.addSubview(theBriefBioLabel)
        
        scrollView.backgroundColor = UIColor.white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            headerLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            headerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            detailsView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 30),
            detailsView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailsView.widthAnchor.constraint(equalTo: bioView.widthAnchor),
            detailsView.heightAnchor.constraint(equalToConstant: 160),
            
            nameLabel.topAnchor.constraint(equalTo: detailsView.topAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: detailsView.leadingAnchor, constant: 20),
            
            slackNameLabel.centerYAnchor.constraint(equalTo: detailsView.centerYAnchor),
            slackNameLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            githubLabel.bottomAnchor.constraint(equalTo: detailsView.bottomAnchor, constant: -20),
            githubLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            theNameLabel.topAnchor.constraint(equalTo: detailsView.topAnchor, constant: 20),
            theNameLabel.trailingAnchor.constraint(equalTo: detailsView.trailingAnchor, constant: -20),
            
            theSlackNameLabel.centerYAnchor.constraint(equalTo: detailsView.centerYAnchor),
            theSlackNameLabel.trailingAnchor.constraint(equalTo: theNameLabel.trailingAnchor),
            
            githubHandleLabel.bottomAnchor.constraint(equalTo: detailsView.bottomAnchor, constant: -20),
            githubHandleLabel.trailingAnchor.constraint(equalTo: theNameLabel.trailingAnchor),
            
            bioView.topAnchor.constraint(equalTo: detailsView.bottomAnchor, constant: 30),
            bioView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            bioView.bottomAnchor.constraint(equalTo: theBriefBioLabel.bottomAnchor, constant: 30),
            bioView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            bioView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -30),
            
            briefBioLabel.topAnchor.constraint(equalTo: bioView.topAnchor, constant: 20),
            briefBioLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            theBriefBioLabel.topAnchor.constraint(equalTo: briefBioLabel.bottomAnchor, constant: 20),
            theBriefBioLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            theBriefBioLabel.trailingAnchor.constraint(equalTo: bioView.trailingAnchor, constant: -20),
            
            editButton.centerYAnchor.constraint(equalTo: headerLabel.centerYAnchor),
            editButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            editButton.widthAnchor.constraint(equalToConstant: 90),
            editButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    func throwAlertWith(message: String){
        let alertView = UIAlertController(title: "Alert!", message: message, preferredStyle: .alert)
         let okAction = UIAlertAction(title: "OK", style: .default, handler:nil)
         alertView.addAction(okAction)
         self.present(alertView, animated: true, completion: nil)
    }
    
    @objc func didTapEditButton(){
//        let vc = GithubProfileViewController(link: "https://github.com/tesddev", isLinkTextfieldHidden: true)
//        self.navigationController?.pushViewController(vc, animated: true)
    }

}

