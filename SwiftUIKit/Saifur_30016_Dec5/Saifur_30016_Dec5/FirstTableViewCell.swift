import UIKit

class FirstTableViewCell: UITableViewCell {

   
    @IBOutlet weak var imgView: UIView!
    
    @IBOutlet weak var txtLabel: UIStackView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
