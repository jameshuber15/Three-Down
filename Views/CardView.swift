//
//  CardView.swift
//  Three-Down
//
//  Created by James HUBER on 2/15/18.
//  Copyright © 2018 James HUBER. All rights reserved.
//

import UIKit

class CardView: UIView {
    var allConstraints = [NSLayoutConstraint]()

    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func changeColor() {
        self.backgroundColor = UIColor.orange
    }
    
    func drawCardsOnScreen(cards: [String: UIButton]) {
        let cardWidth = self.bounds.size.width/9.5
        let cardSpace = cardWidth/15.0
        let cardEnd = (self.bounds.size.width - (cardWidth*9.0))*1.5
        let cardHeight = self.bounds.size.height/8.0
        
        var horizontalConstraintsString = "H:|-\(cardEnd)-"
        for x in 0..<cards.count {
            let cardName = "button\(x)"
            let card = cards[cardName]
            card!.translatesAutoresizingMaskIntoConstraints = false
            card!.clipsToBounds = true
            self.addSubview(card!)
            // add vertical constraints to label
            let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-\(cardHeight)-[\(cardName)]-\(cardHeight)-|", options: [], metrics: nil, views: cards)
            allConstraints.append(contentsOf: verticalConstraints)
            
            // add label to horizontal VFL string
            horizontalConstraintsString += "[\(cardName)(\(cardWidth))]"
            if x<cards.count-1 {
                horizontalConstraintsString += "-\(cardSpace)-"
            }
        }
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: horizontalConstraintsString, options: [], metrics: nil, views: cards)
        allConstraints.append(contentsOf: horizontalConstraints)
        
        
        NSLayoutConstraint.activate(allConstraints)
    }
}
