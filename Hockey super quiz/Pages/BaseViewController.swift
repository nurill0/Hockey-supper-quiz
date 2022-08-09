//
//  ViewController.swift
//  Hockey super quiz
//
//  Created by Nurillo Domlajonov on 02/08/22.
//

import UIKit
import SnapKit
import AVFoundation


    
class BaseViewController: UIViewController {
    let backView       =                   UIView()
    let lineView       =                   UIView()
    let backImage      =              UIImageView()
    var player         =            AVAudioPlayer()
    let managerUD      = UserDefaultsManager.shared
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()

    }
    func playAudio() {
        if managerUD.CheckSound(){
            let url = Bundle.main.url(forResource: "bttn", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }else{
            print("slient on")
        }
     
    }
}

//MARK: UI
extension BaseViewController{
    private func initViews(){
        view.addSubview(backView)
        view.addSubview(lineView)
        view.addSubview(backImage)
        
        backView.backgroundColor = #colorLiteral(red: 0.1729772389, green: 0.2290724218, blue: 0.3212710023, alpha: 1)
        backView.snp.makeConstraints { make in
            make.top.right.left.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.2)
        }
        lineView.layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        lineView.layer.shadowOffset = CGSize(width: 0, height: 5)
        lineView.layer.shadowOpacity = 10
        lineView.backgroundColor = #colorLiteral(red: 1, green: 0.2129927874, blue: 0, alpha: 1)
        view.bringSubviewToFront(lineView)
        lineView.snp.makeConstraints { make in
            make.right.left.equalToSuperview()
            make.top.equalTo(backView.snp.bottom)
            make.height.equalTo(5)
        }
      
        view.sendSubviewToBack(backView)

        backImage.image = UIImage(named: "back")
        backImage.contentMode = .scaleToFill
        backImage.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom)
            make.right.left.bottom.equalToSuperview()
        }
       

        
    }
}

