//
//  Model.swift
//  ServerCalls
//
//  Created by Andrew Aquino on 11/29/15.
//  Copyright © 2015 Totem. All rights reserved.
//

import Foundation
import Signals

public class Model {
  
  public let _labelText = Signal<String?>()
  public var labelText: String? = "Awaiting server response" { didSet { _labelText => labelText } }
}