//
//  Musi.swift
//  muzic
//
//  Created by User on 2/20/18.
//  Copyright © 2018 User. All rights reserved.
//

import UIKit
import AVFoundation

class EffectsViewController: UIViewController {
    
    private var trackId: Int = 0
    private var track: Track!
    private let effect = AVEffects()
    
    
    @IBOutlet weak var trackTitle: UILabel!
    @IBOutlet weak var trackArtist: UILabel!
    
    @IBOutlet weak var playPauseButt: UIButton!
    
    
    @IBOutlet weak var reverbSlider: UISlider!
    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var lowPasCutOffSlider: UISlider!
    @IBOutlet weak var feedBackSlider: UISlider!
    @IBOutlet weak var wetDryMixSlider: UISlider!
    
    
    
    static func with(trackId: Int) -> EffectsViewController {
        let effectsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EffectsViewController") as! EffectsViewController
        effectsVC.trackId = trackId
        
        return effectsVC
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        track = TrackManager.shared().myTracks[trackId]
        
        trackTitle.text = track.title
        trackArtist.text = track.artist
        
        effect.prepareToPlayAndPlay(trackId: trackId)
        effect.startAudioEngine()
        effect.loadReverbUnit()
        
    }
    
    
    @IBAction func reverSlider(_ sender: UISlider) {
        effect.forReverbSliderValue(slider: reverbSlider)
    }
    
    
    @IBAction func timeSlider(_ sender: UISlider) {
        effect.fordelayTimeSliderValue(slider: timeSlider)
    }
    
    
    @IBAction func lowPassCutOffSlider(_ sender: UISlider) {
        effect.forlowPassCutOffSliderValue(slider: lowPasCutOffSlider)
    }
    
    
    @IBAction func feedBackSlider(_ sender: UISlider) {
        effect.forfeedBackSliderValue(slider: feedBackSlider)
    }
    
    
    @IBAction func wetDryMixSlider(_ sender: Any) {
        effect.forwetDryMixSliderValue(slider: wetDryMixSlider)
    }
    
    
    @IBAction func playButtonTapped(_ sender: Any) {
        effect.startAudioPlayer(actionButton: playPauseButt)
    }
    
    
}
