//
//  httpbin.org.json.swift
//  CloudsAPP
//
//  Created by pedro on 2017/7/31.
//  Copyright © 2017年 sale. All rights reserved.
//

import Foundation


struct HttpbinOrgJson
{
    let origin:String
    let url:String
    
//        init()
//        {
//            self.origin = "內部設定初始值"
//            self.url = "內部設定初始值"
//        }
}

// 定義要 throw 的訊息
enum DecodeJsonError: Error
{
    case missing(String)
    case invalid(String, Any)
}
extension HttpbinOrgJson
{
    init()
    {
        self.origin = "內部設定初始值"
        self.url = "內部設定初始值"
    }
    
    init(dictionary:[String:Any]) throws
    {
        guard let origin = dictionary["origin"] as? String
            else
        {
            throw DecodeJsonError.missing("origin")
        }
        guard let url = dictionary["url"] as? String
            else
        {
            throw DecodeJsonError.missing("url")
        }
        
        self.origin = origin
        self.url = url
    }
}


