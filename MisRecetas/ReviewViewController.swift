//
//  ReviewViewController.swift
//  MisRecetas
//
//  Created by Erick Alberto Garcia Marquez on 22/11/16.
//  Copyright © 2016 erickgm. All rights reserved.
// Prueba de repositorio locar de xcode

import UIKit

class ReviewViewController: UIViewController {

    @IBOutlet weak var ratingStakView: UIStackView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    
    
    var ratingSelected : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        
        backgroundImageView.addSubview(blurEffectView)
        
        let scale = CGAffineTransform(scaleX: 0.0, y: 0.0)
        let translation = CGAffineTransform(translationX: 0.0, y: 500.0)
        
        //ratingStakView.transform = scale.concatenating(translation)
        firstButton.transform = scale.concatenating(translation)
        secondButton.transform = scale.concatenating(translation)
        thirdButton.transform = scale.concatenating(translation)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
       /* UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: {
            self.ratingStakView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)
        */
        
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
            //self.ratingStakView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            self.firstButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: { (success) in
            
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
                //self.ratingStakView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                self.secondButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }, completion: { (success) in
                UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
                    //self.ratingStakView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                    self.thirdButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                }, completion: nil)
            })
        })
        
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func ratingPressed(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            ratingSelected = "dislike"
        case 2:
            ratingSelected =  "good"
        case 3:
            ratingSelected = "great"
        default:
            break
        }
        
        performSegue(withIdentifier: "unwindToDetailView", sender: sender)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
