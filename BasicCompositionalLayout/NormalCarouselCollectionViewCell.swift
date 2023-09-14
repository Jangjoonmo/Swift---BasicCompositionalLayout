//
//  NormalCarouselCollectionViewCell.swift
//  BasicCompositionalLayout
//
//  Created by 장준모 on 2023/09/14.
//

import Foundation
import UIKit

class NormalCarouselCollectionViewCell: UICollectionViewCell {
    static let id = "NormalCarouselCell"
 
    private let mainImage = UIImageView()
    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .blue
        setUI()
    }
    
    private func setUI() {
        addSubview(mainImage)
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        
        mainImage.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(80)
        }
        
        titleLabel.snp.makeConstraints{
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(mainImage.snp.bottom).offset(8)
        }
        
        subTitleLabel.snp.makeConstraints{
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
        }
    }
    
    func config(imageUrl: String, title: String, subTitle: String) {
        
        mainImage.kf.setImage(with: URL(string: imageUrl))
        titleLabel.text = title
        subTitleLabel.text = subTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
