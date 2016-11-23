//
//  DetailViewController.swift
//  MisRecetas
//
//  Created by Erick Alberto Garcia Marquez on 21/11/16.
//  Copyright © 2016 erickgm. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var recipeImageView: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    var recipe : Recipe!
    @IBOutlet weak var ratingButtom: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = recipe.name!
        
        recipeImageView.image = recipe.image
        self.tableView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.25)
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.tableView.separatorColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.75)
        // Do any additional setup after loading the view.
        
        self.tableView.estimatedRowHeight = 45
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        let image = UIImage(named: self.recipe.rating)
        self.ratingButtom.setImage(image, for: .normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
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

extension DetailViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1 :
            return self.recipe.ingredients.count
        case 2:
            return self.recipe.steps.count
        default:
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipeDetailCell", for: indexPath) as! RecipeDetailViewCell
        
        cell.backgroundColor = UIColor.clear
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0 :
                cell.keyLabel.text = "Nombre: "
                cell.valueLabel.text = self.recipe.name!
            case 1 :
                cell.keyLabel.text = "Tiempo:"
                cell.valueLabel.text = "\(self.recipe.time!) min"
           /* case 2 :
                cell.keyLabel.text = "Favorita "
                if self.recipe.isFavourite {
                    cell.valueLabel.text = "Si"
                } else {
                    cell.valueLabel.text = "No"
                }*/
            default :
                break
            }
            
        case 1:
            if indexPath.row == 0 {
                cell.keyLabel.text = "Ingredientes"
            } else {
                cell.keyLabel.text = ""
            }
            cell.valueLabel.text = self.recipe.ingredients[indexPath.row]
        case 2:
            if indexPath.row == 0 {
                cell.keyLabel.text = "Pasos"
            } else {
                cell.keyLabel.text = ""
            }
            cell.valueLabel.text = self.recipe.steps[indexPath.row]
        default:
            break
        }
        

        
     return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title = ""
        
        switch section {
        case 1:
            title = "Ingredientes"
        case 2:
            title = "Pasos"
        default:
            break
        }
        return title
    }
    
    @IBAction func close(segue: UIStoryboardSegue) {
     
        if let reviewVC = segue.source  as? ReviewViewController {
            if let rating = reviewVC.ratingSelected {
                self.recipe.rating = rating
                let image = UIImage(named: self.recipe.rating)
                self.ratingButtom.setImage(image, for: .normal)
                //print(rating)
            }
        }
        
    }
}

extension DetailViewController : UITableViewDelegate {
    
}
