//
//  UserInfoVC.swift
//  TestOctoberProject
//
//  Created by Антон on 26.10.2020.
//  Copyright © 2020 Anton Agafonov. All rights reserved.
//

import UIKit
import SafariServices

protocol UserInfoVCDelegate: class {
    func didRequestFollowers(from username: String)
}

class UserInfoVC: AADataLoadingVC {
    
    var username: String!
    weak var delegate: UserInfoVCDelegate!
    
    let scrollView          = UIScrollView()
    let contentView         = UIView()
    
    let headerView          = UIView()
    let itemViewOne         = UIView()
    let itemViewTwo         = UIView()
    let dateLabel           = AABodyLabel(textAlignment: .center)
    var itemViews: [UIView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        configureScrollView()
        layoutUI()
        getUserInfo()
    }
    
    func configureVC() {
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    func configureScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.pinToEdges(on: view)
        contentView.pinToEdges(on: scrollView)
        
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 620)
        ])
    }
    
    func getUserInfo() {
        NetworkManager.shared.getUser(for: username) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let user):
                DispatchQueue.main.async { self.configureUIElements(with: user) }
            case .failure(let error):
                self.presentALertControllerOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }
    
    func configureUIElements(with user: User) {
        self.add(childVC: AAUserInfoHeaderVC(user: user), to: self.headerView)
        self.add(childVC: AARepoItemVC(user: user, delegate: self), to: self.itemViewOne)
        self.add(childVC: AAFollowerItemVC(user: user, delegate: self), to: self.itemViewTwo)
        self.dateLabel.text = "GitHub since \(user.createdAt.convertToMonthYear())"
    }
    
    func layoutUI() {
        let padding: CGFloat = 20
        itemViews = [headerView, itemViewOne, itemViewTwo, dateLabel]
        
        for itemView in itemViews {
            contentView.addSubview(itemView)
            itemView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                itemView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
                itemView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding)
            ])
        }
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 180),
            
            itemViewOne.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: padding),
            itemViewOne.heightAnchor.constraint(equalToConstant: 140),
            
            itemViewTwo.topAnchor.constraint(equalTo: itemViewOne.bottomAnchor, constant: padding),
            itemViewTwo.heightAnchor.constraint(equalToConstant: 140),
            
            dateLabel.topAnchor.constraint(equalTo: itemViewTwo.bottomAnchor, constant: padding),
            dateLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
    
    func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
}

extension UserInfoVC: AAFollowerItemVCDelegate {
    func didTapGitHubProfile(with user: User) {
        guard let url = URL(string: user.htmlUrl) else {
            presentALertControllerOnMainThread(title: "Invalid URL", message: "The url attached to this user is invalid.", buttonTitle: "Ok")
            return
        }
        showSafariVC(with: url)
    }
}

extension UserInfoVC: AARepoItemVCCDelegate {
    
    func didTapGetFollower(with user: User) {
        guard user.followers != 0 else {
            presentALertControllerOnMainThread(title: "No follower", message: "This user hasn't any follower.", buttonTitle: "Ok")
            return
        }
        delegate.didRequestFollowers(from: user.login)
        dismissVC()
    }
}

