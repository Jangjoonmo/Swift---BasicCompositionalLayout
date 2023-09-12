//
//  Item.swift
//  BasicCompositionalLayout
//
//  Created by 장준모 on 2023/09/12.
//

import Foundation

//섹션과 아이템 정의

struct Section: Hashable {
    let id: String
}

enum Item: Hashable {
    case banner(HomeItem)
    case normalCarousel(HomeItem)
    case listCarousel(HomeItem)
}

struct HomeItem: Hashable {
    let title: String
    let subTitle: String?
    let imageUrl: String
}

