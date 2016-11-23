//
//  ViewController.swift
//  MisRecetas
//
//  Created by Erick Alberto Garcia Marquez on 21/11/16.
//  Copyright © 2016 erickgm. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var recipes = [Recipe]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        
        var recipe = Recipe(name: "Tortilla de Papa",
                            image: #imageLiteral(resourceName: "tortilla"),
                            time: 20,
                            ingredients: ["Papas", "Huevos", "Cebolla"],
                            steps: ["Pelarla las papas y la cebolla", "Cortar las papas y la cebolla y sofreir","Batir los huevos y echarlos a la sarten durante 1 minuto con el resto"])
        recipes.append(recipe)
        
        recipe = Recipe(    name: "Pizza margarita",
                            image: #imageLiteral(resourceName: "pizza"),
                            time: 60,
                            ingredients: ["Harina", "Levadura", "Aceite","Salsa de Tomate", "Queso"],
                            steps: ["Hacemos la masa con harina, levadura, aceite y sal", "Dejamos reposar la masa 30 minutos","Extendemos la masa encima de la bandeja y añadimos el resto de ingredientes","Hornear duerante 12 minutos"])
        recipes.append(recipe)
        
        recipe = Recipe(    name: "Hamburguesa con queso",
                            image: #imageLiteral(resourceName: "hamburguesa"),
                            time: 10,
                            ingredients: ["Pan de Hamburguesa", "Lechuga", "Queso","Carne de Hamburguesa"],
                            steps: ["Poner al fuego la carne al gusto", "Montar la amburguesa con sus ingredientes entre los panes"])
        recipes.append(recipe)
        
        recipe = Recipe(    name: "Ensalada César",
                            image: #imageLiteral(resourceName: "ensalada"),
                            time: 15,
                            ingredients: ["Lechuga", "Tomate", "Cebolla","Pimiento","Salsa César", "Pollo"],
                            steps: ["Limpiar todas las verduar y trocearlas", "Cocer el pollo algusto","Juntar todos los ingredientes en una ensaladera y servir con salsa César por encima"])
        recipes.append(recipe)
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = recipes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellRecipe", for: indexPath) as! RecipeCell
        
        cell.thumbnailImageView.image = recipe.image
        cell.nameLabel.text = recipe.name
        cell.timeLabel.text = "\(recipe.time!) min"
        cell.ingredientsLabel.text = "Ingredientes \(recipe.ingredients.count)"
        
       /* if recipe.isFavourite {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
 */
        //cell.thumbnailImageView.layer.cornerRadius = 42.0
        //cell.thumbnailImageView.clipsToBounds = true
        return cell
        
    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*
        let recipe = self.recipes[indexPath.row]
        
        let alertController = UIAlertController(title: recipe.name, message: "Valora este plato", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        var favouriteActionTitle = "Favorito"
        var favouriteActionStyle = UIAlertActionStyle.default
        
        if recipe.isFavourite {
         favouriteActionTitle = "No favorito"
         favouriteActionStyle = UIAlertActionStyle.destructive
        }
        
        let favouriteAction = UIAlertAction(title: favouriteActionTitle, style: favouriteActionStyle, handler: {(accion) in
        
            
            recipe.isFavourite = !recipe.isFavourite
            self.tableView.reloadData()
        } )
        
        alertController.addAction(favouriteAction)
        
        self.present(alertController, animated: true, completion: nil)
        */
        
        
        
    }

    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.recipes.remove(at: indexPath.row)
        }
        self.tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        //Compartir
        let shareAction = UITableViewRowAction(style: .default, title: "Compartir", handler: {(action, indexPath) in
            let shareDefaultText = "Estoy mirando la receta de \(self.recipes[indexPath.row].name!)"
            let activityController = UIActivityViewController(activityItems: [shareDefaultText, self.recipes[indexPath.row].image!], applicationActivities: nil)
            
            self.present(activityController, animated: true, completion: nil)
        })
        
        shareAction.backgroundColor = UIColor.blue
        
        //Borrar
        
        let deleteAction = UITableViewRowAction(style: .default, title: "Borrar", handler: {(action , indexPath) in
            self.recipes.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        })
        
        
        
        return [shareAction, deleteAction]
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRecipeDetail" {
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let selectedRecipe = self.recipes[indexPath.row]
                let destinationViewController = segue.destination as! DetailViewController
                destinationViewController.recipe = selectedRecipe
            }
            
        }
    }
    
}


