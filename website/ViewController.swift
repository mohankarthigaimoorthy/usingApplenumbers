//
//  ViewController.swift
//  website
//
//  Created by Mohan K on 21/11/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var addNewCell: UIButton!
    
    @IBOutlet weak var host: UITableView!
    
    @IBOutlet weak var myCell: UITextField!
    
    
    var model: [String] = [
        "Hello world",
        "Hello world1",
        "Hello world2",
        "Hello world3",
        "Hello world4",
        "Hello world5",
        "Hello world6",
        "Hello world7",
        "Hello world8",
        "Hello world9"
    ]
    
    var modelText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        host.delegate = self
        host.dataSource = self
        host.register(UINib(nibName: "AppTableViewCell", bundle: nil), forCellReuseIdentifier: "contest")
        host.rowHeight = 100
    }
    
    @IBAction func didClickToAdd(_ sender: UIButton) {
        guard let data =  myCell.text
        else{
            return
            
        }
        model.append(data)
        host.reloadData()
        myCell.text = ""
    
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contest", for: indexPath) as! AppTableViewCell
    
        cell.dell.text = model[indexPath.row]
        
        
        
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let modelSelected = model[indexPath.row]
        
        
        let dialogMessage = UIAlertController(title: "Edit Operation", message: "Edit and NAME The Operation ",preferredStyle: .alert)
        let update = UIAlertAction(title: "Update", style: .default) {(action) in
            
            guard  let updatedModel = self.modelText.text else {return}
            
            self.model[indexPath.row] = updatedModel
            
            DispatchQueue.main.async {
                self.host.reloadData()

                print("Data has Been Updated")
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            print("Edit operation cancelled by user")
        }
        
    
        dialogMessage.addAction(update)
        
        dialogMessage.addAction(cancel)
        dialogMessage.addTextField { (textfield) in
            let data = self.model[indexPath.row]
            
            self.modelText = textfield
            self.modelText.placeholder = "Update name here"
            self.modelText.text = modelSelected


        }
        
        self.present(dialogMessage,animated: true,completion: nil)
        
    }
    

    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            model.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
   
    
}
