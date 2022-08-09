//
//  QuizData.swift
//  Hockey super quiz
//
//  Created by Nurillo Domlajonov on 03/08/22.
//

import Foundation
import UIKit

struct Question {
    let taskLabel : String
    let choose1   : String
    let choose2   : String
    let choose3   : String
    let answer    : String
}
struct QuestionData{
    var questionNumber = 0
    var score          = 0
    var numberOfQuiz   = 0
    var isFinish = false
    var dataOfQuiz: [Question] = [
        Question(taskLabel: "What is dribbling?".localizedDD,
                 choose1: "Short strokes with the stick on the puck".localizedDD,
                 choose2: "Kick on own goal".localizedDD,
                 choose3: "Kick on opponent's goal".localizedDD,
                 answer: "Short strokes with the stick on the puck".localizedDD),
        
        Question(taskLabel: "What is a dodge?".localizedDD,
                 choose1: "A power play".localizedDD,
                 choose2: "Puck kick".localizedDD,
                 choose3: "Deceptive short move".localizedDD,
                 answer: "Deceptive short move".localizedDD),
        
        Question(taskLabel: "What does a hockey player wear to protect his hands?".localizedDD,
                 choose1: "Rings".localizedDD,
                 choose2: "Gloves".localizedDD,
                 choose3: "Mittens".localizedDD,
                 answer: "Gloves".localizedDD),
        
        Question(taskLabel: "Duration of the game in hockey?".localizedDD,
                 choose1: "Round".localizedDD,
                 choose2: "Time".localizedDD,
                 choose3: "Period".localizedDD,
                 answer: "Period".localizedDD),
        
        Question(taskLabel: "What is skate blade protection called?".localizedDD,
                 choose1: "Sheaths".localizedDD,
                 choose2: "Shields".localizedDD,
                 choose3: "Tips".localizedDD,
                 answer: "Sheaths".localizedDD),
        
        Question(taskLabel: "Why do you need a washer?".localizedDD,
                 choose1: "To kick it?".localizedDD,
                 choose2: "For beauty".localizedDD,
                 choose3: "To score goals with it".localizedDD,
                 answer: "To score goals with it".localizedDD),
        
        Question(taskLabel: "A hockey match consists of...".localizedDD,
                 choose1: "2 periods".localizedDD,
                 choose2: "3 periods".localizedDD,
                 choose3: "4 periods".localizedDD,
                 answer: "3 periods".localizedDD),
        Question(taskLabel: "The net time duration of one period is:".localizedDD,
                 choose1: "20 minutes".localizedDD,
                 choose2: "30 minutes".localizedDD,
                 choose3: "45 minutes".localizedDD,
                 answer: "20 minutes".localizedDD),
        
        Question(taskLabel: "What is a hockey player's clothing called?".localizedDD,
                 choose1: "Equipment".localizedDD,
                 choose2: "Outfit".localizedDD,
                 choose3: "Overalls".localizedDD,
                 answer: "Outfit".localizedDD),
        
        Question(taskLabel: "What is a penalty shot in hockey called?".localizedDD,
                 choose1: "Gambit".localizedDD,
                 choose2: "Bullitt".localizedDD,
                 choose3: "Yulit".localizedDD,
                 answer: "Bullitt".localizedDD),
        Question(taskLabel: "At which rink was the first hockey game played?".localizedDD,
                 choose1: "«Commonwealth Stadium".localizedDD,
                 choose2: "«Victoria»".localizedDD,
                 choose3: "«Rogers Center»".localizedDD,
                 answer: "«Victoria»".localizedDD),
        
        Question(taskLabel: "Which country's team is the reigning world hockey champion?".localizedDD,
                 choose1: "Russia".localizedDD,
                 choose2: "Canada".localizedDD,
                 choose3: "Finland".localizedDD,
                 answer: "Finland".localizedDD),
        
        Question(taskLabel: "In which city was the Amateur Hockey Association founded?".localizedDD,
                 choose1: "Calgary".localizedDD,
                 choose2: "Ottawa".localizedDD,
                 choose3: "Montreal".localizedDD,
                 answer: "Montreal".localizedDD),
        
        Question(taskLabel: "Which hockey trophy is awarded annually to the winner of the National Hockey League playoffs?".localizedDD,
                 choose1: "Stanley Cup".localizedDD,
                 choose2: "Gagarin Cup".localizedDD,
                 choose3: "Continental Cup".localizedDD,
                 answer: "Stanley Cup".localizedDD),
        
        Question(taskLabel: "How many players from one team can be on the field at one time during a game?".localizedDD,
                 choose1: "7".localizedDD,
                 choose2: "6".localizedDD,
                 choose3: "5".localizedDD,
                 answer: "6".localizedDD),
        
        Question(taskLabel: "When is a penalty shot awarded in ice hockey?".localizedDD,
                 choose1: "All of the above".localizedDD,
                 choose2: "A player intentionally moved the goal to hinder an opponent".localizedDD,
                 choose3: "A penalized player entered the court to interfere with a goal".localizedDD,
                 answer: "All of the above".localizedDD),
            
        Question(taskLabel: "Which country is the birthplace of modern ice hockey?".localizedDD,
                 choose1: "Brazil".localizedDD,
                 choose2: "Argentina".localizedDD,
                 choose3: "Canada".localizedDD,
                 answer: "Canada".localizedDD),
        
        Question(taskLabel: "In what year was the shootout legalized?".localizedDD,
                 choose1: "1928".localizedDD,
                 choose2: "1934".localizedDD,
                 choose3: "1940".localizedDD,
                 answer: "1934".localizedDD)
        
  ]
    //MARK: BUTTONGA JAOVBLARNI ULASH
    func getAnswer()->[String]{
        let answer = [
            dataOfQuiz[questionNumber].choose1,
            dataOfQuiz[questionNumber].choose2,
            dataOfQuiz[questionNumber].choose3,
        ]
        return answer
    }
    //MARK: RASMLARNI ULASH
    
    //MARK: SAVOLLARNI LABELGA ULASH
    func getQuestionLabel()->String{
        return dataOfQuiz[questionNumber].taskLabel
    }
    //MARK: keyngi savolga o`tish
    mutating func nextQuestion(){
        if questionNumber < dataOfQuiz.count - 1 {
            questionNumber += 1
            isFinish = false
            
        }
        else{
            isFinish = true
            questionNumber = 0
        }
    }
    
    //MARK: savol raqamini olish
    func getQuestionNumber()->Int{
        return questionNumber
    }
    //MARK: javob to`g`ri noto`g`rililigini tekshirish
    mutating func checkAnswer(userAnswer: String)->Bool{
        if userAnswer == dataOfQuiz[questionNumber].answer{
            score+=1
            return true
        } else{
            return false
        }
    }
    //MARK: Shotni yuborish
    func getScore()->Int{
        return score
    }
    
    
    
}

