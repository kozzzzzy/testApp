//
//  InputView.swift
//  testApp
//
//  Created by 平沢　こずえ on 2017/06/15.
//  Copyright © 2017年 平沢　こずえ. All rights reserved.
//

import UIKit

protocol InputViewDelegate {
    func tapDiceRollButton(result: String)
}

class InputView: UIView {
    private var delegate: InputViewDelegate?
    
    @IBOutlet private weak var diceNumberTextField: UITextField!
    @IBOutlet private weak var diceDimensionTextField: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        loadNib()
    }
    
    func setUp(delegate: InputViewDelegate) {
        self.delegate = delegate
    }
    
    func loadNib(){
        let view = Bundle.main.loadNibNamed("InputView", owner: self)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    func makeResult() -> String {
        guard let diceNumberText = diceNumberTextField.text,
            let diceDimensionText = diceDimensionTextField.text,
            let diceNumber = Int(diceNumberText),
            let diceDimension = Int(diceDimensionText) else {
                return "error"
        }
        
        var diceArray = [Int]()
        
        for _ in 0 ..< diceNumber {
            let random = arc4random_uniform(UInt32(diceDimension))
            diceArray.append(Int(random + 1))
        }
        let sum = diceArray.reduce(0, { (num1, num2) -> Int in
            num1 + num2
        })
        
        return sum.description
    }
    
    @IBAction func tapDiceRollButton() {
        let result = makeResult()
        delegate?.tapDiceRollButton(result: result)
    }
}
