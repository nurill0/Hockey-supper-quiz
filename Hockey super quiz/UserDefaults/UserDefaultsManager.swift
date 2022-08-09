//
//  UserDefaultsManager.swift
//  Hockey super quiz
//
//  Created by Nurillo Domlajonov on 03/08/22.
//

import Foundation
import UIKit

class UserDefaultsManager{
    static let shared = UserDefaultsManager()
    let defaults = UserDefaults.standard
    //MARK: SET
    func setScore(text: Int){
        defaults.set(text, forKey: "score")
    }
    func checkQuizWorked(isWorked: Bool){
        defaults.set(isWorked, forKey: "worked")
    }
    func setButtonSound(sound: Bool){
        defaults.set(sound, forKey: "sound")
    }

    func setBrightness(brigth: CGFloat){
        defaults.set(brigth, forKey: "bright")
    }
    //MARK: GET
    func getScore()->Int{
         defaults.integer(forKey: "score") 
    }

    func getBrightness()->CGFloat{
        CGFloat(defaults.float(forKey: "bright"))
    }
    func getQuizIsWorkedOnce()->Bool{
        defaults.bool(forKey: "worked")
    }
    func CheckSound()->Bool{
        defaults.bool(forKey: "sound")
    }
   
    
}
