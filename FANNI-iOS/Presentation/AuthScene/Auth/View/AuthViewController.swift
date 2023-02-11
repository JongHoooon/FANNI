//
//  ViewController.swift
//  FANNI-iOS
//
//  Created by JongHoon on 2023/02/05.
//

import UIKit
import SnapKit

final class AuthViewController: UIViewController {
    
    // MARK: - UI

    private lazy var firstLabel: UILabel = {
        var label = UILabel()
        label.text = "무료 회원 가입"
        label.font = .pretendar(style: .medium, size: 16.0)
        label.textColor = UIColor(rgb: 0x767676)
        
        return label
    }()
    
    private lazy var secondLabel: UILabel = {
        var label = UILabel()
        
        let text = "FANNI를\n이용해보시겠어요?"
        label.text = text
        label.font = .pretendar(style: .light, size: 32.0)
        
        let font = UIFont.cafe24Ssurround(size: 32.0)
        let attributedString = NSMutableAttributedString(string: label.text ?? "")
        attributedString.addAttribute(.font, value: font!, range: (text as NSString).range(of: "FANNI"))
        
        label.attributedText = attributedString
        
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var kakaoLoginButton: UIButton = {
        var button = UIButton()
        button.setTitle("  카카오톡으로 시작하기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .pretendar(style: .medium, size: 16.0)
        button.setImage(UIImage(named: "kakaoIcon"), for: .normal)
        button.semanticContentAttribute = .forceLeftToRight
        button.backgroundColor = .kakaoYellow
        button.layer.cornerRadius = 12.0
                
        return button
    }()
    
    private lazy var appleLoginButton: UIButton = {
        var button = UIButton()
        button.setTitle("  Apple로 시작하기", for: .normal)
        button.setTitleColor(.systemBackground, for: .normal)
        button.titleLabel?.font = .pretendar(style: .medium, size: 16.0)
        
        let appleIcon = UIImage(named: "appleIcon")?
            .withTintColor(.systemBackground, renderingMode: .alwaysOriginal)
        button.setImage(appleIcon, for: .normal)
        button.semanticContentAttribute = .forceLeftToRight
        button.backgroundColor = .label
        button.layer.cornerRadius = 12.0
        
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "FANNI"
        label.font = .cafe24Ssurround(size: 18.0)
        label.textColor = .tint2
        
        return label
    }()
        
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configLayout()
    }
}

private extension AuthViewController {
    
    func configLayout() {
        
        [
            titleLabel,
            firstLabel,
            secondLabel,
            kakaoLoginButton,
            appleLoginButton
        ].forEach { view.addSubview($0) }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(10.0)
//            $0.top.equalToSuperview().inset(10.0)
            $0.leading.equalToSuperview().inset(20.0)
        }
        
        firstLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(136.0)
            $0.centerX.equalToSuperview()
        }
        
        secondLabel.snp.makeConstraints {
            $0.top.equalTo(firstLabel.snp.bottom).offset(24.0)
            $0.centerX.equalToSuperview()
        }
        
        kakaoLoginButton.snp.makeConstraints {
            $0.top.equalTo(secondLabel.snp.bottom).offset(100.0)
            $0.leading.trailing.equalToSuperview().inset(20.0)
            $0.height.equalTo(44.0)
        }
        
        appleLoginButton.snp.makeConstraints {
            $0.top.equalTo(kakaoLoginButton.snp.bottom).offset(16.0)
            $0.leading.trailing.equalToSuperview().inset(20.0)
            $0.height.equalTo(44.0)
        }
    }
}