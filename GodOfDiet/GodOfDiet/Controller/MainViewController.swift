//
//  ViewController.swift
//  GodOfDiet
//
//  Created by GSM02 on 2021/10/20.
//

import UIKit

import SnapKit
import Then

class MainViewController: UIViewController, UITextFieldDelegate {

    var userBMILabel = UILabel().then {
        $0.text = "당신의 BMI는?"
        $0.textColor = UIColor(red: 63/255, green: 63/255, blue: 63/255, alpha: 1)
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
    }
    
    
    var inputHeightLabel = UILabel().then {
        $0.text = "키"
        $0.textColor = UIColor(red: 103/255, green: 103/255, blue: 103/255, alpha: 1)
        $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
    }
    
    var inputHeightTF = UITextField().then {
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 248/255, green: 65/255, blue: 85/255, alpha: 1).cgColor
        $0.layer.cornerRadius = 20
        $0.addLeftPadding()
        $0.placeholder = "키를 입력해주세요"
        $0.setPlaceholderColor(UIColor(red: 178/255, green: 178/255, blue: 178/255, alpha: 1))
    }
    
    var inputWeightLabel = UILabel().then {
        $0.text = "몸무게"
        $0.textColor = UIColor(red: 103/255, green: 103/255, blue: 103/255, alpha: 1)
        $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
    }
    
    var inputWeightTF = UITextField().then {
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 248/255, green: 65/255, blue: 85/255, alpha: 1).cgColor
        $0.layer.cornerRadius = 20
        $0.addLeftPadding()
        $0.placeholder = "몸무게를 입력해주세요"
        $0.setPlaceholderColor(UIColor(red: 178/255, green: 178/255, blue: 178/255, alpha: 1))
    }
    
    var checkButton = UIButton().then {
        $0.setTitle("확인하기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 15)
        $0.backgroundColor = UIColor(red: 248/255, green: 65/255, blue: 85/255, alpha: 1)
        $0.layer.cornerRadius = 20
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .white
        inputHeightTF.delegate = self
        inputHeightTF.delegate = self
        addView()
        location()
        
    }
    
    func addView() {
        view.addSubview(userBMILabel)
        view.addSubview(inputHeightLabel)
        view.addSubview(inputHeightTF)
        view.addSubview(inputWeightLabel)
        view.addSubview(inputWeightTF)
        view.addSubview(checkButton)
    }
    
    func location() {
        userBMILabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(self.view.frame.height/3.55)
        }
        
        inputHeightLabel.snp.makeConstraints { make in
            make.top.equalTo(userBMILabel.snp.bottom).offset(self.view.frame.height/10.29)
            make.left.equalToSuperview().offset(self.view.frame.width/10.26)
        }
        
        inputHeightTF.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(1.56)
            make.height.equalToSuperview().dividedBy(23.44)
            make.centerY.equalTo(inputHeightLabel)
            make.left.equalTo(inputHeightLabel.snp.right).offset(self.view.frame.width/8.86)
        }
        
        inputWeightLabel.snp.makeConstraints { make in
            make.top.equalTo(inputHeightLabel.snp.bottom).offset(self.view.frame.height/15.07)
            make.left.equalTo(inputHeightLabel)
        }
        
        inputWeightTF.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(1.56)
            make.height.equalToSuperview().dividedBy(23.44)
            make.centerY.equalTo(inputWeightLabel)
            make.left.equalTo(inputHeightTF)
        }
        
        checkButton.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(3.05)
            make.height.equalToSuperview().dividedBy(23.44)
            make.top.equalTo(inputWeightTF.snp.bottom).offset(self.view.frame.height/11.89)
            make.centerX.equalToSuperview()
            
        }
    }
}

public extension UITextField {
    
    func setPlaceholderColor(_ placeholderColor: UIColor) {
        attributedPlaceholder = NSAttributedString(
            string: placeholder ?? "",
            attributes: [
                .foregroundColor: placeholderColor,
                .font: font
            ].compactMapValues { $0 }
        )
    }
    
    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
      self.leftView = paddingView
      self.leftViewMode = ViewMode.always
    }
    
}

//MARK: - Preview
//
//#if DEBUG
//import SwiftUI
//struct MainViewControllerRepresentable: UIViewControllerRepresentable {
//
//func updateUIViewController(_ uiView: UIViewController,context: Context) {
//        // leave this empty
//}
//    @available(iOS 13.0.0, *)
//    func makeUIViewController(context: Context) -> UIViewController{
//        MainViewController()
//    }
//}
//@available(iOS 13.0, *)
//struct ViewControllerRepresentable_PreviewProvider: PreviewProvider {
//    static var previews: some View {
//        Group {
//            MainViewControllerRepresentable()
//                .ignoresSafeArea()
//                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
//                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
//        }
//
//    }
//} #endif

