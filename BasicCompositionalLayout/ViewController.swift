//
//  ViewController.swift
//  BasicCompositionalLayout
//
//  Created by 장준모 on 2023/09/12.
//

import UIKit

class ViewController: UIViewController {

    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
    private var dataSource: UICollectionViewDiffableDataSource<Section, Item>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collectionView.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: BannerCollectionViewCell.id)
        collectionView.setCollectionViewLayout(createLayout(), animated: true)
        
        setDataSource()
        
    }

    private func setDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.id, for: indexPath) as? BannerCollectionViewCell else {  return UICollectionViewCell()}
            
//            cell.config(title: <#T##String#>, imageUrl: <#T##String#>)
            
            return cell
        })
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout(sectionProvider: { [weak self] sectionIndex, _ in
            
            return self?.createBannerSection()
        })
    }
    
    private func createBannerSection() -> NSCollectionLayoutSection {
        //item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        //group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        //section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        
        return section
    }

}

//컬렉션뷰 cell UI - 등록
//레이아웃 구현 - 3가지
//datasource -> cellProvider
//snapshot -> datasource.apply(snapshot)

