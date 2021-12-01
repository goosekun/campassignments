//
//  ViewController.swift
//  Week3Day3
//
//  Created by Kenneth Redillas on 12/1/21.


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    var movies = [Movie]()
    
    
    override func viewDidLoad() {
        setupTableView()
        super.viewDidLoad()
    }

    func setupTableView() {
        fetchJson {
            self.tableview.reloadData()
        }
        tableview.delegate = self
        tableview.dataSource = self
       
    }
    
    /*
     Two types of closures: escaping and non escaping
     A closure is said to escape a function when the closure is passed as an argument to the function, but is called after the function returns. Escaping closures outlive the function it was passed into.
     READING: https://www.appypie.com/escaping-closures-swift DONE!!!
              https://betterprogramming.pub/escaping-and-non-escaping-closures-in-swift-fe2866309599 DONE!!!
     */
    func fetchJson(completed: @escaping () -> ()) {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=beeded903c11a1712a480807d1de2d8d&language=en-US&page=1") else { return }
        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, response, error in
            guard error == nil else {
                print("ERROR NIL")
                print("Error: \(error?.localizedDescription ?? "Something went wrong")")
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("server error!")
                return
            }
            
            guard data != nil else {
                print("Error: We have no data")
                return
            }
            
            do {
                // instead of first serializing the json with JSONSerialization class or associated functions we can instead let the instance of our array of heroes hold the decoded data directly
                let jsonData = try JSONDecoder().decode(Root.self, from: data!)
                self.movies = jsonData.results
                print(String(describing: error)) // 
                DispatchQueue.main.async {
                    //here we call the closure to indicate this is where the results of the fetch should be used
                    completed()
                }
            } catch {
                print("ITSSSSSS HEEEERRRREE")
                print(String(describing: error)) //
                print("Error: \(error.localizedDescription)")
            }
        }
        task.resume()
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = movies[indexPath.row].title.capitalized
        cell.detailTextLabel?.text = String(movies[indexPath.row].rating)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController {
            destination.movie = movies[(tableview.indexPathForSelectedRow?.row)!]
        }
    }
    
}
