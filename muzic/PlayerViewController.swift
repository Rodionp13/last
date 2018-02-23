//
//  PlayerViewController.swift
//  muzic
//
//  Created by User on 1/27/18.
//  Copyright © 2018 User. All rights reserved.
//
import AVFoundation
import Foundation
import UIKit

class PlayerViewController: UIViewController {
    
    @IBOutlet weak var trackImage: UIImageView!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var artist: UILabel!
    @IBOutlet weak var trackTitle: UILabel!
    
    
    
    private var trackId = 0
    private var player = Player()
    
    
    
    static func with(trackId: Int) -> PlayerViewController {
        let playerVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PlayerViewController") as! PlayerViewController
        playerVC.trackId = trackId
        
        return playerVC
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let track = TrackManager.shared().myTracks[trackId]
        
        trackImage.sd_setImage(with: URL.init(string: "\(track.coverImage)"), completed: nil)
        
        artist.text = track.artist
        trackTitle.text = track.title
        
        player.preparingForAudioStreaming(track: track)
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateProgressView), userInfo: nil, repeats: true)
        progressView.setProgress(player.progressive(), animated: true)
        
//        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateProgressView), userInfo: nil, repeats: true)
//        progressView.setProgress(player.updateProgressView(), animated: true)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        player.stopForPVC()
    }
    
    @objc func updateProgressView() {
        progressView.setProgress(player.progressive(), animated: true)
    }
    
    
    
    @IBAction func play(_ sender: Any) {
        player.playForPVC()
    }
    
    
    @IBAction func pause(_ sender: Any) {
        player.pauseForPVC()
    }
    
    
    @IBAction func stop(_ sender: Any) {
        progressView.progress = 0
        player.stopForPVC()
        player.preparingForAudioStreaming(track: TrackManager.shared().myTracks[trackId])
    }
    
    
    @IBAction func fastFoward(_ sender: Any) {
        player.fastForward()
    }
    
    
    @IBAction func fastBackward(_ sender: Any) {
        player.fastBackward()
    }
    
    
    @IBAction func next(_ sender: Any) {
        let nextTrackId = trackId + 1
        if nextTrackId < TrackManager.shared().myTracks.count {
            trackId += 1
            
            let track = TrackManager.shared().myTracks[trackId]
            
            trackImage.sd_setImage(with: URL.init(string: "\(track.coverImage)"), completed: nil)
            
            artist.text = track.artist
            trackTitle.text = track.title
            
            
            progressView.progress = 0
            
            player.preparingForAudioStreaming(track: track)
            player.playForPVC()
        }
    }

    @IBAction func previous(_ sender: Any) {
        if trackId != 0 || trackId > 0 {
            trackId -= 1
            
            let track = TrackManager.shared().myTracks[trackId]
            
            trackImage.sd_setImage(with: URL.init(string: "\(track.coverImage)"), completed: nil)
            
            artist.text = track.artist
            trackTitle.text = track.title
            
            progressView.progress = 0
            
            player.preparingForAudioStreaming(track: track)
            player.playForPVC()
        }
    }
    
    
    
    @IBAction func goToAudioEffects(_ sender: Any) {
        player.stopForPVC()
        let effectsVC = EffectsViewController.with(trackId: trackId)
        navigationController?.pushViewController(effectsVC, animated: true)
    }
    
    
    
    
    
    
}
