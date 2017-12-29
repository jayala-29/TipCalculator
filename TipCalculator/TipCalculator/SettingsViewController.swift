//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Jessy Ayala on 12/28/17.
//  Copyright © 2017 Jessy Ayala. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class SettingsViewController: UIViewController {
    
    
    @IBOutlet weak var aboutMeButton: UIButton!
    @IBOutlet weak var meImage: UIImageView!
    @IBOutlet weak var githubButton: UIButton!
    @IBOutlet weak var linkedinButton: UIButton!
    @IBOutlet weak var hideLabel: UILabel!
    @IBOutlet weak var speedSlider: UISlider!
    var speed = 0.5
    @IBOutlet weak var fasterLabel: UILabel!
    @IBOutlet weak var slowerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        aboutMeButton.isHidden = true
        meImage.isHidden = true
        githubButton.isHidden = true
        linkedinButton.isHidden = true
        hideLabel.isHidden = true
        speedSlider.isHidden = true
        fasterLabel.isHidden = true
        slowerLabel.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        aboutMeButton.isHidden = false
        aboutMeButton.center.x = view.center.x 
        aboutMeButton.center.x -= view.bounds.width
        UIView.animate(withDuration: 1, delay: 0, options: [.curveEaseOut],
                       animations: {
                        self.aboutMeButton.center.x += self.view.bounds.width
                        self.view.layoutIfNeeded()
            }, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func rotateView() {
        UIView.animate(withDuration: speed, delay: 0, options: .curveLinear, animations: { () -> Void in
            self.meImage.transform = self.meImage.transform.rotated(by: CGFloat(M_PI_2))
        }) { (finished) -> Void in
            self.rotateView()
        }
    }
    
    @IBAction func sliderMoved(_ sender: AnyObject) {
        speed = Double(speedSlider.value)
    }
    
    @IBAction func pushedAboutMe(_ sender: AnyObject) {
        meImage.isHidden = !meImage.isHidden
        githubButton.isHidden = !githubButton.isHidden
        linkedinButton.isHidden = !linkedinButton.isHidden
        hideLabel.isHidden = !hideLabel.isHidden
        speedSlider.isHidden = !speedSlider.isHidden
        fasterLabel.isHidden = !fasterLabel.isHidden
        slowerLabel.isHidden = !slowerLabel.isHidden
        self.rotateView()
    }
    
    @IBAction func pushedGithub(_ sender: AnyObject) {
        UIApplication.shared.open(URL(string: "https://github.com/jayala-29/")!)
    }
    
    @IBAction func pushedLinkedin(_ sender: AnyObject) {
        UIApplication.shared.open(URL(string: "https://www.linkedin.com/in/jessy-ayala/")!)
    }
    
}
