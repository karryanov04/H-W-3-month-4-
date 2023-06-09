//
//  ViewController.swift
//  W3 month 4
//
//  Created by Рауль on 8/4/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    private lazy var getRequest: UIButton = {
        let get = UIButton(type: .system)
        get.setTitle("GET", for: .normal)
        get.backgroundColor = .orange
        get.setTitleColor(.white, for: .normal)
        get.layer.cornerRadius = 10
        get.addTarget(self, action: #selector(getRequest(sender:)), for: .touchUpInside)
        return get
    }()
    
    private lazy var postRequest: UIButton = {
        let post = UIButton(type: .system)
        post.setTitle("POST", for: .normal)
        post.backgroundColor = .black
        post.setTitleColor(.white, for: .normal)
        post.layer.cornerRadius = 10
        post.addTarget(self, action: #selector(postRequest(sender:)), for: .touchUpInside)
        return post
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
    
    func setupConstraints() {
        view.addSubview(getRequest)
        getRequest.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(300)
        }
        
        view.addSubview(postRequest)
        postRequest.snp.makeConstraints { make in
            make.top.equalTo(getRequest.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(300)
        }
        
    }
    
    @objc private func getRequest(sender: UIButton) {
        ApiManager.shared.getRequest { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let vc = RequstGetViewController()
                    vc.data = data.products ?? []
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    @objc private func postRequest(sender: UIButton) {
        navigationController?.pushViewController(POSTViewController(), animated: true)
    }

}

