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
        fetchData()
        setupDelegates()
        super.viewDidLoad()
        
    }

    func setupDelegates() {
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    func fetchData() {
        let session = URLSession.shared
        guard let url = URL(string: "https://api.openbrewerydb.org/breweries") else {
            return
        }
        let task = session.dataTask(with: url) { data, response, error in
            guard error == nil else {
                print("Error: \(error?.localizedDescription ?? "Something went wrong")")
                return
            }
            
            guard let responseData = data else {
                print("no data came back")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Error: not valid http response")
                return
            }
            
            //Response Status
            print("Response status code: \(httpResponse.statusCode)")
            print("Response status debugDescription: \(httpResponse.debugDescription)")
            print("Response status localizedString: \(HTTPURLResponse.localizedString(forStatusCode: httpResponse.statusCode))")
            
            do {
                guard let jsonData = try? JSONSerialization.jsonObject(with: responseData, options: []) else { return }
                //print(jsonData)
                guard let jsonArray = jsonData as? [Any] else { return }
                for post in jsonArray {
                    guard let postData = post as? [String:Any] else { return }
                    guard let postName = postData["name"] as? String else { return }
                    guard let postType = postData["brewery_type"] as? String else { return }
                    guard let postCity = postData["city"] as? String else { return }
                    guard let postState = postData["state"] as? String else { return }
                            
                    print(postName)
                    print(postType)
                    print(postCity)
                    print(postState)
                    //printing empty string for spacing
                    print("...")

                    self.breweries.append(Brewery(name: postName, type: postType, city: postCity, state: postState))
                }
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                }
            }
            
        }
        task.resume()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return breweries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = breweries[indexPath.row].name
        cell?.detailTextLabel?.text = "\(breweries[indexPath.row].city), \(breweries[indexPath.row].state)"
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
