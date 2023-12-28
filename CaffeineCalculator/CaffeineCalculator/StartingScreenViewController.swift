//
//  StartingScreenViewController.swift
//  CaffeineCalculator
//
//  Created by Ricky Yoshioka on 11/22/23.
//

import UIKit

class StartingScreenViewController: UIViewController {

    @IBOutlet weak var btnCreateAnAccount: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnCreateAnAccount.layer.borderWidth = 2.0 // You can adjust the width
        btnCreateAnAccount.layer.borderColor = UIColor(red: 111/255, green: 78/255, blue: 55/255, alpha: 1.0).cgColor
    }
}
