//
//  Player.swift
//  muzic
//
//  Created by User on 2/8/18.
//  Copyright © 2018 User. All rights reserved.
//

import AVFoundation
import UIKit

 class Player {
    
//    private var player: AVAudioPlayer!
    private var playerAV: AVPlayer!
    private var playerItem: AVPlayerItem?
    private var track: Track!
    
//    func preparePlayer(track: Track) {
//        if let audioPathURL = Bundle.main.url(forResource: String(track.trackId), withExtension: "mp3") {
//            do {
//                player = try AVAudioPlayer(contentsOf: audioPathURL)
//                player.currentTime = 0
//            } catch {
//                print(error)
//            }
//        }
//    }
    
    func getPlayerItem() -> AVPlayerItem? {
        if self.playerItem != nil {
        return self.playerItem
        } else {
            return nil
        }
    }
    
    func preparingForAudioStreaming(track: Track)  {
        if let url = URL(string: "\(track.url)") {
            playerItem = AVPlayerItem.init(url: url)
            
            do {
                playerAV = try AVPlayer(playerItem:playerItem)
                
            } catch let error as NSError {
                playerAV = nil
                print(error.localizedDescription)
//            } catch {
//                print("AVAudioPlayer init failed")
//            }
            }
        }
    }
    
    func play(track: Track) {
        self.track = track
//        preparePlayer(track: track)
        preparingForAudioStreaming(track: track)
        if playerAV.rate == 0 {
        playerAV.play()
        }
    }
    
    func stop(_ track: Track) {
        if self.track.trackId == track.trackId && playerAV.rate != 0 {
            playerAV.replaceCurrentItem(with: nil)
        }
    }
    
    func playForPVC() {
//        if !player.isPlaying {
        if playerAV.rate == 0 {
            playerAV.play()
        }
    }
    
    func pauseForPVC() {
        playerAV.pause()
    }
    
    func stopForPVC() {
//        playerAV.replaceCurrentItem(with: nil)
        playerAV.replaceCurrentItem(with: self.getPlayerItem())
    }
    
    func progressive() -> Float {
//       return Float(player.currentTime / player.duration)
        let output = Float(CMTimeGetSeconds((playerItem?.currentTime())!)) /  Float(CMTimeGetSeconds((playerItem?.asset.duration)!))
        return output
    }
    
    func fastForward() {
        let seekDuration: Float64 = 5
        
            guard let duration  = playerAV.currentItem?.duration else{
                return
            }
            let playerCurrentTime = CMTimeGetSeconds(playerAV.currentTime())
            let newTime = playerCurrentTime + seekDuration
            
            if newTime < CMTimeGetSeconds(duration) {
                
                let time2: CMTime = CMTimeMake(Int64(newTime * 1000 as Float64), 1000)
                playerAV.seek(to: time2)
            }
        }
        
//        var forward: TimeInterval = Double(CMTimeGetSeconds(playerItem.currentTime()))
//        forward += 10
//        if player.rate != 0 {
//            if forward >= Double(CMTimeGetSeconds(playerItem.asset.duration)) {
//             playerAV.replaceCurrentItem(with: nil)
//            } else {
//
////             player.currentTime = forward
//            }
//        }
    
    func fastBackward() {
        let seekDuration: Float64 = 5
        
        let playerCurrentTime = CMTimeGetSeconds(playerAV.currentTime())
        var newTime = playerCurrentTime - seekDuration
        
        if newTime < 0 {
            newTime = 0
        }
        let time2: CMTime = CMTimeMake(Int64(newTime * 1000 as Float64), 1000)
        playerAV.seek(to: time2)
//        var backward: TimeInterval = player.currentTime
//        backward -= 10
//
//        if player.isPlaying {
//            if backward <= 0 {
//             player.stop()
//            } else {
//             player.currentTime = backward
//            }
//        }
    }
    
}
