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
        self.backgroundColor = .white
        // Configure the view for the selected state
    }
    
    
    @IBAction func play(_ sender: Any) {
        delegate.play(track: self.track)
        self.backgroundColor = .lightGray
    }
    
    
    @IBAction func pause(_ sender: Any) {
        delegate.pause(track: self.track)
        self.backgroundColor = .white
    }

}
