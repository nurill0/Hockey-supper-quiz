//
//  AnswerCell.swift
//  Hockey super quiz
//
//  Created by Nurillo Domlajonov on 03/08/22.
//

import UIKit

class AnswerCell: UICollectionViewCell {
    static let identifier = "cell"
    let vieew = UIView()
    let answerLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: UI
extension AnswerCell{
    private func initViews(){
        self.backgroundColor = #colorLiteral(red: 0.9912715554, green: 0.9962431788, blue: 1, alpha: 1)
        self.addSubview(vieew)
        self.addSubview(answerLabel)
        vieew.backgroundColor = #colorLiteral(red: 0.8808651567, green: 0.9107772112, blue: 0.931748569, alpha: 1)
        vieew.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.right.left.equalToSuperview().inset(45)
            make.height.equalTo(5)
        }
        answerLabel.text = ""
        answerLabel.numberOfLines = 0
        answerLabel.textColor  = #colorLiteral(red: 0.1729772389, green: 0.2290724218, blue: 0.3212710023, alpha: 1)
        answerLabel.textAlignment = .center
        answerLabel.font = UIFont(name: "Verdana-Bold", size: 20)
        answerLabel.snp.makeConstraints { make in
            make.top.equalTo(vieew.snp.bottom).offset(20)
            make.bottom.equalToSuperview().offset(-20)
            make.right.left.equalToSuperview().inset(20)
        }
    
        }
        
        
    }

