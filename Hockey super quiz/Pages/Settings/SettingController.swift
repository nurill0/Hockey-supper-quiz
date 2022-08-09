//
//  SettingController.swift
//  Hockey super quiz
//
//  Created by Nurillo Domlajonov on 03/08/22.
//

import UIKit

class SettingController: BaseViewController {
    let titleLabel     =                  UILabel()
    let backButton = UIButton()
    let soundLabel = UILabel()
    let soundView = UIView()
    let soundOnButton = UIButton()
    let soundOffButton = UIButton()
    let languageLabel = UILabel()
    let engButton = UIButton()
    let ruButton = UIButton()
    let lightLabel = UILabel()
    let slider = UISlider()
    let manager = UserDefaultsManager.shared
    let step:Float=10 // If you want UISlider to snap to steps by 10

    override func viewWillAppear(_ animated: Bool) {
        print(slider.value)
        slider.value = Float(manager.getBrightness())
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        checkSound()
        print(manager.CheckSound())
        backButton.addTarget(self, action: #selector(goMain), for: .touchUpInside)
        soundOnButton.addTarget(self, action: #selector(soundOn), for: .touchUpInside)
        soundOffButton.addTarget(self, action: #selector(soundOff), for: .touchUpInside)
        engButton.addTarget(self, action: #selector(changeUk), for: .touchUpInside)
        ruButton.addTarget(self, action: #selector(changeRu), for: .touchUpInside)
        slider.addTarget(self, action: #selector(self.sliderValueDidChange(_:)), for: .valueChanged)

    }
    
    
}
//MARK: objc functions
extension SettingController{
    @objc func sliderValueDidChange(_ sender:UISlider!)
    {
        print("Slider value changed")
        manager.setBrightness(brigth: CGFloat(sender.value))
        UIScreen.main.brightness = CGFloat(sender.value)
    }
    
    @objc func changeUk(){
        playAudio()
        changeLanguage("en", myView: self.view)
    }
    @objc func changeRu(){
        playAudio()
        changeLanguage("ru", myView: self.view)
    }
    
    func changeLanguage(_ langCode: String,myView: UIView) {
        if LocalizationSystem.sharedInstance.getLanguage() != langCode {
            LocalizationSystem.sharedInstance.setLanguage(languageCode: langCode)
        } else {
           return
        }
        myView.layoutSubviews()
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "vc") as! BaseViewController
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
        let delegate = windowScene.delegate as? SceneDelegate else { return }
        delegate.window?.rootViewController = vc
        
        let appDlg = UIApplication.shared.delegate as? AppDelegate
        appDlg?.window?.rootViewController = vc
    }
    
    ///``Sound go back
    @objc func goMain(){
        playAudio()
        dismiss(animated: true)
    }
    ///``Sound of and on
    @objc func soundOn(){
        manager.setButtonSound(sound: true)
        soundOnButton.backgroundColor = backView.backgroundColor
        soundOffButton.backgroundColor = .clear//soundView.backgroundColor
        soundOnButton.setImage(UIImage(named: "on")?.withTintColor(.white), for: .normal)
        soundOffButton.setImage(UIImage(named: "off"), for: .normal)
        if manager.CheckSound(){
            playAudio()
        }else{
        }
    }
    @objc func soundOff(){
        manager.setButtonSound(sound: false)
        soundOffButton.backgroundColor = backView.backgroundColor
        soundOnButton.backgroundColor = .clear
        soundOnButton.setImage(UIImage(named: "on"), for: .normal)
        soundOffButton.setImage(UIImage(named: "off")?.withTintColor(.white), for: .normal)
    }
}
//MARK: UI
extension SettingController{
    
        
    private func checkSound(){
        if manager.CheckSound(){
            soundOnButton.backgroundColor = backView.backgroundColor
            soundOffButton.backgroundColor = soundView.backgroundColor
            soundOnButton.setImage(UIImage(named: "on")?.withTintColor(.white), for: .normal)
            soundOffButton.setImage(UIImage(named: "off"), for: .normal)
        }else{
            soundOffButton.backgroundColor = backView.backgroundColor
            soundOffButton.setImage(UIImage(named: "off")?.withTintColor(.white), for: .normal)
            soundOnButton.setImage(UIImage(named: "on"), for: .normal)
        }
    }
    private func initViews(){
        
        backImage.image = UIImage(named: "settingBGC")
        view.addSubview(titleLabel)
        view.addSubview(backButton)
        view.addSubview(soundLabel)
        view.addSubview(soundView)
        view.addSubview(soundOnButton)
        view.addSubview(soundOffButton)
        view.addSubview(languageLabel)
        view.addSubview(engButton)
        view.addSubview(ruButton)
        view.addSubview(lightLabel)
        view.addSubview(slider)
        titleLabel.text = "Settings".localizedDD
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
        soundLabel.text = "Sound".localizedDD
        soundLabel.textColor = #colorLiteral(red: 0.1729770601, green: 0.229072541, blue: 0.3254559636, alpha: 1)
        soundLabel.textAlignment = .center
        soundLabel.font = UIFont(name: "Verdana-Bold", size: 32)
        soundLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(lineView.snp.bottom).offset(30)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(50)
        }
        soundView.backgroundColor = #colorLiteral(red: 0.8857043982, green: 0.9106176496, blue: 0.9402578473, alpha: 1)
        soundView.layer.cornerRadius = 20
        soundView.layer.shadowColor = #colorLiteral(red: 0.7215684056, green: 0.7215689421, blue: 0.7344758511, alpha: 1)
        soundView.layer.shadowOffset = CGSize(width: 0, height: 8)
        soundView.layer.shadowOpacity = 5
        soundView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(soundLabel.snp.bottom).offset(15)
            make.width.equalTo(220)
            make.height.equalTo(60)
        }
        soundOnButton.setImage(UIImage(named: "on"), for: .normal)
        soundOnButton.imageView?.contentMode = .scaleAspectFit
        soundOnButton.layer.cornerRadius = 20
        soundOnButton.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMinXMinYCorner]
        soundOnButton.snp.makeConstraints { make in
            make.top.equalTo(soundLabel.snp.bottom).offset(15)
            make.left.equalTo(soundView.snp.left)
            make.height.equalTo(60)
            make.width.equalTo(110)
        }
        soundOffButton.setImage(UIImage(named: "off"), for: .normal)
        soundOffButton.imageView?.contentMode = .scaleAspectFit
        soundOffButton.layer.cornerRadius = 20
        soundOffButton.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        soundOffButton.snp.makeConstraints { make in
            make.top.equalTo(soundLabel.snp.bottom).offset(15)
            make.right.equalTo(soundView.snp.right)
            make.height.equalTo(60)
            make.width.equalTo(110)
        }
        
        languageLabel.text = "Language".localizedDD
        languageLabel.textColor = #colorLiteral(red: 0.1729770601, green: 0.229072541, blue: 0.3254559636, alpha: 1)
        languageLabel.textAlignment = .center
        languageLabel.font = UIFont(name: "Verdana-Bold", size: 32)
        languageLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(soundOffButton.snp.bottom).offset(30)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(50)
        }
        engButton.setImage(UIImage(named: "uk"), for: .normal)
        engButton.imageView?.contentMode = .scaleAspectFit
        engButton.snp.makeConstraints { make in
            make.centerX.equalTo(soundView.snp.left).offset(20)
            make.top.equalTo(languageLabel.snp.bottom).offset(10)
            make.height.equalTo(60)
            make.width.equalTo(110)
        }
        ruButton.setImage(UIImage(named: "rus"), for: .normal)
        ruButton.imageView?.contentMode = .scaleAspectFit
        ruButton.snp.makeConstraints { make in
            make.centerX.equalTo(soundView.snp.right).offset(-20)
            make.top.equalTo(languageLabel.snp.bottom).offset(10)
            make.height.equalTo(60)
            make.width.equalTo(110)
        }
        lightLabel.text = "Screen light".localizedDD
        lightLabel.textColor = #colorLiteral(red: 0.1729770601, green: 0.229072541, blue: 0.3254559636, alpha: 1)
        lightLabel.textAlignment = .center
        lightLabel.font = UIFont(name: "Verdana-Bold", size: 32)
        lightLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(engButton.snp.bottom).offset(40)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(50)
        }
        slider.thumbTintColor = backView.backgroundColor
        slider.minimumTrackTintColor = backView.backgroundColor
        slider.minimumValue = 0
        slider.maximumValue = 0.5
        slider.value = Float(manager.getBrightness())
        slider.maximumTrackTintColor = #colorLiteral(red: 0.7137256265, green: 0.7137256265, blue: 0.7137256265, alpha: 1)
        slider.snp.makeConstraints { make in
            make.top.equalTo(lightLabel.snp.bottom).offset(10)
            make.right.left.equalToSuperview().inset(30)
            make.height.equalTo(50)
        }
        
    }
}
