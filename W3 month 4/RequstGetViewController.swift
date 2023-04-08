//
//  RequstGetViewController.swift
//  W3 month 4
//
//  Created by Рауль on 8/4/23.
//

import UIKit
import SnapKit

class RequstGetViewController: UIViewController {
    var data: [Product] = []
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Some News"
        setupTableViewConfigue()
        setupViewsConstraints()
    }
    
    private func setupTableViewConfigue() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.reloadData()
    }
    
    private func setupViewsConstraints() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}

extension RequstGetViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TableViewCell
        
        let value = data[indexPath.row]
        cell?.configure(with: value)
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = GetRequestPageViewController()
        vc.item = data[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
