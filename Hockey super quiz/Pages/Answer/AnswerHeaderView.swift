//
//  AnswerHeaderView.swift
//  Hockey super quiz
//
//  Created by Nurillo Domlajonov on 03/08/22.
//

import UIKit
protocol AlbumSelection {
    func selectedAlbum(id: Int)
}
class AnswerHeaderView: UICollectionReusableView {
    static let identifier = "header"
    let questionNumber = UILabel()
    let questionTitle = UILabel()
    let bottomView    = UIView()
    let bottomImageView = UIImageView()
    
    var delegate: AlbumSelection?

    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapDetected))
        self.addGestureRecognizer(tapGestureRecognizer)
   
    }
    @objc func tapDetected(tag: Int) {
        print(self.tag)
        delegate?.selectedAlbum(id: self.tag)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: UI
extension AnswerHeaderView{
    private func initViews(){
        self.backgroundColor = #colorLiteral(red: 0.8857044578, green: 0.91061759, blue: 0.9359682202, alpha: 1)
        self.addSubview(questionNumber)
        self.addSubview(questionTitle)
        self.addSubview(bottomView)
        self.addSubview(bottomImageView)
      
        questionNumber.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        questionNumber.text = "1"
        questionNumber.textColor = .black
        questionNumber.layer.cornerRadius = 3
        questionNumber.clipsToBounds = true
        questionNumber.textAlignment = .center
        questionNumber.snp.makeConstraints { make in
            make.top.left.equalToSuperview().inset(5)
            make.height.width.equalTo(20)
        }
        questionTitle.text = "How many players from one team can be on the field at one time during a game?"
        questionTitle.textColor = .black
        questionTitle.numberOfLines = 0
        questionTitle.font = UIFont(name: "Verdana", size: 18)
        questionTitle.textAlignment = .center
        questionTitle.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.right.equalToSuperview().inset(10)
            make.left.equalTo(questionNumber.snp.right)
            make.height.equalTo(90)
        }
        bottomView.backgroundColor = .white
        bottomImageView.image = UIImage(named: "bottom")
        bottomView.snp.makeConstraints { make in
            make.right.left.equalToSuperview()
            make.bottom.equalTo(self.snp.bottom)
            make.top.equalTo(questionTitle.snp.bottom)
        }
        self.sendSubviewToBack(bottomView)
        self.bringSubviewToFront(bottomImageView)
        bottomImageView.snp.makeConstraints { make in
            make.centerY.equalTo(bottomView.snp.centerY)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(15)
            
        }
    }
}
