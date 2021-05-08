//
//  TodoTableViewCell.swift
//  RowSelectionTableView
//
//  Created by YoNa on 2021/05/08.
//

import UIKit

class TodoTableViewCell: UITableViewCell {

    @IBOutlet weak var checkmarkImageView: UIImageView!
    @IBOutlet weak var taskLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

struct Todo {
    var title : String
    var isMarked : Bool
}
