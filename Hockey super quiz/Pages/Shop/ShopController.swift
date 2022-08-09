//
//  ShopController.swift
//  Hockey super quiz
//
//  Created by Nurillo Domlajonov on 03/08/22.
//

import UIKit

class ShopController: BaseViewController {
    let titleLabel     =                  UILabel()
    let backButton = UIButton()
    let noAdsButton = UIButton()
    let noAdsLabel = UILabel()
    let infoLabel = UILabel()
    let infoButton = UIButton()
    let restartButton = UIButton()
    
       
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
    }
    @objc func goBack(){
        playAudio()
        dismiss(animated: true)
    }
}
//MARK: UI
extension ShopController{
    private func initViews(){
        view.addSubview(titleLabel)
        view.addSubview(backButton)
        view.addSubview(noAdsLabel)
        view.addSubview(noAdsButton)
        view.addSubview(infoLabel)
        view.addSubview(infoButton)
        view.addSubview(restartButton)
        
        titleLabel.text = "Shop".localizedDD
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "Verdana-Bold", size: 30)
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(backView.snp.centerY).offset(10)
            make.right.left.equalToSuperview().inset(10)
            make.height.equalTo(backView.snp.height).multipliedBy(0.5)
        }
        backButton.setImage(UIImage(named: "backbtn")?.withRenderingMode(.alwaysOriginal), for: .normal)
        backButton.imageView?.contentMode = .scaleAspectFit
        backButton.backgroundColor = #colorLiteral(red: 0.5082384944, green: 0.538218081, blue: 0.5975981355, alpha: 1)
        backButton.layer.cornerRadius = 8
        backButton.snp.makeConstraints { make in
            make.left.equalTo(backView.snp.left).offset(20)
            make.centerY.equalTo(titleLabel.snp.centerY)
            make.width.height.equalTo(50)
        }
        restartButton.setTitle("Restart".localizedDD, for: .normal)
        restartButton.setTitleColor(.white, for: .normal)
        restartButton.backgroundColor  = #colorLiteral(red: 0.1769273281, green: 0.232996583, blue: 0.3252100348, alpha: 1)
        restartButton.layer.shadowColor = #colorLiteral(red: 0.7215684056, green: 0.7215689421, blue: 0.7344758511, alpha: 1)
        restartButton.layer.shadowOffset = CGSize(width: 0, height: 8)
        restartButton.layer.shadowOpacity = 5
        restartButton.layer.cornerRadius = 15
        restartButton.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 30)

        if self.view.frame.height>740{
            restartButton.snp.makeConstraints { make in
                make.bottom.equalToSuperview().offset(-150)
                make.right.left.equalToSuperview().inset(50)
                make.height.equalTo(70)
            }
        }else{
            restartButton.snp.makeConstraints { make in
                make.bottom.equalToSuperview().offset(-100)
                make.right.left.equalToSuperview().inset(50)
                make.height.equalTo(70)
            }
        }
        noAdsButton.setImage(UIImage(named: "noadd"), for: .normal)
        noAdsButton.imageView?.contentMode = .scaleAspectFit
        noAdsButton.backgroundColor = backView.backgroundColor
        noAdsButton.layer.shadowColor = #colorLiteral(red: 0.7215684056, green: 0.7215689421, blue: 0.7344758511, alpha: 1)
        noAdsButton.layer.shadowOffset = CGSize(width: 0, height: 8)
        noAdsButton.layer.shadowOpacity = 5
        noAdsButton.layer.cornerRadius = 10
        
        noAdsButton.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom).offset(90)
            make.left.equalToSuperview().inset(50)
            make.height.width.equalTo(100)
        }
        infoButton.setImage(UIImage(named: "info"), for: .normal)
        infoButton.imageView?.contentMode = .scaleAspectFit
        infoButton.backgroundColor = backView.backgroundColor
        infoButton.layer.shadowColor = #colorLiteral(red: 0.7215684056, green: 0.7215689421, blue: 0.7344758511, alpha: 1)
        infoButton.layer.shadowOffset = CGSize(width: 0, height: 8)
        infoButton.layer.shadowOpacity = 5
        infoButton.layer.cornerRadius = 10
        infoButton.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom).offset(90)
            make.right.equalToSuperview().inset(50)
            make.height.width.equalTo(100)
        }
        noAdsLabel.text = "0.00"
        noAdsLabel.backgroundColor =  backView.backgroundColor
        noAdsLabel.textAlignment = .center
        noAdsLabel.font = UIFont(name: "Verdana-Bold", size: 22)
        noAdsLabel.textColor = .white
        noAdsLabel.layer.shadowColor = #colorLiteral(red: 0.7215684056, green: 0.7215689421, blue: 0.7344758511, alpha: 1)
        noAdsLabel.layer.shadowOffset = CGSize(width: 0, height: 8)
        noAdsLabel.layer.shadowOpacity = 5
        noAdsLabel.layer.cornerRadius = 5
        noAdsLabel.clipsToBounds = true
        noAdsLabel.snp.makeConstraints { make in
            make.left.equalTo(noAdsButton.snp.left)
            make.top.equalTo(noAdsButton.snp.bottom).offset(25)
            make.width.equalTo(noAdsButton.snp.width)
            make.height.equalTo(30)
        }
        infoLabel.text = "0.00"
        infoLabel.backgroundColor =  backView.backgroundColor
        infoLabel.textAlignment = .center
        infoLabel.font = UIFont(name: "Verdana-Bold", size: 22)
        infoLabel.textColor = .white
        infoLabel.layer.shadowColor = #colorLiteral(red: 0.7215684056, green: 0.7215689421, blue: 0.7344758511, alpha: 1)
        infoLabel.layer.shadowOffset = CGSize(width: 0, height: 8)
        infoLabel.layer.shadowOpacity = 5
        infoLabel.layer.cornerRadius = 5
        infoLabel.clipsToBounds = true
        infoLabel.snp.makeConstraints { make in
            make.right.equalTo(infoButton.snp.right)
            make.top.equalTo(infoButton.snp.bottom).offset(25)
            make.width.equalTo(infoButton.snp.width)
            make.height.equalTo(30)
        }
    }
}
