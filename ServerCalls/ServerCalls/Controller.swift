//
//  Controller.swift
//  ServerCalls
//
//  Created by Andrew Aquino on 11/29/15.
//  Copyright © 2015 Totem. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

public class Controller {
  
  public let model = Model()
  
  public init() {
    // example server call
  }
  
  public func getAllUsers() {
    // using Alamofire, we create a request
    // and pass in the url and parameters
    // the parameter type is a [String: AnyObject], they represent JSON objects
    // that you can pass to the server
    Alamofire.request(.GET, "http://drewslist-staging.herokuapp.com/user")
    // then using the builder pattern, chain a response call after
    .response { [weak self] req, res, data, error in
      
      // unwrap error and check if it exists
      if let error = error {
        
        print(error)
        
        // use JSON library to jsonify the results ( NSData => JSON )
        // since the results is an array of objects, we get the first name
      } else if let data = data, let jsonArray = JSON(data: data).array {
        for json in jsonArray {
          
          self?.model.labelText = json["firstName"].description
          
          print(json)
        }
      }
    }
  }
}