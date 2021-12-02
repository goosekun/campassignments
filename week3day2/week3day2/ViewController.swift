//
//  ViewController.swift
//  week3day2
//
//  Created by Field Employee on 11/30/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    var breweries = [Brewery]()
    
    override func viewDidLoad() {
        setupDelegates()
        fetchData()
        super.viewDidLoad()
        
    }

    func setupDelegates() {
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    func fetchData() {
        URLSession.shared.getRequest(url: APIEndpoint.brewery, decoding: [Brewery].self) { result in
            switch result {
            case .success(let brewery):
                self.breweries = brewery
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                }
            
            case .failure(let error):
                print(error)
            
            }
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return breweries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = breweries[indexPath.row].name
        cell?.detailTextLabel?.text = "\(breweries[indexPath.row].city!), \(breweries[indexPath.row].state ?? "USA")"
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let detailScreen = DetailViewController()
//        detailScreen.myBrewery = breweries[indexPath.row]
//        print("My Brewery: \(detailScreen.myBrewery)")
        self.performSegue(withIdentifier: "toDetail", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? DetailViewController, let indexPath = tableview.indexPathForSelectedRow {
            controller.myBrewery = breweries[indexPath.row]
           }
    }
    
}
