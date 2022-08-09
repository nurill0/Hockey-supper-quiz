//
//  QuizController.swift
//  Hockey super quiz
//
//  Created by Nurillo Domlajonov on 03/08/22.
//

import UIKit


class QuizController: BaseViewController {
    let titleLabel     =                  UILabel()
    let taskView       =                   UIView()
    let questionNumber =                  UILabel()
    var number         =                        1 {
        didSet {
            questionNumber.text = "\(number+1)/18"
        }
    }
    let taskLabel      =                  UILabel()
    let stackView      =              UIStackView()
    let answerButtona  = AppButtons(title: "Qizil",
                                    fontSize: 20,
                                    bgcColor:  #colorLiteral(red: 0.8857044578, green: 0.91061759, blue: 0.9359682202, alpha: 1),
                                    titleColor: #colorLiteral(red: 0.1729772389, green: 0.2290724218, blue: 0.3212710023, alpha: 1),
                                    radius: 10,
                                    borderWidth: 1)
    let answerButtonb  = AppButtons(title: "Ikloa",
                                    fontSize: 20,
                                    bgcColor:  #colorLiteral(red: 0.8808651567, green: 0.9107772112, blue: 0.931748569, alpha: 1),
                                    titleColor: #colorLiteral(red: 0.1729772389, green: 0.2290724218, blue: 0.3212710023, alpha: 1),
                                    radius: 10,
                                    borderWidth: 1)
    let answerButtonc  = AppButtons(title: "taniq",
                                    fontSize: 20,
                                    bgcColor: #colorLiteral(red: 0.8808651567, green: 0.9107772112, blue: 0.931748569, alpha: 1),
                                    titleColor: #colorLiteral(red: 0.1729772389, green: 0.2290724218, blue: 0.3212710023, alpha: 1),
                                    radius: 10,
                                    borderWidth: 1)
    var question       =             QuestionData()
    let manager        = UserDefaultsManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        initStackView()
        updateUI()
        answerButtona.addTarget(self, action: #selector(answerButtonPressed(sender:)), for: .touchUpInside)
        answerButtonb.addTarget(self, action: #selector(answerButtonPressed(sender:)), for: .touchUpInside)
        answerButtonc.addTarget(self, action: #selector(answerButtonPressed(sender:)), for: .touchUpInside)
        
    }
    
}
//MARK: UI
extension QuizController{
    @objc func answerButtonPressed(sender: UIButton){
        playAudio()
        
        let userAnswered = sender.currentTitle!
        let userChooseRight = question.checkAnswer(userAnswer: userAnswered)
        if userChooseRight {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        question.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    func goResult(){
        let vc = ScoreInfoController()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    @objc func updateUI(){
        number = question.questionNumber
        if question.isFinish == false {
            answerButtona.setTitle(question.getAnswer()[0], for: .normal)
            answerButtonb.setTitle(question.getAnswer()[1], for: .normal)
            answerButtonc.setTitle(question.getAnswer()[2], for: .normal)
            taskLabel.text = question.getQuestionLabel()
            answerButtona.backgroundColor =  #colorLiteral(red: 0.8857044578, green: 0.91061759, blue: 0.9359682202, alpha: 1)
            answerButtonb.backgroundColor =  #colorLiteral(red: 0.8857044578, green: 0.91061759, blue: 0.9359682202, alpha: 1)
            answerButtonc.backgroundColor =  #colorLiteral(red: 0.8857044578, green: 0.91061759, blue: 0.9359682202, alpha: 1)
        }else{
            manager.setScore(text: self.question.getScore())
            manager.checkQuizWorked(isWorked: true)
            goResult()
            questionNumber.text = "18/18"

        }
        
        
    }
    func initStackView(){
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.backgroundColor = .clear
        stackView.spacing = 10
        view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(taskLabel.snp.bottom).offset(10)
            make.right.left.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().offset(-30)
        }
        stackView.addArrangedSubview(answerButtona)
        stackView.addArrangedSubview(answerButtonb)
        stackView.addArrangedSubview(answerButtonc)
    }
    
    private func initViews(){
        view.addSubview(titleLabel)
        view.addSubview(questionNumber)
        view.addSubview(taskLabel)
        view.addSubview(stackView)
        view.addSubview(answerButtona)
        view.addSubview(answerButtonb)
        view.addSubview(answerButtonc)
        view.addSubview(taskView)
        titleLabel.text = "Quiz".localizedDD
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "Verdana-Bold", size: 30)
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(backView.snp.centerY).offset(10)
            make.right.left.equalToSuperview().inset(10)
            make.height.equalTo(backView.snp.height).multipliedBy(0.5)
        }
        questionNumber.text = "\(number)/18"
        questionNumber.textAlignment = .center
        questionNumber.textColor = #colorLiteral(red: 0.1769271195, green: 0.2329967022, blue: 0.3293959498, alpha: 1)
        questionNumber.font = UIFont(name: "Verdana-Bold", size: 25)
        questionNumber.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalTo(30)
            make.top.equalTo(lineView.snp.bottom).offset(20)
        }
        
        taskLabel.text = "Какой хоккейный приз ежегодно вручается победителю плей-офф Национальной хоккейной лиги?"
        taskLabel.textAlignment = .center
        taskLabel.textColor =  #colorLiteral(red: 0.1769271195, green: 0.2329967022, blue: 0.3293959498, alpha: 1)
        taskLabel.numberOfLines = 0
        taskLabel.layer.cornerRadius = 16
        taskLabel.font = UIFont(name: "Verdana-Bold", size: 20)
        taskLabel.backgroundColor =  #colorLiteral(red: 0.8808651567, green: 0.9107772112, blue: 0.931748569, alpha: 1)
        taskLabel.layer.cornerRadius = 16
        taskLabel.clipsToBounds = true
        taskView.snp.makeConstraints { make in
            make.top.equalTo(questionNumber.snp.bottom).offset(10)
            make.right.left.equalToSuperview().inset(10)
            make.height.equalToSuperview().multipliedBy(0.3)
        }
        taskView.layer.shadowColor = #colorLiteral(red: 0.7764704823, green: 0.7764707804, blue: 0.7850786448, alpha: 1)
        taskView.layer.shadowOffset = CGSize(width: 0, height: 4)
        taskView.layer.shadowOpacity = 5
        taskView.backgroundColor = #colorLiteral(red: 0.8808651567, green: 0.9107772112, blue: 0.931748569, alpha: 1)
        taskView.layer.cornerRadius = 16
        view.bringSubviewToFront(taskLabel)
        taskLabel.snp.makeConstraints { make in
            make.top.equalTo(questionNumber.snp.bottom).offset(10)
            make.right.left.equalToSuperview().inset(10)
            make.height.equalToSuperview().multipliedBy(0.3)
        }
        answerButtona.layer.shadowColor = #colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 1)
        answerButtona.layer.shadowOffset = CGSize(width: 0, height: 4)
        answerButtona.layer.shadowOpacity = 5
        answerButtona.backgroundColor = #colorLiteral(red: 0.8808651567, green: 0.9107772112, blue: 0.931748569, alpha: 1)
        answerButtonb.layer.shadowColor = #colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 1)
        answerButtonb.layer.shadowOffset = CGSize(width: 0, height: 4)
        answerButtonb.layer.shadowOpacity = 5
        answerButtonb.backgroundColor = #colorLiteral(red: 0.8808651567, green: 0.9107772112, blue: 0.931748569, alpha: 1)
        answerButtonc.layer.shadowColor = #colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 1)
        answerButtonc.layer.shadowOffset = CGSize(width: 0, height: 4)
        answerButtonc.layer.shadowOpacity = 5
        answerButtonc.backgroundColor = #colorLiteral(red: 0.8808651567, green: 0.9107772112, blue: 0.931748569, alpha: 1)
        answerButtona.titleLabel?.numberOfLines = 0
        answerButtona.titleLabel?.textAlignment = .center
        answerButtonb.titleLabel?.textAlignment = .center
        answerButtonc.titleLabel?.textAlignment = .center
        answerButtonb.titleLabel?.numberOfLines = 0
        answerButtonc.titleLabel?.numberOfLines = 0
        
    }
}
