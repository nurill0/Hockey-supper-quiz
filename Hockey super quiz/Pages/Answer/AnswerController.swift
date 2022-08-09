//
//  AnswerController.swift
//  Hockey super quiz
//
//  Created by Nurillo Domlajonov on 03/08/22.
//

import UIKit

class AnswerController: BaseViewController {
    var imageName = "bottom"
    var shadowOff = false
    let data = QuestionData()
    let titleLabel     =                  UILabel()
    var selected       = -1
    let backButton = UIButton()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(AnswerCell.self, forCellWithReuseIdentifier: AnswerCell.identifier)
        collectionView.register(AnswerHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AnswerHeaderView.identifier)
        return collectionView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        backButton.addTarget(self, action: #selector(goMain), for: .touchUpInside)
    }
    @objc func goMain(){
        playAudio()
        dismiss(animated: true)
    }
}
//MARK: UI
extension AnswerController{
    private func initViews(){
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(backButton)
        
        titleLabel.text = "Answers".localizedDD
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "Verdana-Bold", size: 30)
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(backView.snp.centerY).offset(10)
            make.right.left.equalToSuperview().inset(10)
            make.height.equalTo(backView.snp.height).multipliedBy(0.5)
        }
        view.addSubview(collectionView)
        collectionView.backgroundColor  = .clear
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom).offset(10)
            make.right.left.equalToSuperview().inset(10)
            make.bottom.equalToSuperview()
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
    }
}
//MARK: CollectionView delegate + datasource
extension AnswerController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,AlbumSelection{
    //MARK: cell
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selected == section ? 1 : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AnswerCell.identifier, for: indexPath) as! AnswerCell
        cell.layer.shadowColor = #colorLiteral(red: 0.7764704823, green: 0.7764707804, blue: 0.7850786448, alpha: 1)
        cell.layer.shadowOffset = CGSize(width: 0, height: 5)
        cell.layer.shadowOpacity = 5
        cell.layer.borderWidth = 0.0
        cell.answerLabel.text = data.dataOfQuiz[indexPath.section].answer
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 120)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    //MARK: header
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return data.dataOfQuiz.count
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind:UICollectionView.elementKindSectionHeader, withReuseIdentifier: AnswerHeaderView.identifier, for: indexPath) as! AnswerHeaderView
            header.questionTitle.text = data.dataOfQuiz[indexPath.section].taskLabel
            header.questionNumber.text = "\(indexPath.section+1)"
            header.tag = indexPath.section
            header.delegate = self
            header.bottomImageView.image = UIImage(named: imageName)
             selected == indexPath.section ?( header.bottomImageView.image = UIImage(named: "top")) : (header.bottomImageView.image = UIImage(named: "bottom"))
            if selected == indexPath.section{
                playAudio()
                header.layer.shadowColor = #colorLiteral(red: 0.7764704823, green: 0.7764707804, blue: 0.7850786448, alpha: 1)
                header.layer.shadowOffset = CGSize(width: 0, height: 0)
                header.layer.shadowOpacity = 0
                header.layer.borderWidth = 0.1

            }else{
                
                header.layer.shadowColor = #colorLiteral(red: 0.7764704823, green: 0.7764707804, blue: 0.7850786448, alpha: 1)
                header.layer.shadowOffset = CGSize(width: 0, height: 5)
                header.layer.shadowOpacity = 5
                header.layer.borderWidth = 0.2
            }
           
                
            
            return header
            
        } else {
            return UICollectionReusableView()
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 120)
    }
    func selectedAlbum(id: Int) {
        selected = id
        UIView.transition(with: self.collectionView, duration: 0.3, options: .curveEaseInOut) {
        } completion: { s in
            print(s)
            self.collectionView.reloadData()

        }
    }
}
