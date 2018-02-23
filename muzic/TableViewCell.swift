//
//  TableViewCell.swift
//  muzic
//
//  Created by User on 1/19/18.
//  Copyright © 2018 User. All rights reserved.
//

import UIKit
import AVFoundation

protocol TableViewCellDelegate: class {
    func play(track: Track)
    func pause(track: Track)
}

class TableViewCell: UITableViewCell {
    
    weak var delegate: TableViewCellDelegate!
    var track: Track!
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var author: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.backgroundColor = UIColor.init(red: 0.6, green: 0.2, blue: 0.3, alpha: 0.9)
        // Configure the view for the selected state
    }
    
    
    @IBAction func play(_ sender: Any) {
        delegate.play(track: self.track)
        self.backgroundColor = .white
    }
    
    
    @IBAction func pause(_ sender: Any) {
        delegate.pause(track: self.track)
        self.backgroundColor = UIColor.init(red: 0.6, green: 0.2, blue: 0.3, alpha: 0.9)
    }

}
