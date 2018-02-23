//
//  File.swift
//  muzic
//
//  Created by User on 2/4/18.
//  Copyright © 2018 User. All rights reserved.
//

import AVFoundation
import UIKit

class TrackManager {
    
//    var player: AVAudioPlayer!
    
     private static var uniqueInstance: TrackManager?
    
     private init() {}
    
    static func shared() -> TrackManager {
        if uniqueInstance == nil {
            uniqueInstance = TrackManager()
        }
        return uniqueInstance!
    }
    
    let myTracks: [Track] = [Track.init(title: "WarLocks", artist: "The Red Hot Peppers", coverImage: "https://firebasestorage.googleapis.com/v0/b/musiconlyapp.appspot.com/o/oneImg%2Fquest_pistols.jpg?alt=media&token=c04de93e-c007-482c-80fa-31dbabf03c2d", url: "https://firebasestorage.googleapis.com/v0/b/musiconlyapp.appspot.com/o/severalTracks%2F2.mp3?alt=media&token=2c8180bc-5a44-41d5-b523-5a41a34ab008", trackId: 0),
            Track.init(title: "Вечно Молодым", artist: "ST & Смысловые Галюцинации", coverImage: "https://firebasestorage.googleapis.com/v0/b/musiconlyapp.appspot.com/o/oneImg%2Fimages-4.jpeg?alt=media&token=648bad76-c3e1-44a9-84d5-c1a8acf538af", url: "https://firebasestorage.googleapis.com/v0/b/musiconlyapp.appspot.com/o/severalTracks%2F3.mp3?alt=media&token=409f680f-6883-4b49-92e3-bd2a1439924d", trackId: 1),
            Track.init(title: "QuestPistols", artist: "Deniel Jonse", coverImage: "https://firebasestorage.googleapis.com/v0/b/musiconlyapp.appspot.com/o/oneImg%2Fimages-3.jpeg?alt=media&token=d655904c-a79f-4f82-aa08-2e63abb2ac2c", url: "https://firebasestorage.googleapis.com/v0/b/musiconlyapp.appspot.com/o/severalTracks%2F1.mp3?alt=media&token=47110596-94b6-4490-88e6-f5d3a50f587f", trackId: 2),
            Track.init(title: "Fade To Black", artist: "metallica", coverImage: "https://firebasestorage.googleapis.com/v0/b/musiconlyapp.appspot.com/o/oneImg%2Fimages-2.jpeg?alt=media&token=146a5ed7-cc07-4816-9f4a-ca8e4d384259", url: "https://firebasestorage.googleapis.com/v0/b/musiconlyapp.appspot.com/o/severalTracks%2F4.mp3?alt=media&token=4a125b22-217a-4b16-8425-ef465d4fdd99", trackId: 3),
            Track.init(title: "Clab Foot", artist: "The Box Top", coverImage: "https://firebasestorage.googleapis.com/v0/b/musiconlyapp.appspot.com/o/oneImg%2F419121666_1_644x461_foto-i-video-zastavki-animatsiya-logotipa-gif-otkrytki-kiv.jpg?alt=media&token=d14fabb6-b542-46f9-9b9a-c82ee1aef9fd", url: "https://firebasestorage.googleapis.com/v0/b/musiconlyapp.appspot.com/o/severalTracks%2F5.mp3?alt=media&token=e0aed4ea-344d-4edb-97b1-7c025cb438d1", trackId: 4)]
}
