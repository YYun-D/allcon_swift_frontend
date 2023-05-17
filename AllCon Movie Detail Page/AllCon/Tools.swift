//
//  Tools.swift
//  AllCon
//
//  Created by YunD on 2022/06/02.
//

import Foundation
import Combine
import CoreGraphics
import UIKit

func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
   let size = image.size
   
   let widthRatio  = targetSize.width  / size.width
   let heightRatio = targetSize.height / size.height
   
   var newSize: CGSize
   if(widthRatio > heightRatio) {
       newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
   } else {
       newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
   }
   
   let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
   
   UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
   image.draw(in: rect)
   let newImage = UIGraphicsGetImageFromCurrentImageContext()
   UIGraphicsEndImageContext()
   
   return newImage!
}
