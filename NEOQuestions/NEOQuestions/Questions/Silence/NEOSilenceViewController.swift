//
//  NEOSilenceViewController.swift
//  NEOQuestions
//
//  Created by dengrui on 16/11/23.
//  Copyright © 2016年 dengrui. All rights reserved.
//

import UIKit

private struct SilenceConfig {
    
    static let silenceCellH: CGFloat = 50.0
    
    static let headerViewH: CGFloat = 180.0
    
}

class NEOSilenceViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate lazy var titleStr = "以'使用'信用卡作为行为方式而构成信用卡诈骗罪的行为对象为____、作废的信用卡、以虚假身份证明骗领的信用卡。行为人使用伪造的信用卡作质押骗取钱财的，构成____。\r以'冒用'信用卡作为行为方式而构成信用卡诈骗罪的行为对象为____信用卡（含借记卡）、信用卡信息资料。"
    
    fileprivate lazy var table: UITableView = {
        let table = UITableView(frame: CGRect(x: 0, y: kNavBarH, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - kNavBarH))
        table.rowHeight = SilenceConfig.silenceCellH
        table.separatorStyle = .none
        table.showsVerticalScrollIndicator = false
        table.delegate = self
        table.dataSource = self
        return table
    }()
    
}

extension NEOSilenceViewController {
    
    fileprivate func setupUI() {
        
        automaticallyAdjustsScrollViewInsets = false
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        let header = NEOSilenceHeaderView(frame: CGRect(x: 0, y: kNavBarH, width: UIScreen.main.bounds.width, height: SilenceConfig.headerViewH))
        header.titleLabel.text = titleStr
        table.tableHeaderView = header
        view.addSubview(table)
    }
    
}

extension NEOSilenceViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = NEOSilenceTableViewCell.cellFor(tableView: tableView)
        cell.tag = indexPath.row
        cell.titleLabel.text = String(indexPath.row + 1)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
    
}

extension NEOSilenceViewController: SilenceCellDelegate {
    
    func contentFieldDidBeginEditing(cell: NEOSilenceTableViewCell, index: Int) {
        weak var tempSelf = self
        UIView.animate(withDuration: 0.3, animations: {
            () -> () in
            tempSelf?.table.contentOffset = CGPoint(x: 0, y: CGFloat(index + 1) * SilenceConfig.silenceCellH)
        })
        cell.contentField.becomeFirstResponder()
    }
    
    func contentFieldDidEndEditing(cell: NEOSilenceTableViewCell, index: Int) {

        cell.contentField.resignFirstResponder()
    }
    
    func contentFieldShouldReturn(cell: NEOSilenceTableViewCell, index: Int) {

        weak var tempSelf = self

        UIView.animate(withDuration: 0.5, animations: {
            () -> () in
            tempSelf?.table.contentOffset = CGPoint(x: 0, y: 0)
        })
    }
}
