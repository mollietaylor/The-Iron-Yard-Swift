//
//  GamePiece.swift
//  GameBoard
//
//  Created by Mollie on 2/18/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

import UIKit

/// Empty = 0, Player1 = 1, Player2 = 2, Player1King = 3, Player2King = 4
enum PieceType: Int {
    
    case Empty
    case Player1
    case Player2
    case Player1King
    case Player2King
    
}

protocol GamePieceDelegate {
    
    func pieceSelected(piece: GamePiece)
    
}

let player1Color = UIColor(red:0.97, green:0.71, blue:0.05, alpha:1)
let player2Color = UIColor(red:0, green:0.11, blue:0.35, alpha:1)

let pieceSize: CGFloat = 20

class GamePiece: UIView {
    
    var type: PieceType!
    var player: Player? { // so you can test the direction
        
        let playerIndex = (type.rawValue - 1) % 2
     
        return DataModel.mainData().currentGame?.players[playerIndex]
        
    }
    
    /// (col,row)
    var square: (Int, Int)!
    
    var delegate: GamePieceDelegate?
    
    init(type: PieceType) {
        super.init(frame: CGRectMake(0, 0, pieceSize, pieceSize))
        
        self.type = type
        
        if type != .Empty {
            backgroundColor = type.hashValue % 2 == 1 ? player1Color : player2Color
        }
        
        layer.cornerRadius = pieceSize / 2
        
    }

    // init(coder:) is called by storyboard
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        // piece selected
        delegate?.pieceSelected(self)
        
        // change color for selection
        
        
        
        // what kind of piece was selected?
//        if type != .Empty
        
    }
    
    

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
