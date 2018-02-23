//
//  TableViewController.swift
//  muzic
//
//  Created by User on 1/19/18.
//  Copyright © 2018 User. All rights reserved.
//

import UIKit
import AVFoundation

class TableViewController: UITableViewController, TableViewCellDelegate {
    
    private let myTracks = TrackManager.shared().myTracks
    private let player = Player()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = UIColor.init(red: 0.3, green: 0, blue: 0.1, alpha: 0.8)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func play(track: Track) {
        player.play(track: track)
    }
    
    func pause(track: Track) {
        player.stop(track)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myTracks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "musicCell", for: indexPath) as! TableViewCell
        cell.title.text = myTracks[indexPath.row].title
        cell.author.text = myTracks[indexPath.row].artist
        cell.track = myTracks[indexPath.row]
        cell.delegate = self
        
        
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if player.getPlayerItem() != nil {
            player.pauseForPVC()
            } else {
                player.preparingForAudioStreaming(track: myTracks[indexPath.row])
            }
//        player.preparePlayer(track: myTracks[indexPath.row])
        
        let playerVC = PlayerViewController.with(trackId: myTracks[indexPath.row].trackId)
        navigationController?.pushViewController(playerVC, animated: true)
        
    }
    

    
    
}
