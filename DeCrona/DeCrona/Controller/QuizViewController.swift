//
//  QuizViewController.swift
//  DeCrona
//
//  Created by Ali Maher on 7/28/20.
//  Copyright © 2020 Ali Maher. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var noButtonlabel: UIButton!
    @IBOutlet weak var mainText: UITextView!
    @IBOutlet weak var yesButtonlabel: UIButton!
    let questions = [
        "Have you come into close contact (within 6 feet) with someone who has a laboratory confirmed COVID – 19 diagnosis in the past 14 days ?",
        "Do you have fever or chills?",
        "Do you have fever or cough?",
        "Do you have fever or shortness of breath or difficulty breathing?",
        "Do you have fever or new loss of taste or smell?",
        "Do you have fever or  sore throat?",
        "Do you have fever or Headache?",
        "Do you have fever or Nausea or vomiting?",
    ]
    var score  = 0
    var curruntIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        startButton.layer.cornerRadius = 10
        noButtonlabel.isHidden = true
        yesButtonlabel.isHidden = true
        mainText.isEditable = false
        
        noButtonlabel.layer.cornerRadius = 10
        yesButtonlabel.layer.cornerRadius = 10

    }
    

    @IBAction func startButtonWork(_ sender: Any) {
        
        
        startButton.isHidden = true
        mainText.text = questions[0]
        noButtonlabel.isHidden = false
        yesButtonlabel.isHidden = false
        
    }
    
    @IBAction func yesButton(_ sender: Any) {
        
        
        if curruntIndex >= questions.count - 1 {
            
            noButtonlabel.isHidden = true
            yesButtonlabel.isHidden = true
            if score >= 6 {
                mainText.text = "It's your proiraty now to see a doctore locate the nearest hospital that deals with the virus, And make sure that you are doing all the precautions you can. And soon you gonna be fine "
            }
            else if score >= 4 {
                
                mainText.text = "Make sure to take all the precautions if you can go to the doctor go if you can not just stay home be healthy if your state didn't improve then you should go the doctor immediatly"
                
            }
            else {
                mainText.text = "Don't worry you are fine, But don't forget to take all your precautions and to stay home , stay safe"

            }
            print(score)
            score = 0
            curruntIndex = 0
            startButton.setTitle("Start Again", for: .normal)
            startButton.isHidden = false
            
        }
        else{
            print("\(curruntIndex) : \(questions.count)")
        score+=1
        curruntIndex+=1
        mainText.text = questions[curruntIndex]
        
        }
        
        
    }
    
    @IBAction func noButton(_ sender: Any) {
        
        if curruntIndex >= questions.count - 1 {
            
            noButtonlabel.isHidden = true
            yesButtonlabel.isHidden = true
            if score >= 6 {
                mainText.text = "It's your proiraty now to see a doctore locate the nearest hospital that deals with the virus, And make sure that you are doing all the precautions you can. And soon you gonna be fine "
            }
            else if score >= 3 {
                
                mainText.text = "Make sure to take all the precautions if you can go to the doctor go if you can not just stay home be healthy if your state didn't improve then you should go the doctor immediatly"
                
            }
            else {
                mainText.text = "Don't worry you are fine, But don't forget to take all your precautions and to stay home , stay safe"

            }
            
            score = 0
            curruntIndex = 0
            startButton.setTitle("Start Again", for: .normal)
            startButton.isHidden = false
            
            
        }
        else{
            print(curruntIndex)
        curruntIndex+=1
        mainText.text = questions[curruntIndex]
        
        }

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
