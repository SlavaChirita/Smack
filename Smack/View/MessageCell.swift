//
//  MessageCell.swift
//  Smack
//
//  Created by Slava Chirita on 2/22/19.
//  Copyright © 2019 Slava Chirita. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var messageLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
    
    }
    
    func configureCell(message: Message) {
        messageLbl.text = message.message
        userNameLbl.text = message.userName
        userImage.image = UIImage(named: message.userAvatar)
        userImage.backgroundColor = UserDataService.instance.returnUIColor(components: message.userAvatarColor)
    }
}
