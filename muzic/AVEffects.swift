//
//  AVEffects.swift
//  muzic
//
//  Created by User on 2/20/18.
//  Copyright © 2018 User. All rights reserved.
//

import AVFoundation
import UIKit

class AVEffects {
    
    private var audioEngine = AVAudioEngine()
    private var audioFile: AVAudioFile!
    private var audioPlayerNode = AVAudioPlayerNode()
    private var reverb = AVAudioUnitReverb()
    private var audioDelay = AVAudioUnitDelay()
    
    func prepareToPlayAndPlay(trackId: Int) {
        
        if let url = Bundle.main.url(forResource: String(trackId), withExtension: "mp3") {
            do {
                audioFile = try AVAudioFile(forReading: url)
                
            } catch {
                print(error)
            }
        }
    }
    
    func startAudioEngine() {
        do {
            reverb.loadFactoryPreset(.largeHall2)
            audioEngine.attach(reverb)
            audioEngine.attach(audioPlayerNode)
            audioEngine.attach(audioDelay)
            audioEngine.connect(audioPlayerNode, to: reverb, format: audioFile.processingFormat)
            audioEngine.connect(reverb, to: audioDelay, format: audioFile.processingFormat)
            audioEngine.connect(audioDelay, to: audioEngine.mainMixerNode, format: audioFile.processingFormat)
            try audioEngine.start()
            
        } catch {
            print(error)
        }
    }
    
    func loadReverbUnit() {
        reverb.loadFactoryPreset(.largeHall2)
    }
    
    
    func startAudioPlayer(actionButton: UIButton) {
        if !audioPlayerNode.isPlaying {
            audioPlayerNode.scheduleFile(audioFile, at: nil, completionHandler: nil)
            audioPlayerNode.play()
            actionButton.setImage(UIImage.init(named: "pause.png"), for: .normal)
        } else {
            audioPlayerNode.pause()
            actionButton.setImage(UIImage.init(named: "play2.png"), for: .normal)
        }
    }
    
    func stopAudioPlayer() {
        if audioPlayerNode.isPlaying {
            audioPlayerNode.pause()
        }
    }
    
    func forReverbSliderValue(slider: UISlider) {
        reverb.wetDryMix = slider.value
    }
    
    func fordelayTimeSliderValue(slider: UISlider) {
        audioDelay.delayTime = TimeInterval(slider.value)
    }
    
    func forlowPassCutOffSliderValue(slider: UISlider) {
        audioDelay.lowPassCutoff = slider.value
    }
    
    func forfeedBackSliderValue(slider: UISlider) {
        audioDelay.feedback = slider.value
    }
    
    func forwetDryMixSliderValue(slider: UISlider) {
        audioDelay.wetDryMix = slider.value
    }
    

}
