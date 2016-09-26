//
//  ViewController.swift
//  ios_animation_practice_1
//
//  Created by Ronin Ke on 2016/9/26.
//  Copyright © 2016年 Ronin Ke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  // MARK: - Properties
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var secondTitleLabel: UILabel!
  @IBOutlet weak var hiddenLabel: UILabel!
  
  // MARK: - View Life Cycle

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    // 預設titleLabel藏在畫面上方
    titleLabel.center.y -= view.bounds.height
    // 預設secondTitleLabel藏在畫面下方
    secondTitleLabel.center.y += view.bounds.height
    // 預設hiddenLabel透明隱藏
    hiddenLabel.alpha = 0.0
    
    // 基本UIView屬性
    // center    = Changes position on screen
    // frame     = Moves or resizes the view within its superview
    // bounds    = Changes size and position on screen. Changes the view's bounding box
    // alpha     = Adjusts the view's transparency (alpha) level, from 0.0 (transparent) to 1.0 (opaque)
    // transform = Rotate, Scale, Translate, or Skew the view
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    // 執行動畫，將titleLabel向下位移到正常位置
    UIView.animate(withDuration: 1.0, animations: {
      self.titleLabel.center.y += self.view.bounds.height
    }) { (finished: Bool) in
      // 完成titleLabel位移動畫後，再執行secondTitleLabel位移動畫
      self.startSecondAnimation()
    }
    
    // 延遲0.5秒執行更換背景顏色動畫
    UIView.animate(withDuration: 2.0, delay: 0.5, options: [], animations: { 
      self.view.backgroundColor = UIColor.red
    }) { (finished: Bool) in
      // 再度執行執行更換背景顏色動畫
      self.changeBackgroundColor()
    }
  }

  // MARK: - Helper
  
  func startSecondAnimation() {
    // 執行動畫，將secondTitleLabel向上位移到正常位置
    UIView.animate(withDuration: 1.0, delay: 0.0, options: [], animations: { 
      self.secondTitleLabel.center.y -= self.view.bounds.height
      }, completion: nil)
  }
  
  func changeBackgroundColor() {
    UIView.animate(withDuration: 2.5, animations: { 
      self.view.backgroundColor = UIColor.black
      }, completion: nil)
  
    // 延遲1.5秒執行恢復hiddenLabel可視動畫
    UIView.animate(withDuration: 1.0, delay: 1.5, options: [], animations: { 
      self.hiddenLabel.alpha = 1.0
      }, completion: nil)
  }
}

