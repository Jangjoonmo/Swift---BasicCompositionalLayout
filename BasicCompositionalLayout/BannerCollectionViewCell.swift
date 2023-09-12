//
//  BannerCollectionViewCell.swift
//  BasicCompositionalLayout
//
//  Created by 장준모 on 2023/09/12.
//

import UIKit
import SnapKit
import Kingfisher

class BannerCollectionViewCell: UICollectionViewCell {
    
    static let id = "BannerCell"
    
    let titleLabel = UILabel()
    let backgroundImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .blue
        setUI()
    }
    
  
    
    private func setUI() {
        //Snapkit
        self.addSubview(backgroundImage)
        self.addSubview(titleLabel)

        //constraint 적용
        titleLabel.snp.makeConstraints{
            $0.center.equalToSuperview()
        }
        
        backgroundImage.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    public func config(title: String, imageUrl: String) {
        // title, image set
        
        titleLabel.text = title
        
//        imageUrl
        let url = URL(string: imageUrl)
        backgroundImage.kf.setImage(with: url)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
