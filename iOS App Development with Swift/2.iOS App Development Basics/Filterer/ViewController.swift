//
//  AppDelegate.swift
//  Filterer.2
//
//  Created by Scarlett on 11/21/15.
//  Copyright © 2015 Scarlett. All rights reserved.
//


import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var filteredImage: UIImage?
    var originalImage: UIImage?
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var filterButton: UIButton!
    
    @IBOutlet var whitenButton: UIButton!
    @IBOutlet var sweetButton: UIButton!
    @IBOutlet var dreamyButton: UIButton!
    @IBOutlet var coolButton: UIButton!
    @IBOutlet var blackWhiteButton: UIButton!
    
    @IBOutlet var compareButton: UIButton!
    
    @IBOutlet var secondaryMenu: UIView!
    @IBOutlet var bottomMenu: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondaryMenu.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.8)
        secondaryMenu.translatesAutoresizingMaskIntoConstraints = false
        
        originalLabel.hidden = true
        compareButton.enabled = false
        
        let imageTap = UILongPressGestureRecognizer()
        imageTap.numberOfTapsRequired = 0
        imageTap.numberOfTouchesRequired = 1
        imageTap.minimumPressDuration = 0
        imageTap.addTarget(self, action: "imageToggle:")
        imageView.addGestureRecognizer(imageTap)
    }

    // MARK: Share
    @IBAction func onShare(sender: AnyObject) {
        let activityController = UIActivityViewController(activityItems: ["Check out our really cool app", imageView.image!], applicationActivities: nil)
        presentViewController(activityController, animated: true, completion: nil)
    }
    
    // MARK: New Photo
    @IBAction func onNewPhoto(sender: AnyObject) {
        let actionSheet = UIAlertController(title: "New Photo", message: nil, preferredStyle: .ActionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .Default, handler: { action in
            self.showCamera()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Album", style: .Default, handler: { action in
            self.showAlbum()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        
        self.presentViewController(actionSheet, animated: true, completion: nil)
    }
    
    func showCamera() {
        let cameraPicker = UIImagePickerController()
        cameraPicker.delegate = self
        cameraPicker.sourceType = .Camera
        
        presentViewController(cameraPicker, animated: true, completion: nil)
    }
    
    func showAlbum() {
        let cameraPicker = UIImagePickerController()
        cameraPicker.delegate = self
        cameraPicker.sourceType = .PhotoLibrary
        
        presentViewController(cameraPicker, animated: true, completion: nil)
    }
    
    // MARK: UIImagePickerControllerDelegate
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        dismissViewControllerAnimated(true, completion: nil)
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.image = image
            originalImage = nil
            filteredImage = nil
            hideSecondaryMenu()
            filterButton.selected = false
            toggleFilterButtons()
        }
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: Filter Menu
    @IBAction func onFilter(sender: UIButton) {
        if sender.selected {
            hideSecondaryMenu()
            sender.selected = false
        } else {
            showSecondaryMenu()
            sender.selected = true
        }
    }
    
    func showSecondaryMenu() {
        view.addSubview(secondaryMenu)
        
        let bottomConstraint = secondaryMenu.bottomAnchor.constraintEqualToAnchor(bottomMenu.topAnchor)
        let leftConstraint = secondaryMenu.leftAnchor.constraintEqualToAnchor(view.leftAnchor)
        let rightConstraint = secondaryMenu.rightAnchor.constraintEqualToAnchor(view.rightAnchor)
        
        let heightConstraint = secondaryMenu.heightAnchor.constraintEqualToConstant(44)
        
        NSLayoutConstraint.activateConstraints([bottomConstraint, leftConstraint, rightConstraint, heightConstraint])
        
        view.layoutIfNeeded()
        
        self.secondaryMenu.alpha = 0
        UIView.animateWithDuration(0.4) {
            self.secondaryMenu.alpha = 1.0
        }
    }

    @IBOutlet var originalLabel: UILabel!
    func hideSecondaryMenu() {
        UIView.animateWithDuration(0.4, animations: {
            self.secondaryMenu.alpha = 0
            }) { completed in
                if completed == true {
                    self.secondaryMenu.removeFromSuperview()
                }
        }
    }
    
    //Secondary menu filter actions
    @IBAction func WhitenFilter(sender: UIButton) {
        if sender.selected == true {
            filterOnCheck()
            toggleFilterButtons()
            return
        }
        toggleFilterButtons()
        sender.selected = true
        
        filterOnCheck()
        filterHelper("whiten")
    }

    @IBAction func SweetFilter(sender: UIButton) {
        if sender.selected == true {
            filterOnCheck()
            toggleFilterButtons()
            return
        }
        toggleFilterButtons()
        sender.selected = true
        
        filterOnCheck()
        filterHelper("sweet")
    }
    
    @IBAction func DreamyFilter(sender: UIButton) {
        if sender.selected == true {
            filterOnCheck()
            toggleFilterButtons()
            return
        }
        toggleFilterButtons()
        sender.selected = true
        
        filterOnCheck()
        filterHelper("dreamy")
    }
    
    @IBAction func CoolFilter(sender: UIButton) {
        if sender.selected == true {
            filterOnCheck()
            toggleFilterButtons()
            return
        }
        toggleFilterButtons()
        sender.selected = true
        
        filterOnCheck()
        filterHelper("cool")
    }
    
    @IBAction func BlackWhiteFilter(sender: UIButton) {
        if sender.selected == true {
            filterOnCheck()
            toggleFilterButtons()
            return
        }
        toggleFilterButtons()
        sender.selected = true
        
        filterOnCheck()
        filterHelper("blackWhite")
    }
    
    //Button state manager
    func toggleFilterButtons() {
        whitenButton.selected = false
        sweetButton.selected = false
        dreamyButton.selected = false
        coolButton.selected = false
        blackWhiteButton.selected = false
        
        compareButton.enabled = false
        compareButton.selected = false
    }
    
    //Filter helpers
    func filterOnCheck() {
        if originalImage != nil {
            imageView.image = originalImage
            originalImage = nil
        }
    }
    
    func filterHelper(filter: String) {
        originalImage = imageView.image
        let rgbaImage = RGBAImage(image: originalImage!)
        
        //Process & swap original image for filtered image
        filteredImage = filterPresets[filter]!(rgbaImage!).toUIImage()
        imageView.image = filteredImage
        
        compareButton.enabled = true
    }
    
    //Compare button
    @IBAction func compareToggle(sender: UIButton) {
        if originalImage == nil {
            return
        }
        
        if sender.selected {
            originalLabel.hidden = true
            sender.selected = false
            imageView.image = filteredImage
        }
        else {
            originalLabel.hidden = false
            sender.selected = true
            imageView.image = originalImage
        }
    }
    
    //Image view compare toggle
    func imageToggle(sender: UILongPressGestureRecognizer) {
        if originalImage == nil {
            return
        }
        
        if sender.state == .Began {
            imageView.image = originalImage
            originalLabel.hidden = false
        }
        if sender.state == .Ended {
            imageView.image = filteredImage
            originalLabel.hidden = true
        }
    }
}

