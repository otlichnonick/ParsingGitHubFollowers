//
//  AAFollowerItemVC.swift
//  TestOctoberProject
//
//  Created by Антон on 27.10.2020.
//  Copyright © 2020 Anton Agafonov. All rights reserved.
//

import UIKit

protocol AAFollowerItemVCDelegate: class {
    func didTapGetFollower(with user: User)
}

class AAFollowerItemVC: AAItemInfoVC {
    
    weak var delegate: AAFollowerItemVCDelegate!
    
    init(user: User, delegate: AAFollowerItemVCDelegate) {
        super.init(user: user)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, with: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, with: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
    }
    
    override func actionButtonPressed() {
        delegate.didTapGetFollower(with: user)
    }
}
