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
        
        setUI()
        
        collectionView.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: BannerCollectionViewCell.id)
        collectionView.register(NormalCarouselCollectionViewCell.self, forCellWithReuseIdentifier: NormalCarouselCollectionViewCell.id)
        collectionView.setCollectionViewLayout(createLayout(), animated: true)
        
        setDataSource()
        setSnapShot()
    }
    
    private func setUI() {
        self.view.addSubview(collectionView)
        collectionView.backgroundColor = .red
        collectionView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }

    private func setDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            
            switch itemIdentifier {
            case .banner(let item):
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.id, for: indexPath) as? BannerCollectionViewCell else {  return UICollectionViewCell()}
                
                cell.config(title: item.title, imageUrl: item.imageUrl)

                return cell
                
            case .normalCarousel(let item):
                //cell 리턴
                
            default:
                return UICollectionViewCell()
            }
            
        })
    }
    
    private func setSnapShot() { 
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        
        snapshot.appendSections([Section(id: "Banner")])    //이렇게 사용하면 안됨. 똑같은 섹션 사용안됨. 아이디를 구별해야함
        let bannerItems = [
            Item.banner(HomeItem(title: "교촌 치킨", imageUrl: "https://www.allrecipes.com/thmb/SoBuPU73KcbYHl3Kp3j8Xx4A3fc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/8805-CrispyFriedChicken-mfs-3x2-072-d55b8406d4ae45709fcdeb58a04143c2.jpg")),
            Item.banner(HomeItem(title: "굽네 치킨", imageUrl: "https://www.allrecipes.com/thmb/SoBuPU73KcbYHl3Kp3j8Xx4A3fc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/8805-CrispyFriedChicken-mfs-3x2-072-d55b8406d4ae45709fcdeb58a04143c2.jpg")),
            Item.banner(HomeItem(title: "네네 치킨", imageUrl: "https://www.allrecipes.com/thmb/SoBuPU73KcbYHl3Kp3j8Xx4A3fc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/8805-CrispyFriedChicken-mfs-3x2-072-d55b8406d4ae45709fcdeb58a04143c2.jpg"))
            
        ]
        snapshot.appendItems(bannerItems, toSection: Section(id: "Banner"))
        
        dataSource?.apply(snapshot)
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout(sectionProvider: { [weak self] sectionIndex, _ in
            
            switch sectionIndex {
            case 0:
                self?.createBannerSection()
            case 1:
                //second
            case 2:
                //third
                
            default:
                return self?.createBannerSection()
            }
            
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

