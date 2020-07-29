//
// Created by 舘佳紀 on 2020/07/04.
// Copyright (c) 2020 yoshiki Tachi. All rights reserved.
//

import Foundation

enum RequestType {
    case postData(app_id : Int, sentence : String, output_type : String)

    var path : String {
        switch self {
        case .postData:
            return ""
        }
    }


}

