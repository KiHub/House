//
//  ImageFetcher.swift
//  House
//
//  Created by  Mr.Ki on 12.12.2022.
//

import Foundation
import Combine

//class ImageFetcher: ObservableObject {
//    var img: String = ""
//    var didChange = PassthroughSubject<Data, Never>()
//
//    var data = Data() {
//        didSet {
//            didChange.send(data)
//        }
//    }
//
//    init(img:String) {
//        
//      //  let service = NetworkService()
//        guard let url = URL(string: Constants.baseURL + img) else {return}
//        
//        var request = URLRequest(url: url)
//               request.addValue("98bww4ezuzfePCYFxJEWyszbUXc7dxRx", forHTTPHeaderField: "Access-Key")
//        
//     //   guard let url = URL(string: urlString) else { return }
//        let task = URLSession.shared.dataTask(with: request) {[weak self] data, response, error in
//            guard let data = data else { return }
//            DispatchQueue.main.async {
//                self?.data = data
//            }
//        }
//        task.resume()
//        
//    }
//}
