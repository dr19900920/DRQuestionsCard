//
//  NEOJudgmentViewController.swift
//  NEOQuestions
//
//  Created by dengrui on 16/11/23.
//  Copyright © 2016年 dengrui. All rights reserved.
//

import UIKit

private struct JudgmentConfig {

    static let margin: CGFloat = 20.0
    
    static let titleLabelH: CGFloat = 100.0
    
    static let titleLabelW: CGFloat = UIScreen.main.bounds.width - margin * 2
    
    static let btnY: CGFloat = titleLabelH + margin + kNavBarH
    
    static let btnW: CGFloat = 75.0
    
    static let btnH: CGFloat = 35.0
    
    static let wrongBtnX: CGFloat = margin * 2 + btnW
}

class NEOJudgmentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate var titleStr = "行为人使用伪造的信用卡作质押骗取钱财的，构成信用卡诈骗罪。"

    fileprivate var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .left
        return titleLabel
    }()

    fileprivate var rightBtn: UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(#imageLiteral(resourceName: "bottom_btn_disabled"), for: .normal)
        btn.setBackgroundImage(#imageLiteral(resourceName: "bottom_btn_normal"), for: .selected)
        btn.setTitle("对", for: .normal)
        btn.setTitle("对", for: .selected)
        btn.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        btn.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .selected)
        return btn
    }()
    
    fileprivate var wrongBtn: UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(#imageLiteral(resourceName: "bottom_btn_disabled"), for: .normal)
        btn.setBackgroundImage(#imageLiteral(resourceName: "bottom_btn_normal"), for: .selected)
        btn.setTitle("错", for: .normal)
        btn.setTitle("错", for: .selected)
        btn.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        btn.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .selected)
        return btn
    }()
}


// MARK: - UI
extension NEOJudgmentViewController {

    fileprivate func setupUI() {
    
        automaticallyAdjustsScrollViewInsets = false
        view.backgroundColor = UIColor.white
        
        titleLabel.text = titleStr
        titleLabel.frame = CGRect(x: JudgmentConfig.margin, y: kNavBarH, width: JudgmentConfig.titleLabelW, height: JudgmentConfig.titleLabelH)
        view.addSubview(titleLabel)
        
        rightBtn.tag = 1001
        rightBtn.addTarget(self, action: #selector(click(on:)), for: .touchUpInside)
        rightBtn.frame = CGRect(x: JudgmentConfig.margin, y: JudgmentConfig.btnY, width: JudgmentConfig.btnW, height: JudgmentConfig.btnH)
        view.addSubview(rightBtn)
        
        wrongBtn.tag = 1002
        wrongBtn.addTarget(self, action: #selector(click(on:)), for: .touchUpInside)
        wrongBtn.frame = CGRect(x: JudgmentConfig.wrongBtnX, y: JudgmentConfig.btnY, width: JudgmentConfig.btnW, height: JudgmentConfig.btnH)
        view.addSubview(wrongBtn)
    }

    @objc
    private func click(on sender: UIButton) {
        switch sender.tag {
        case 1001:
            rightBtn.isSelected = true
            wrongBtn.isSelected = false
        case 1002:
            rightBtn.isSelected = false
            wrongBtn.isSelected = true
        default:
            break
        }
        
    }
    
}
