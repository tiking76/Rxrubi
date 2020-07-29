//
// Created by 舘佳紀 on 2020/05/23.
// Copyright (c) 2020 yoshiki Tachi. All rights reserved.
//

import Foundation

struct returnDataType : Codable {
    var converted : String
    let outputType : String
    var requestID : String

    enum CodingKeys: String, CodingKey {
        case converted
        case outputType = "output_type"
        case requestID = "request_id"
    }
}
