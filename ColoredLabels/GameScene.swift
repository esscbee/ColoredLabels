//
//  GameScene.swift
//  ColoredLabels
//
//  Created by Stephen Brennan on 7/25/16.
//  Copyright (c) 2016 Stephen Brennan. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
    }
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }

    let textLabelName = "colorLabel"
    func updateText(inText : String?) {
        var toRemove = [SKNode]()
        for c in children {
            if let n = c.name {
                if n == textLabelName {
                    toRemove.append(c)
                }
            }
        }
        self.removeChildrenInArray(toRemove)
        if let text = inText {
            if !text.isEmpty {
                let idx = text.endIndex.advancedBy(-1)
                let greenText = text.substringToIndex(idx)
                let redText = text.substringFromIndex(idx)
                print("text ---- \(text)")
                print("Green \(greenText)")
                print("Red \(redText)")
                
                let greenLabel = SKLabelNode(text: greenText)
                self.addChild(greenLabel)
                greenLabel.name = textLabelName
                greenLabel.position = CGPointMake(frame.width / 2, frame.height / 2)
                greenLabel.zPosition = 10
                greenLabel.fontColor = SKColor.greenColor()
                
                let redLabel = SKLabelNode(text: redText)
                redLabel.name = textLabelName
                let gfr = greenLabel.frame
                let labx = gfr.origin.x + gfr.width
                redLabel.position = CGPointMake(labx, frame.height / 2)
                redLabel.horizontalAlignmentMode = .Left
                redLabel.fontColor = SKColor.redColor()
                self.addChild(redLabel)
                let w2 = redLabel.frame.width / 2
                greenLabel.position.x -= w2
                redLabel.position.x -= w2
            }
        }
    }
}
