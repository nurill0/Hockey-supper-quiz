//
//  ViewController.swift
//  Hockey super quiz
//
//  Created by Nurillo Domlajonov on 02/08/22.
//

import UIKit
import SnapKit

class BaseViewController: UIViewController {
    let backView       =                UIView()
    let lineView       =                UIView()
    let backImage      =           UIImageView()
   
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
}
//MARK: UI
extension ViewController{
    private func initViews(){
        view.addSubview(backView)
        view.addSubview(lineView)
        view.addSubview(backImage)
        
        backView.backgroundColor = #colorLiteral(red: 0.1729772389, green: 0.2290724218, blue: 0.3212710023, alpha: 1)
        backView.snp.makeConstraints { make in
            make.top.right.left.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.2)
        }
        view.sendSubviewToBack(backView)
        
        backImage.image = UIImage(named: "back")
        backImage.contentMode = .scaleToFill
        backImage.snp.makeConstraints { make in
            make.top.equalTo(backView.snp.bottom)
            make.right.left.bottom.equalToSuperview()
        }
       

        
    }
}

