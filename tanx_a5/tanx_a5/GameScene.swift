//
//  GameScene.swift
//  tanx_a5
//
//  Created by Theodore Tan on 2017-03-15.
//  Copyright © 2017 Theodore Tan. All rights reserved.
//


// explosion on collision


import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    private var kills = 0;
    private var lives = 3; // the number of lives the player has
    private var createdContent = false;
    
    private var player = SKSpriteNode(imageNamed: Settings.player);
    private var fire = SKSpriteNode(imageNamed: Settings.fire);
    private var leftarrow = SKSpriteNode(imageNamed: Settings.left);
    private var rightarrow = SKSpriteNode(imageNamed: Settings.right);
    
    private var contactQueue = [SKPhysicsContact]();
    private var timeLastCreate = 0.0;
    
    override func didMove(to view: SKView) {
        if (!createdContent) {
            createContent();
            createdContent = true;
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
        player.setScale(CGFloat(Settings.scale));
        player.name = Settings.playerName;
        
        // bitmasking
        player.physicsBody = SKPhysicsBody(rectangleOf: player.frame.size);
        player.physicsBody?.affectedByGravity = false;
        player.physicsBody!.categoryBitMask = PhysicsCategory.PlayerCategory;
        player.physicsBody!.contactTestBitMask = PhysicsCategory.EnemyCategory;
        player.physicsBody!.collisionBitMask = PhysicsCategory.SceneCategory;
        
        player.position = CGPoint(x: self.frame.midX, y: player.size.height + fire.size.height/4);
        addChild(player);
    }
    
    func createBar() {
        fire.position = CGPoint(x: self.frame.midX, y: fire.size.height/2);
        self.addChild(fire);
        
        leftarrow.position = CGPoint(x: self.frame.midX - self.frame.width/4, y: fire.size.height/2);
        rightarrow.position = CGPoint(x: self.frame.midX + self.frame.width/4, y: fire.size.height/2);
        
        self.addChild(leftarrow);
        self.addChild(rightarrow);

    }
    
    func createEnemy(forUpdate currentTime: CFTimeInterval) {
        if (currentTime - timeLastCreate < Settings.INTERVAL) {
            return;
        }

        // create an enemy
        print("create enemy");
        
        let invader = SKSpriteNode(imageNamed: Settings.enemy);
        invader.name = Settings.enemyName;
        
        let upperBound = UInt32(self.size.width - invader.size.width);
        
        let xValue = Int(arc4random_uniform(upperBound));
//        }
        invader.position = CGPoint(x: CGFloat(xValue)+invader.size.width/2, y: self.size.height + invader.size.height);
        
        let removeHealth = SKAction.run {
            self.lives -= 1;
            print(self.lives);
            if self.lives == Settings.EOG {
                self.endGame();
            }
        };
        
        let invaderAction = SKAction.sequence([
            SKAction.moveTo(y: CGFloat(Settings.BOS), duration: Settings.INVADER_SPEED),
            SKAction.wait(forDuration: 3.0 / 60.0),
            SKAction.removeFromParent(),
            removeHealth
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
    
    func pewpew() {
        let bullet = SKSpriteNode(imageNamed: Settings.bullet);
        bullet.setScale(CGFloat(Settings.scale));
        bullet.position = CGPoint(x: player.position.x, y: player.position.y);
        bullet.name = Settings.bulletName;
        
        // bitmask
        bullet.physicsBody = SKPhysicsBody(rectangleOf: bullet.frame.size);
        bullet.physicsBody!.affectedByGravity = false;
        bullet.physicsBody!.categoryBitMask = PhysicsCategory.BulletCategory;
        bullet.physicsBody!.contactTestBitMask = PhysicsCategory.EnemyCategory;
        bullet.physicsBody!.collisionBitMask = 0x0;
        
        
        let bulletAction = SKAction.sequence([
            SKAction.moveTo(y: self.size.height, duration: Settings.BULLET_SPEED),
            SKAction.wait(forDuration: 3.0 / 60.0),
            SKAction.removeFromParent()
            ]);
        
        let soundAction = SKAction.playSoundFileNamed(Settings.pew, waitForCompletion: true);
        
        bullet.run(SKAction.group([bulletAction, soundAction]));
        
        
        self.addChild(bullet);
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            let location = t.location(in: self);
            
            if (fire.contains(location)){
                print("pewpew");
                
                pewpew();
            }
            
            else if (rightarrow.contains(location)) {
                moveShip(direction: Settings.rDirection, location: location);
            } else if (leftarrow.contains(location)) {
                moveShip(direction: Settings.lDirection, location: location);
            }
        }
    }
    
    func moveShip(direction: String, location: CGPoint) {
        let pw = player.size.width/2;
        if (direction == Settings.rDirection) {
            if (location.x < self.frame.width - pw && location.x > pw) {
                player.position.x += CGFloat(Settings.move);
            }
        } else if (direction == Settings.lDirection) {
            if (location.x < self.frame.width - pw && location.x > pw) {
                player.position.x -= CGFloat(Settings.move);
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            let location = t.location(in: self);
            
            let pw = player.size.width/2;
            if (player.contains(location) &&
                (location.x < self.frame.width - pw && location.x > pw)) {
                player.position.x = location.x;
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
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
        contactQueue.append(contact)
    }
    
    func handle(_ contact: SKPhysicsContact) {
        if (contact.bodyA.node?.parent == nil || contact.bodyB.node?.parent == nil) {
            return;
        }
        
        let nodeNames = [contact.bodyA.node!.name!, contact.bodyB.node!.name!];
        
        if (nodeNames.contains(Settings.playerName) && nodeNames.contains(Settings.enemyName)) {
            contact.bodyA.node!.removeFromParent();
            contact.bodyB.node!.removeFromParent();
            
            let action = SKAction.playSoundFileNamed(Settings.boom, waitForCompletion: true);
            self.run(action);
            
            let explosion = SKSpriteNode(imageNamed: Settings.explosion);
            explosion.position = CGPoint(x: player.position.x, y: player.position.y);
            self.addChild(explosion);
            
            _ = Timer.scheduledTimer(timeInterval: Settings.waitTime2, target: self, selector: #selector(GameScene.endGame), userInfo: nil, repeats: false);
            
        } else if (nodeNames.contains(Settings.enemyName) && nodeNames.contains(Settings.bulletName)) {
            kills += 1;
            contact.bodyA.node!.removeFromParent();
            contact.bodyB.node!.removeFromParent();
            
            let action = SKAction.playSoundFileNamed(Settings.boom, waitForCompletion: true);
            
            self.run(action);
            
            if kills == Settings.KILLED_TO_WIN {
                winGame();
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        createEnemy(forUpdate: currentTime);
        processContacts(forUpdate: currentTime);
        
        // check if ufo reached bottom of screen
    }
    
    func winGame() {
        let winScene: WinScene = WinScene(size: size);
        winScene.scaleMode = .aspectFit;
        view?.presentScene(winScene, transition: SKTransition.doorsOpenHorizontal(withDuration: Settings.transition));
    }
    
    func endGame() {
        let gameOverScene: GameOverScene = 	GameOverScene(size: size);
        gameOverScene.scaleMode = .aspectFit;
        view?.presentScene(gameOverScene, transition: SKTransition.doorsOpenHorizontal(withDuration: Settings.transition));
    }
}
