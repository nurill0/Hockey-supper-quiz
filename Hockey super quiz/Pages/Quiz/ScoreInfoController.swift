//
//  ScoreInfoController.swift
//  Hockey super quiz
//
//  Created by Nurillo Domlajonov on 03/08/22.
//

import UIKit

class ScoreInfoController: BaseViewController {
    let titleLabel  =                  UILabel()
    let manager     = UserDefaultsManager.shared
    let scoreLabel  =                  UILabel()
    let scoreView   =                   UIView()
    let ratingLabel =                  UILabel()
    let menuButton  =                 UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        menuButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
    }
    @objc func goBack(){
        playAudio()
        let vc = MainController()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}
//MARK: UI
extension ScoreInfoController{
    private func initViews(){
        view.addSubview(titleLabel)
        view.addSubview(scoreLabel)
        view.addSubview(scoreView)
        view.addSubview(ratingLabel)
        view.addSubview(menuButton)
        titleLabel.text = "Result".localizedDD
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "Verdana-Bold", size: 30)
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(backView.snp.centerY).offset(10)
            make.right.left.equalToSuperview().inset(10)
            make.height.equalTo(backView.snp.height).multipliedBy(0.5)
        }
        if self.view.frame.height>670{
            scoreView.backgroundColor = #colorLiteral(red: 0.8857044578, green: 0.91061759, blue: 0.9359682202, alpha: 1)
            scoreView.layer.cornerRadius = 16
            scoreView.layer.shadowColor = #colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 1)
            scoreView.layer.shadowOffset = CGSize(width: 0, height: 4)
            scoreView.layer.shadowOpacity = 5
            scoreView.backgroundColor = #colorLiteral(red: 0.8808651567, green: 0.9107772112, blue: 0.931748569, alpha: 1)
            scoreView.layer.cornerRadius = 16
            scoreView.snp.makeConstraints { make in
                make.top.equalTo(lineView.snp.bottom).offset(60)
                make.right.left.equalToSuperview().inset(15)
                make.bottom.equalToSuperview().offset(-130)
            }
            view.bringSubviewToFront(scoreLabel)
            scoreLabel.text = "\(manager.getScore())/18"
            scoreLabel.textAlignment = .center
            scoreLabel.textColor =   #colorLiteral(red: 0.1729772389, green: 0.2290724218, blue: 0.3212710023, alpha: 1)
            scoreLabel.font = UIFont(name: "Verdana-Bold", size: 45)
            scoreLabel.snp.makeConstraints { make in
                make.top.equalTo(scoreView.snp.top).offset(10)
                make.centerX.equalToSuperview()
                make.width.equalTo(scoreView.snp.width).multipliedBy(0.8)
                make.height.equalTo(60)
            }
            view.bringSubviewToFront(menuButton)
            menuButton.setTitle("Menu", for: .normal)
            menuButton.backgroundColor =   #colorLiteral(red: 0.1729772389, green: 0.2290724218, blue: 0.3212710023, alpha: 1)
            menuButton.setTitleColor(.white, for: .normal)
            menuButton.layer.cornerRadius = 10
            menuButton.layer.shadowColor = #colorLiteral(red: 0.7215684056, green: 0.7215689421, blue: 0.7344758511, alpha: 1)
            menuButton.layer.shadowOffset = CGSize(width: 0, height: 8)
            menuButton.layer.shadowOpacity = 5
            menuButton.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 32)
            menuButton.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.bottom.equalTo(scoreView.snp.bottom).offset(-20)
                make.width.equalTo(240)
                make.height.equalTo(70)
            }
            view.bringSubviewToFront(ratingLabel)
            ratingLabel.text = "You know a lot about hockey, but not everything"
            ratingLabel.textAlignment = .center
            ratingLabel.textColor =   #colorLiteral(red: 0.1729772389, green: 0.2290724218, blue: 0.3212710023, alpha: 1)
            ratingLabel.numberOfLines = 0
            ratingLabel.font = UIFont(name: "Verdana-Bold", size: 26)
            ratingLabel.snp.makeConstraints { make in
                make.top.equalTo(scoreLabel.snp.bottom).offset(5)
                make.bottom.equalTo(menuButton.snp.top).offset(-5)
                make.right.equalTo(scoreView.snp.right)
                make.left.equalTo(scoreView.snp.left)
            }
        }
        else{
            scoreView.backgroundColor = #colorLiteral(red: 0.8857044578, green: 0.91061759, blue: 0.9359682202, alpha: 1)
            scoreView.layer.cornerRadius = 16
            scoreView.layer.shadowColor = #colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 1)
            scoreView.layer.shadowOffset = CGSize(width: 0, height: 4)
            scoreView.layer.shadowOpacity = 5
            scoreView.backgroundColor = #colorLiteral(red: 0.8808651567, green: 0.9107772112, blue: 0.931748569, alpha: 1)
            scoreView.layer.cornerRadius = 16
            scoreView.snp.makeConstraints { make in
                make.top.equalTo(lineView.snp.bottom).offset(40)
                make.right.left.equalToSuperview().inset(15)
                make.bottom.equalToSuperview().offset(-75)
            }
            view.bringSubviewToFront(scoreLabel)
            scoreLabel.text = "\(manager.getScore())/18"
            scoreLabel.textAlignment = .center
            scoreLabel.textColor =   #colorLiteral(red: 0.1729772389, green: 0.2290724218, blue: 0.3212710023, alpha: 1)
            scoreLabel.font = UIFont(name: "Verdana-Bold", size: 45)
            scoreLabel.snp.makeConstraints { make in
                make.top.equalTo(scoreView.snp.top).offset(10)
                make.centerX.equalToSuperview()
                make.width.equalTo(scoreView.snp.width).multipliedBy(0.8)
                make.height.equalTo(60)
            }
            view.bringSubviewToFront(menuButton)
            menuButton.setTitle("Menu".localizedDD, for: .normal)
            menuButton.backgroundColor =   #colorLiteral(red: 0.1729772389, green: 0.2290724218, blue: 0.3212710023, alpha: 1)
            menuButton.setTitleColor(.white, for: .normal)
            menuButton.layer.cornerRadius = 10
            menuButton.layer.shadowColor = #colorLiteral(red: 0.7215684056, green: 0.7215689421, blue: 0.7344758511, alpha: 1)
            menuButton.layer.shadowOffset = CGSize(width: 0, height: 8)
            menuButton.layer.shadowOpacity = 5
            menuButton.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 32)
            menuButton.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.bottom.equalTo(scoreView.snp.bottom).offset(-20)
                make.width.equalTo(240)
                make.height.equalTo(70)
            }
            view.bringSubviewToFront(ratingLabel)
            ratingLabel.text = "You know a lot about hockey, but not everything"
            ratingLabel.textAlignment = .center
            ratingLabel.textColor =   #colorLiteral(red: 0.1729772389, green: 0.2290724218, blue: 0.3212710023, alpha: 1)
            ratingLabel.numberOfLines = 0
            ratingLabel.font = UIFont(name: "Verdana-Bold", size: 26)
            ratingLabel.snp.makeConstraints { make in
                make.top.equalTo(scoreLabel.snp.bottom).offset(5)
                make.bottom.equalTo(menuButton.snp.top).offset(-5)
                make.right.equalTo(scoreView.snp.right)
                make.left.equalTo(scoreView.snp.left)
            }
        }
        if manager.getScore()==0{
            ratingLabel.text = "You don't know anything about hockey".localizedDD
        } else if manager.getScore()>0 && manager.getScore()<=5{
            ratingLabel.text = "I think you're lucky to have the right answer".localizedDD
        }else if manager.getScore()>5 && manager.getScore()<=8{
            ratingLabel.text = "You've heard something about hockey!".localizedDD
        }else if manager.getScore()>8 && manager.getScore()<=12{
            ratingLabel.text = "You know a lot about hockey, but not everything".localizedDD
        }else if manager.getScore()>12{
            ratingLabel.text = "Cool! You're very smart!".localizedDD
        }
    }
}
