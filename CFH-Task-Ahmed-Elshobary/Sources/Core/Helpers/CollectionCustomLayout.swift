//
//  CollectionCustomLayout.swift
//  CFH-Task-Ahmed-Elshobary
//
//  Created by ahmed elshobary on 16/03/2024.
//

import UIKit

class RTLCollectionFlow: UICollectionViewFlowLayout {
  override var flipsHorizontallyInOppositeLayoutDirection: Bool {
// here you can return the bool from your app state manager or alike
// or you can just return 'True' if you're not planing to switch it
      
    return true
  }
}
