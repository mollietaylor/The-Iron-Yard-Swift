//
//  GameBoardView.swift
//  GameBoard
//
//  Created by Mollie on 2/18/15.
//  Copyright (c) 2015 Proximity Viz LLC. All rights reserved.
//

import UIKit

@IBDesignable class GameBoardView: UIView, GamePieceDelegate {
    
    let gridSize = 8
    
    // add pieces
    override func layoutSubviews() {
        
        if let boardSquares = DataModel.mainData().currentGame?.boardSquares {
            
            for (rowIndex,rowArray) in enumerate(boardSquares) {
                
                for (colIndex,squarePieceType) in enumerate(rowArray) {
                    
                    if let type = PieceType(rawValue: squarePieceType) {
                        
                        let cF = CGFloat(colIndex)
                        let rF = CGFloat(rowIndex)
                        
                        let squareSize = frame.width / CGFloat(gridSize)
                        
                        let x = cF * squareSize
                        let y = rF * squareSize
                        
                        var piece = GamePiece(type: type)
                        
                        piece.square = (colIndex,rowIndex)
                        piece.delegate = self
                        
                        DataModel.mainData().currentGame?.boardPieces[rowIndex][colIndex] = piece
                        
                        piece.center = CGPointMake(x + squareSize / 2, y + squareSize / 2)
                        
                        addSubview(piece)
                        
                    }
                    
                }
                
            }
            
        }
        
    }
    
    func pieceSelected(piece: GamePiece) {
        
        // piece.square is your start point
        let (c,r) = piece.square
        let squareTopRight = DataModel.mainData().currentGame?.boardPieces[c+1][r-1]
        let squareTopLeft = DataModel.mainData().currentGame?.boardPieces[c-1][r-1]
//
        
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        if let touch = touches.allObjects.last as? UITouch {
            
            let location = touch.locationInView(self)
            
            let squareSize = frame.width / CGFloat(gridSize)
            
            let col = Int(floor(location.x / squareSize))
            let row = Int(floor(location.y / squareSize))
            
            let selectedSquare = DataModel.mainData().currentGame?.boardPieces[row][col]
            
            println(selectedSquare)
            
        }
        
    }
    
    // draw game board
    override func drawRect(rect: CGRect) {
        
        var context = UIGraphicsGetCurrentContext()
        
        // loop through cols
        for c in 0..<gridSize {
            
            // loop through rows
            for r in 0..<gridSize {
                
                let cF = CGFloat(c)
                let rF = CGFloat(r)
                
                let squareSize = rect.width / CGFloat(gridSize)
                
                let x = cF * squareSize
                let y = rF * squareSize
                
                let color = (c + r) % 2 == 0 ? UIColor.redColor() : UIColor.blackColor()
                
                color.set()
                
                CGContextFillRect(context, CGRectMake(x, y, squareSize, squareSize))
                
            }
            
        }
        
    }

}
