//
//  Product.swift
//  13_03_2023_NestedAPIfakestroreAPIProduct
//
//  Created by Vishal Jagtap on 12/05/23.
//

import Foundation
struct Product{
    var id : Int
    var title : String
    var price : Double
    var rating : Rating
}

struct Rating{
    var rate : Double
    var count : Int
}
