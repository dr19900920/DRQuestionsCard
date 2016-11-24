//
//  NEOSelectViewController.swift
//  NEOQuestions
//
//  Created by dengrui on 16/11/23.
//  Copyright © 2016年 dengrui. All rights reserved.
//

import UIKit

private struct SelectConfig {

    static let selectCellH: CGFloat = 60.0
    
    static let headerViewH: CGFloat = 80.0
}

class NEOSelectViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    fileprivate var titleStr = "下列选项中，哪一选项的行为构成信用卡诈骗罪？"
    
    fileprivate lazy var dataSource: Array<Array<String>> = [["A.", "B.", "C.", "D."], ["行为人使用伪造的信用卡","行为人使用作废的信用卡","行为人以虚假身份证明骗领信用卡","行为人使用伪造的信用卡作质押骗取钱财的"]]
    
    fileprivate lazy var table: UITableView = {
        let table = UITableView(frame: CGRect(x: 0, y: kNavBarH, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - kNavBarH))
        table.rowHeight = SelectConfig.selectCellH
        table.separatorStyle = .none
        table.showsVerticalScrollIndicator = false
        table.dataSource = self
        table.delegate = self
        return table
    }()
    
}

extension NEOSelectViewController {

    fileprivate func setupUI() {
    
        automaticallyAdjustsScrollViewInsets = false
        view.backgroundColor = UIColor.white
        
        let header = NEOSelectHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: SelectConfig.headerViewH))
        header.titleLabel.text = titleStr
        table.tableHeaderView = header
        view.addSubview(table)
    
    }
    
}

extension NEOSelectViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[0].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = NEOSelectTableViewCell.cellFor(tableView: tableView)
        cell.titleLabel.text = dataSource[0][indexPath.row]
        cell.contentLabel.text = dataSource[1][indexPath.row]
        return cell
    }

}
