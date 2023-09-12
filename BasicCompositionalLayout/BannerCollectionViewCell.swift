//
//  BannerCollectionViewCell.swift
//  BasicCompositionalLayout
//
//  Created by 장준모 on 2023/09/12.
//

import UIKit
import SnapKit

class BannerCollectionViewCell: UICollectionViewCell {
    
    static let id = "BannerCell"
    
    let titleLabel = UILabel()
    let backgroundImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
    }
    
  
    
    private func setUI() {
        //Snapkit
        self.addSubview(titleLabel)
        self.addSubview(backgroundImage)
        
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
        
        titleLabel.text = "Title"
//        imageUrl
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
