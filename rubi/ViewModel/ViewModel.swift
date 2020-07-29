//
//  ViewModel.swift
//  rubi
//
//  Created by 舘佳紀 on 2020/07/17.
//  Copyright © 2020 yoshiki Tachi. All rights reserved.
//

import Foundation

protocol  AuthenticationProtocol {
    var formIsVaild: Bool { get }
}

struct mainviewModel : AuthenticationProtocol {
    var text : String?
    var formIsVaild : Bool {
        return text?.isEmpty == false
    }
}
