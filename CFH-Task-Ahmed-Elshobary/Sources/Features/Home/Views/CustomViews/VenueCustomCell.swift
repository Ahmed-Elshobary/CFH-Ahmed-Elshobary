//
//  VenueCustomCell.swift
//  CFH-Task-Ahmed-Elshobary
//
//  Created by ahmed elshobary on 16/03/2024.
//

import UIKit
import AlamofireImage
class VenueCustomCell: UITableViewCell {
    
    // MARK: - Outelts
    
    @IBOutlet weak var venueImage: UIImageView!
    @IBOutlet weak var venueName: UILabel!
    @IBOutlet weak var venueAddress: UILabel!
    @IBOutlet weak var venueCategory: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(with venue: Venue) {
        venueName.text = venue.name ?? ""
        venueAddress.text = venue.location?.address ?? ""
        venueCategory.text = venue.categories?.first?.name ?? ""
        
        guard let icon = venue.categories?.first?.icon,
              let prefix = icon.prefix,
              let suffix = icon.suffix else {
            // Set a placeholder image if category icon info is missing
            self.venueImage.image = UIImage(named: "placeholder_image")
            return
        }
        
        let imageURLString = prefix + "64" + suffix // Adjust the image size as needed
        guard let url = URL(string: imageURLString) else {
            // Set a placeholder image if imageURL is invalid
            self.venueImage.image = UIImage(named: "Cairofinancialholding")
            return
        }
        
        // Use Alamofire to download the image asynchronously
        venueImage.af.setImage(withURL: url)
    }
}
