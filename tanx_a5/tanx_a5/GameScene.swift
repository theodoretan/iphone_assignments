//
//  GameScene.swift
//  tanx_a5
//
//  Created by Theodore Tan on 2017-03-15.
//  Copyright © 2017 Theodore Tan. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    private var createdContent = false;
    
    private var player = SKSpriteNode(imageNamed: "Spaceship");
    private var fire = SKSpriteNode(imageNamed: "fire");
    private var enemies = [SKSpriteNode]();
    private var bullets = [SKSpriteNode]();
    private var contactQueue = [SKPhysicsContact]()
    private let scale:CGFloat = 0.5;
    private var timeLastCreate = 0.0;
    private var timePerCreate = 3.0;
    
    private let playerName = "player";
    private let enemyName = "enemy";
    private let bulletName = "bullet";
    
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
        
        if (!createdContent) {
            createContent();
            physicsWorld.contactDelegate = self;
        }

    }
    
    func createContent() {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame);
        physicsBody!.categoryBitMask = PhysicsCategory.SceneCategory;
        
        createPlayer();
        createBar();
        
        self.backgroundColor = SKColor.black;
    }
    
    
    func createPlayer() {
        player.zPosition = 5;
        player.setScale(scale);
        player.name = playerName;
        
        // bitmasking
        player.physicsBody = SKPhysicsBody(rectangleOf: player.frame.size);
        player.physicsBody?.affectedByGravity = false;
        player.physicsBody!.categoryBitMask = PhysicsCategory.PlayerCategory;
        player.physicsBody!.contactTestBitMask = PhysicsCategory.EnemyCategory;
        player.physicsBody!.collisionBitMask = PhysicsCategory.SceneCategory;
        
        player.position = CGPoint(x: self.frame.midX, y: -(self.size.height/3));
        addChild(player);
    }
    
    func createBar() {
        fire.position = CGPoint(x: self.frame.midX, y: -(self.size.height/2.2));
        self.addChild(fire);
    }
    
    func createEnemy(forUpdate currentTime: CFTimeInterval) {
        if (currentTime - timeLastCreate < timePerCreate) {
            return;
        }

        // create an enemy
        print("create enemy");
        
        let invader = SKSpriteNode(imageNamed: "ufo");
        invader.name = enemyName;
        // random x
        
        let upperBound = UInt32(self.size.width/2 - invader.size.width/2);
        
        var xValue = Int(arc4random_uniform(upperBound));
        let neg: UInt32 = arc4random_uniform(2);
        if (neg == 1) {
            xValue = -1 * xValue;
        }
        invader.position = CGPoint(x: CGFloat(xValue), y: self.size.height/2);
        
        let invaderAction = SKAction.sequence([
            SKAction.moveTo(y: -self.size.height/2, duration: 3.0),
            SKAction.wait(forDuration: 3.0 / 60.0),
            SKAction.removeFromParent()
            ]);
        
        invader.run(invaderAction);
        
        
        
        // bitmasking
        invader.physicsBody = SKPhysicsBody(rectangleOf: invader.frame.size);
        invader.physicsBody!.isDynamic = false;
        invader.physicsBody!.categoryBitMask = PhysicsCategory.EnemyCategory;
        invader.physicsBody!.contactTestBitMask = 0x0;
        invader.physicsBody!.collisionBitMask = 0x0;
        
        
        self.addChild(invader);
        
        self.timeLastCreate = currentTime;
    }
    
    func moveEnemy(forUpdate currentTime: CFTimeInterval) {
        enumerateChildNodes(withName: enemyName) {node,stop in
            node.position.y -= 10;
        }
    }
    
    func touchDown(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.green
            self.addChild(n)
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.blue
            self.addChild(n)
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.red
            self.addChild(n)
        }
    }
    
    func pewpew() {
        let bullet = SKSpriteNode(imageNamed: "bullet");
        bullet.setScale(scale);
        bullet.position = CGPoint(x: player.position.x, y: player.position.y);
        bullet.name = bulletName;
        
        // bitmask
        bullet.physicsBody = SKPhysicsBody(rectangleOf: bullet.frame.size);
        bullet.physicsBody!.affectedByGravity = false;
        bullet.physicsBody!.categoryBitMask = PhysicsCategory.BulletCategory;
        bullet.physicsBody!.contactTestBitMask = PhysicsCategory.EnemyCategory;
        bullet.physicsBody!.collisionBitMask = 0x0;
        
        
        let bulletAction = SKAction.sequence([
            SKAction.moveTo(y: self.size.height/2, duration: 1.0),
            SKAction.wait(forDuration: 3.0 / 60.0),
            SKAction.removeFromParent()
            ]);
        
        bullet.run(bulletAction);
        
        bullets.append(bullet);
        
//        let action = SKAction.moveTo(y: self.size.height, duration: 1.5);
//        bullet.run(action);
        
        
        self.addChild(bullet);
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            let location = t.location(in: self);
            
            let fw = fire.size.width/2;
            let fh = fire.size.height/2;
            
            if ((location.y > fire.position.y - fh && location.y < fire.position.y + fh) &&
                location.x > fire.position.x - fw && location.x < fire.position.x + fw){
                print("pewpew");
                
                pewpew();
                
                
            }
            self.touchDown(atPoint: t.location(in: self))
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            let location = t.location(in: self);
            
            let pw = player.size.width/2;
            let ph = player.size.height/2;
            //  && (location.x > player.position.x - pw && location.x < player.position.x + pw)
            if ((location.y > player.position.y - ph && location.y < player.position.y + ph) &&
                (location.x < self.frame.width/2 - pw && location.x > -self.frame.width/2 + pw)) {
                // only move the spaceship if touching the spaceship area
                // make sure the entire spaceship is always on screen
                player.position.x = location.x;
            }
            
            self.touchMoved(toPoint: t.location(in: self))
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    func processContacts(forUpdate currentTime: CFTimeInterval) {
        for contact in contactQueue {
            handle(contact)
            
            if let index = contactQueue.index(of: contact) {
                contactQueue.remove(at: index)
            }
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        print("hit");
        contactQueue.append(contact)
    }
    
    func handle(_ contact: SKPhysicsContact) {
        if (contact.bodyA.node?.parent == nil || contact.bodyB.node?.parent == nil) {
            return;
        }
        
        let nodeNames = [contact.bodyA.node!.name!, contact.bodyB.node!.name!];
        
        if (nodeNames.contains(playerName) && nodeNames.contains(enemyName)) {
            print("ded");
        } else if (nodeNames.contains(enemyName) && nodeNames.contains(bulletName)) {
            contact.bodyA.node!.removeFromParent();
            contact.bodyB.node!.removeFromParent();
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        createEnemy(forUpdate: currentTime);
        processContacts(forUpdate: currentTime);
    }
    
}