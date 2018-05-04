//
//  DetailNewsViewController+UITextViewDelegate.swift
//  CategoryNews
//
//  Created by Рамиз Кичибеков on 05.05.2018.
//  Copyright © 2018 Рамиз Кичибеков. All rights reserved.
//

import UIKit
import SafariServices

extension DetailNewsViewController: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        let safariViewController = SFSafariViewController(url: URL)
        safariViewController.delegate = self
        present(safariViewController, animated: true, completion: nil)
        
        return false
    }
    
}
