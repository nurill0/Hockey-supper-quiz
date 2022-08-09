//
//  MainController.swift
//  Hockey super quiz
//
//  Created by Nurillo Domlajonov on 03/08/22.
//

import UIKit
import AVFoundation
class MainController: BaseViewController {
    let quizButton     =    UIButton(type: .system)
    let answerButton   =    UIButton(type: .system)
    let lockImage      =              UIImageView()
    let shopButton     =    UIButton(type: .system)
    let settingsButton =    UIButton(type: .system)
    let lockView       =                   UIView()
    let titleLabel     =                  UILabel()
    let manager        = UserDefaultsManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        answerButton.addTarget(self, action: #selector(goAnswerPage), for: .touchUpInside)
        quizButton.addTarget(self, action: #selector(goQuizPage), for: .touchUpInside)
        settingsButton.addTarget(self, action: #selector(goSettingPage), for: .touchUpInside)
        shopButton.addTarget(self, action: #selector(goShopPage), for: .touchUpInside)
        }
    
}
//MARK: actions
extension MainController{
    
    @objc func goQuizPage(){
        playAudio()
        let vc = QuizController()
        vc.modalTransitionStyle = .flipHorizontal
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    @objc func goAnswerPage(){
        playAudio()
        let vc = AnswerController()
        vc.modalTransitionStyle = .flipHorizontal
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    @objc func goSettingPage(){
        playAudio()
        let vc = SettingController()
        vc.modalTransitionStyle = .flipHorizontal
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    @objc func goShopPage(){
        playAudio()
        let vc = ShopController()
        vc.modalTransitionStyle = .flipHorizontal
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
}
//MARK: UI
extension MainController{
    private func initViews(){
        view.addSubview(quizButton)
        view.addSubview(answerButton)
        view.addSubview(lockImage)
        view.addSubview(shopButton)
        view.addSubview(settingsButton)
        view.addSubview(lockView)
        view.addSubview(titleLabel)
        
        titleLabel.text = "Hockey super quiz".localizedDD
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "Verdana-Bold", size: 30)
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(backView.snp.centerY).offset(10)
            make.right.left.equalToSuperview().inset(10)
            make.height.equalTo(backView.snp.height).multipliedBy(0.5)
        }
        
        answerButton.setTitle("Answers".localizedDD, for: .normal)
        answerButton.setTitleColor(.white, for: .normal)
        answerButton.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 25)
        answerButton.backgroundColor =  #colorLiteral(red: 0.1729772389, green: 0.2290724218, blue: 0.3212710023, alpha: 1)
        answerButton.layer.cornerRadius = 10
        
        answerButton.layer.shadowColor = #colorLiteral(red: 0.7215684056, green: 0.7215689421, blue: 0.7344758511, alpha: 1)
        answerButton.layer.shadowOffset = CGSize(width: 0, height: 8)
        answerButton.layer.shadowOpacity = 5
        answerButton.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(75)
            make.width.equalToSuperview().multipliedBy(0.7)
        }
        view.bringSubviewToFront(lockImage)
        lockImage.image = UIImage(named: "lock")
        lockImage.contentMode = .scaleAspectFit
        lockImage.layer.cornerRadius = 10
        lockImage.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.centerX.equalToSuperview()
            make.centerY.equalTo(answerButton.snp.centerY)
            make.width.equalToSuperview().multipliedBy(0.7)
        }
        
        lockView.layer.cornerRadius = 10
        lockView.backgroundColor = #colorLiteral(red: 0.5278528333, green: 0.557826817, blue: 0.6172178388, alpha: 0.4)
        lockView.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.centerX.equalToSuperview()
            make.centerY.equalTo(answerButton.snp.centerY)
            make.width.equalToSuperview().multipliedBy(0.7)
        }
        
        quizButton.setTitle("Quiz".localizedDD, for: .normal)
        quizButton.setTitleColor(.white, for: .normal)
        quizButton.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 25)
        quizButton.backgroundColor =  #colorLiteral(red: 0.1729772389, green: 0.2290724218, blue: 0.3212710023, alpha: 1)
        quizButton.layer.cornerRadius = 10
        quizButton.layer.shadowColor = #colorLiteral(red: 0.7215684056, green: 0.7215689421, blue: 0.7344758511, alpha: 1)
        quizButton.layer.shadowOffset = CGSize(width: 0, height: 8)
        quizButton.layer.shadowOpacity = 5
        quizButton.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.bottom.equalTo(answerButton.snp.top).offset(-30)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.7)
        }
        settingsButton.setImage(UIImage(named: "setting")?.withRenderingMode(.alwaysOriginal), for: .normal)
        settingsButton.backgroundColor = #colorLiteral(red: 0.1729772389, green: 0.2290724218, blue: 0.3212710023, alpha: 1)
        settingsButton.imageView?.contentMode = .scaleAspectFit
        settingsButton.layer.cornerRadius = 10
        settingsButton.layer.shadowColor = #colorLiteral(red: 0.7215684056, green: 0.7215689421, blue: 0.7344758511, alpha: 1)
        settingsButton.layer.shadowOffset = CGSize(width: 0, height: 8)
        settingsButton.layer.shadowOpacity = 5
        settingsButton.snp.makeConstraints { make in
            make.top.equalTo(answerButton.snp.bottom).offset(40)
            make.right.equalTo(answerButton.snp.right)
            make.height.equalTo(80)
            make.width.equalTo(100)
            
        }
        
        shopButton.setImage(UIImage(named: "shop")?.withRenderingMode(.alwaysOriginal), for: .normal)
        shopButton.backgroundColor = #colorLiteral(red: 0.1729772389, green: 0.2290724218, blue: 0.3212710023, alpha: 1)
        shopButton.imageView?.contentMode = .scaleAspectFit
        shopButton.layer.cornerRadius = 10
        shopButton.layer.shadowColor = #colorLiteral(red: 0.7215684056, green: 0.7215689421, blue: 0.7344758511, alpha: 1)
        shopButton.layer.shadowOffset = CGSize(width: 0, height: 8)
        shopButton.layer.shadowOpacity = 5
        shopButton.snp.makeConstraints { make in
            make.top.equalTo(answerButton.snp.bottom).offset(40)
            make.left.equalTo(answerButton.snp.left)
            make.height.equalTo(80)
            make.width.equalTo(100)
        }
        if manager.getQuizIsWorkedOnce(){
            lockView.isHidden = true
            lockImage.isHidden = true
            view.bringSubviewToFront(answerButton)
        }else{
            lockView.isHidden = false
            lockImage.isHidden = false
        }
    }
}
