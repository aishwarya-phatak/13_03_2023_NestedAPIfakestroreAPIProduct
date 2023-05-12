//
//  ViewController.swift
//  13_03_2023_NestedAPIfakestroreAPIProduct
//
//  Created by Vishal Jagtap on 12/05/23.
//

import UIKit

class ViewController: UIViewController {

    var products : [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://fakestoreapi.com/products")
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "GET"
        
        let urlSession = URLSession(configuration: .default)
        
        parseJSON(urlRequest: urlRequest, urlSession: urlSession)
    }
    
    func parseJSON(urlRequest : URLRequest,urlSession : URLSession){
        let dataTask = urlSession.dataTask(with: urlRequest) { data, response, error in
            let jsonRepsonse = try! JSONSerialization.jsonObject(with: data!) as! [[String : Any]]
        
            for eachJSONObject in jsonRepsonse{
                let eachProduct = eachJSONObject as [String : Any]
                let eachProuctId = eachProduct["id"] as! Int
                let eachProductTitle = eachProduct["title"] as! String
                let eachProductPrice = eachProduct["price"] as! Double
                let eachProductRating = eachProduct["rating"] as! [String : Any]
                let eachProuctRate = eachProductRating["rate"] as! Double
                let eachProductCount = eachProductRating["count"] as! Int
                
                let newRatingObject = Rating(rate: eachProuctRate, count: eachProductCount)
                
                let newProduct = Product(id: eachProuctId, title: eachProductTitle, price: eachProductPrice, rating: newRatingObject)
                self.products.append(newProduct)
            }
        }
        dataTask.resume()
    }
}
