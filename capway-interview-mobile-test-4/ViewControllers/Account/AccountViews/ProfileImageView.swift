//
//  ProfileImageView.swift
//  capway-interview-mobile-test-4
//
//  Created by Ryan Prince on 3/21/22.
//

import UIKit

class ProfileImageView: UIView {
    
    // Layout properties for quick alignment adjustments
    static private let diameter = 28
    static private let padding = 8
    
    private var profileImage: UIImageView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Clips the profile photo into a circle
        profileImage.layer.cornerRadius = CGFloat(ProfileImageView.diameter/2)
        profileImage.clipsToBounds = true
    }
    
    convenience init(for imageName: String) {
        self.init(frame: CGRect(x: 0, y: 0, width: ProfileImageView.diameter + ProfileImageView.padding, height: ProfileImageView.diameter))
        profileImage = UIImageView(frame: CGRect(x: 0, y: 0, width: ProfileImageView.diameter, height: ProfileImageView.diameter))
        addSubview(profileImage)
        profileImage.image = UIImage(named: imageName)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
