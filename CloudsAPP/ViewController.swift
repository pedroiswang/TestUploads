//
//  ViewController.swift
//  CloudsAPP
//
//  Created by pedro on 2017/7/24.
//  Copyright © 2017年 sale. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        Alamofire.request("https://httpbin.org/get").responseJSON{response in
//            print(response.request!)
//            print(response.response!)
//            print(response.data!)
//            print(response.result)
            
            if let array = response.result.value{
            print("準備印出資料")
                print(array)
            }

            if let JSON = response.result.value
            {
                if let dictionary = JSON as? [String:Any]
                {
                    
                    if let value1 = dictionary["origin"] as? String
                    {
                        print("解出key為origin的值")
                        print(value1)
                    }
                    
                    if let secondJSON = dictionary["headers"] as? [String:Any]
                    {
                        for (key, value) in secondJSON
                        {
                            if let value_string = value as? String
                            {
                                print("解出key為Headers中的\(key)值")
                                print(value_string)
                            }
                        }
                    }
                }
                
            }
        }
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    }


}

