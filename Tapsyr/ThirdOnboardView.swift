//
//  ThirdOnboardView.swift
//  Tapsyr
//
//  Created by Symbat Bashkeyeva on 3/20/21.
//

import UIKit

class ThirdOnboardView: UIView {
    let logoTapsyr = UIImageView()
    let onboardImage = UIImageView()
    let mainLabel = UILabel()
    let contentLabel = UILabel()
    let registerButton = UIButton()
    let existAccountLabel = UILabel()
    let signInButton = UIButton()
    let copyrightLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubviews()
        setViewConstraints()
        stylizeViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        addSubview(logoTapsyr)
        addSubview(onboardImage)
        addSubview(mainLabel)
        addSubview(contentLabel)
        addSubview(registerButton)
        addSubview(existAccountLabel)
        addSubview(signInButton)
        addSubview(copyrightLabel)
    }
    
    func setViewConstraints() {
        var constraints = [NSLayoutConstraint]()
        
        logoTapsyr.translatesAutoresizingMaskIntoConstraints = false
        constraints += [
            logoTapsyr.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoTapsyr.topAnchor.constraint(equalTo: topAnchor, constant: 80),
            logoTapsyr.heightAnchor.constraint(equalToConstant: 35),
            logoTapsyr.widthAnchor.constraint(equalToConstant: 119)
        ]
        
        onboardImage.translatesAutoresizingMaskIntoConstraints = false
        constraints += [
            onboardImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            onboardImage.topAnchor.constraint(equalTo: logoTapsyr.topAnchor, constant: 80),
            onboardImage.heightAnchor.constraint(equalToConstant: 200),
            onboardImage.widthAnchor.constraint(equalToConstant: 172)
        ]
        
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        constraints += [
            mainLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainLabel.topAnchor.constraint(equalTo: onboardImage.bottomAnchor, constant: 60)
        ]
        
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        constraints += [
            contentLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            contentLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 10),
            contentLabel.widthAnchor.constraint(equalToConstant: 260)
        ]
        
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        constraints += [
            registerButton.widthAnchor.constraint(equalToConstant: 345),
            registerButton.heightAnchor.constraint(equalToConstant: 50),
            registerButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            registerButton.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: 60)
        ]
        
        existAccountLabel.translatesAutoresizingMaskIntoConstraints = false
        constraints += [
            existAccountLabel.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 10),
            existAccountLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 84),
            existAccountLabel.bottomAnchor.constraint(equalTo: copyrightLabel.topAnchor, constant: -170)
            
        ]
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        constraints += [
            signInButton.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 10),
            signInButton.rightAnchor.constraint(equalTo: existAccountLabel.rightAnchor, constant: 55),
            signInButton.bottomAnchor.constraint(equalTo: copyrightLabel.topAnchor, constant: -165)
        ]
        
        copyrightLabel.translatesAutoresizingMaskIntoConstraints = false
        constraints += [
            copyrightLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            copyrightLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func stylizeViews() {
        logoTapsyr.image = UIImage(named: "logotapsyr")
        onboardImage.image = UIImage(named: "page3")
        mainLabel.text = "Сортируйте отходы"
        mainLabel.font = UIFont(name: "Arial", size: 20)
        contentLabel.text = "Ознакомьтесь, что можно сдать и сортируйте отходы дома."
        contentLabel.numberOfLines = 0
        contentLabel.textColor = .gray
        contentLabel.font = UIFont(name: "Arial", size: 16)
        contentLabel.textAlignment = .center
        registerButton.setTitle("Зарегистрироваться", for: .normal)
        registerButton.backgroundColor = hexStringToUIColor(hex: "0AA8BA")
        existAccountLabel.text = "Уже есть аккаунт?"
        var attrs = [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 19.0),
            NSAttributedString.Key.foregroundColor : hexStringToUIColor(hex: "0AA8BA"),
            NSAttributedString.Key.underlineStyle : 1] as [NSAttributedString.Key : Any]
        var attributedString = NSMutableAttributedString(string:"")
        let buttonTitleStr = NSMutableAttributedString(string:"Войти", attributes:attrs)
        attributedString.append(buttonTitleStr)
        signInButton.setAttributedTitle(attributedString, for: .normal)
        copyrightLabel.text = "ⓒ2019 Tapsyr. Все права защищены"
        copyrightLabel.font = UIFont(name: "Arial", size: 14)
        copyrightLabel.textColor = .gray
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

}
