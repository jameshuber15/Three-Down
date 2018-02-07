//
//  PlayingCard.swift
//  Nines
//
//  Created by James HUBER on 2/6/18.
//  Copyright © 2018 James HUBER. All rights reserved.
//

import UIKit

class PlayingCard : Card {
    internal var rank : Int
    internal var suit : String
    internal var frontImage : UIImage
    internal var clearCards : Bool
    
    override init(){
        self.frontImage = UIImage(named: "cardfront")!
        self.rank = 0
        self.suit = String()
        self.clearCards = false
        super.init()
    }
    
    init(withRank: Int, ofSuit: String, frontImage : String){
        self.frontImage = UIImage(named: frontImage)!
        rank = withRank
        suit = ofSuit
        if (withRank == 10) {
            clearCards = true
        } else {
            clearCards = false
        }
        super.init()
    }
    
    override func toString() -> String {
        let facing : String
        if self.isFaceUp {
            facing = " is face up"
        } else {
            facing = " is face down"
        }
        
        return "This PlayingCard is the: \(rank) of \(suit), the back is \(self.backImage), and \(facing)"
    }
    
    func getRank() -> Int {
        return rank
    }
    
    func setRank(rank: Int) {
        self.rank = rank
    }
    
    func getSuit() -> String {
        return suit
    }
    
    func setSuit(suit: String) {
        self.suit = suit
    }
    
    class func validRanks() -> [String] {
        return ["??","??","??","??","4","5","6","7","8","9","10","J","Q","K","A", "2", "10"]
    }
    
    class func maxRank() -> Int {
        return validRanks().count - 1
    }
    
    class func validSuits() -> [String] {
        return ["❤️","♠️","♦️","♣️"]
    }
}
