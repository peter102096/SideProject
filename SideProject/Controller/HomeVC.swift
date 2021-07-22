//
//  ViewController.swift
//  CMoneyInterview
//
//  Created by Peter on 2021/7/21.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func startBtnAction(_ sender: Any) {
        print("startBtnAction")
        let vc = DataListVC.fromStoryBoard()
        push(vc: vc)
    }
    
}

