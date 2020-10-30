//
//  UIViewController+Ext.swift
//  TestOctoberProject
//
//  Created by Антон on 19.10.2020.
//  Copyright © 2020 Anton Agafonov. All rights reserved.
//

import UIKit
import SafariServices


extension UIViewController {
    
    func presentALertControllerOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = AlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true, completion: nil)
        }
    }
    
    func showSafariVC(with url: URL) {
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredControlTintColor = .systemGreen
        present(safariVC, animated: true)
    }
}
