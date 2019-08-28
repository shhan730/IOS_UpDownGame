//
//  ViewController.swift
//  UpDownGame
//
//  Created by HSH on 21/08/2019.
//  Copyright © 2019 Ajou University D2fault. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Mark:- Properties
    
    //Mark: IBOutlets
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var turnCountLable: UILabel!
    @IBOutlet weak var inputField: UITextField!
    
    var randomNum: UInt32 = 0
    var turnCount: Int = 0
    
    @IBAction func touchUpSubmitButton(_ sender: UIButton) {
        
        guard let inputText = self.inputField.text,
            inputText.isEmpty == false else {
                print("입력값 없음")
                return
        }
        
        guard let inputNumber: UInt32 = UInt32(inputText) else {
            print("입력값이 잘못 되었음")
            return
        }
        
        turnCount += 1
        self.turnCountLable.text = "\(turnCount)"
        
        if inputNumber > randomNum {
            self.resultLabel.text = "UP!"
        } else if inputNumber < randomNum {
            self.resultLabel.text = "DOWN!"
        } else {
            self.resultLabel.text = "정답입니다!"
        }
        
    }
    
    @IBAction func touchUpResetButton(_ sender: UIButton) {
        self.initializeGame()
    }
    
    @IBAction func tapBackground(_ sender: UITapGestureRecognizer) {
       self.view.endEditing(true)
    }
    
    func initializeGame() {
        self.randomNum = arc4random() % 25
        self.turnCount = 0
        self.resultLabel.text = "Start!"
        self.turnCountLable.text = "\(turnCount)"
        self.inputField.text = nil
        
        print("randomNum = \(self.randomNum)")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.initializeGame()
    }


}

