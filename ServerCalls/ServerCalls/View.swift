//
//  ViewController.swift
//  ServerCalls
//
//  Created by Andrew Aquino on 11/29/15.
//  Copyright © 2015 Totem. All rights reserved.
//

import UIKit
import Neon

class View: UIViewController {
  
  private var button: UIButton?
  private var label: UILabel?
  
  private let controller = Controller()
  private var model: Model { get { return controller.model } }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    view.backgroundColor = UIColor.whiteColor()
    
    // UI setup goes here
    setupButton()
    setupLabel()
    setupDataBinding()
  }
  
  private func setupButton() {
    // button initializations
    button = UIButton()
    button?.backgroundColor = UIColor.redColor()
    button?.setTitle("Press Me! =)", forState: .Normal)
    button?.addTarget(self, action: "getAllUsers", forControlEvents: .TouchUpInside)
    view.addSubview(button!)
  }
  
  private func setupLabel() {
    label = UILabel()
    label?.backgroundColor = UIColor.lightGrayColor()
    label?.text = model.labelText
    view.addSubview(label!)
  }
  
  private func setupDataBinding() {
    // listen for any changes in the model's label text
    model._labelText.listen(self) { [weak self] text in
      // this closure is ran whenever the model's text variable changes
      // update the UILabel's text
      self?.label?.text = text
    }
  }
  
  public func getAllUsers() {
    controller.getAllUsers()
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    
    // using neon to set constraints
    button?.anchorInCenter(width: 256, height: 48)
    
    label?.alignAndFillWidth(align: .UnderCentered, relativeTo: button!, padding: 64, height: 48)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

