//
//  ViewController.swift
//  testApp
//
//  Created by 平沢　こずえ on 2017/06/15.
//  Copyright © 2017年 平沢　こずえ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet fileprivate weak var resultLabel: UILabel!
    @IBOutlet weak var diceInputView: InputView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.isHidden = true
        diceInputView.setUp(delegate: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// delegate
extension ViewController: InputViewDelegate {
    func tapDiceRollButton(result: String) {
        resultLabel.text = result
        resultLabel.isHidden = false
    }
}
