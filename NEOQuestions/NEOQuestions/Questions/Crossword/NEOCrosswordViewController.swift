//
//  NEOCrosswordViewController.swift
//  NEOQuestions
//
//  Created by dengrui on 16/11/24.
//  Copyright © 2016年 dengrui. All rights reserved.
//

import UIKit


class NEOCrosswordViewController: UIViewController {
    
    fileprivate var crosswordView = NEOCrosswordOptionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate var dataSource: Array<String> = ["伪造的信用卡", "诈骗罪", "真实有效的", "信用卡诈骗罪", "虚假的信用卡"]
    
    fileprivate lazy var titleStr = "以'使用'信用卡作为行为方式而构成信用卡诈骗罪的行为对象为____、作废的信用卡、以虚假身份证明骗领的信用卡。行为人使用伪造的信用卡作质押骗取钱财的，构成____。\r以'冒用'信用卡作为行为方式而构成信用卡诈骗罪的行为对象为____信用卡（含借记卡）、信用卡信息资料。"
    
}


// MARK: - UI
extension NEOCrosswordViewController {
    
    fileprivate func setupUI() {
        automaticallyAdjustsScrollViewInsets = false
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        crosswordView.frame = CGRect(x: 0, y: kNavBarH, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - kNavBarH)
        crosswordView.titleStr = titleStr
        crosswordView.arrayTitles = dataSource
        crosswordView.maxCount = 3
        view.addSubview(crosswordView)
        
    }
    
}


