//
//  APIModel.swift
//  rubi
//
//  Created by 舘佳紀 on 2020/07/03.
//  Copyright © 2020 yoshiki Tachi. All rights reserved.
//

import Foundation

protocol APIModel {

    var appID : String { get }
    var postText : String { get set }
    func postData(complicationHandler: @escaping (String) -> Void)
}
