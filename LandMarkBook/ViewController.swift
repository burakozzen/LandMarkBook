//
//  ViewController.swift
//  LandMarkBook
//
//  Created by Burak ÖZEN on 12.03.2022.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var TableView: UITableView!
    var landMarkNames = [String]();
    var landMarkImages = [UIImage]();
    var choosenLandMarkName = "";
    var choosenLandMarkImage = UIImage();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        TableView.delegate = self;
        TableView.dataSource = self;
        
        landMarkNamesDoldur();
        lanMarkImagesDoldur();
        
        navigationItem.title = "LandMark Book";
         
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell();
        cell.textLabel?.text = landMarkNames[indexPath.row];
        return cell;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landMarkNames.count;
    }
    
    func landMarkNamesDoldur(){
        landMarkNames.append("metallica_1");
        landMarkNames.append("metallica_2");
    }
    
    func lanMarkImagesDoldur(){
        landMarkImages.append(UIImage(named: "metallica_1.jpeg")!);
        landMarkImages.append(UIImage(named: "metallica_2.jpeg")!);
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            landMarkNames.remove(at: indexPath.row);
            landMarkImages.remove(at: indexPath.row);
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade);
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         choosenLandMarkName = landMarkNames[indexPath.row];
         choosenLandMarkImage = landMarkImages[indexPath.row];
         performSegue(withIdentifier: "toImageViewController", sender: nil);
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toImageViewController" {
            let destinationVC = segue.destination as! imageViewController;
            destinationVC.selectedLandMarkName = choosenLandMarkName;
            destinationVC.selectedLandMarkImage = choosenLandMarkImage;
        }
    }
}

