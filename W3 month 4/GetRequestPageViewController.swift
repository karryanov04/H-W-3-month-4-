//
//  GetRequestPageViewController.swift
//  W3 month 4
//
//  Created by Рауль on 8/4/23.
//

import UIKit
import SnapKit
class GetRequestPageViewController: UIViewController {

    var item: Product? = nil
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        
        return image
    }()
    
    lazy var title1: UILabel = {
        let title = UILabel()
        title.font = .systemFont(ofSize: 14, weight: .bold)
        title.numberOfLines = 0
        title.textAlignment = .center
        return title
    }()
    
    lazy var descr1: UILabel = {
        let desr = UILabel()
        desr.font = .systemFont(ofSize: 14)
        desr.numberOfLines = 0
        desr.textAlignment = .justified
        
        return desr
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setupData()
        setupConstraints()
    }
    
    private func setupData() {
        title1.text = item?.title
        descr1.text = item?.description
        let url = URL(string: (item?.thumbnail)!)
//        image.kf.setImage(with: url)
    }
    
    private func setupConstraints() {
        view.addSubview(title1)
        title1.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(140)
            make.horizontalEdges.equalToSuperview().inset(30)
        }
        
        view.addSubview(descr1)
        descr1.snp.makeConstraints { make in
            make.top.equalTo(title1.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview().inset(10)
        }
        
        view.addSubview(image)
        image.snp.makeConstraints { make in
            make.top.equalTo(descr1.snp.bottom).offset(30)
            make.center.equalToSuperview()
            make.width.height.equalTo(250)
        }
    }
}
