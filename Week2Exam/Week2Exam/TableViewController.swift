//
//  TableViewController.swift
//  Week2Exam
//
//  Created by Field Employee on 11/24/21.
//

import UIKit

class TableViewController: UITableViewController {

    var myList = [Album(artist: "LCD Soundsystem", title: "This Is Happening", description: "Before their “retirement,” LCD went out in a blaze of hungover glory on this set of squelchy analog synthesizer jams, a sort of elegy for clubbing sluts and road-dog musicians who feel it’s time to maybe find another outlet.", image: Images.lcd),
                 Album(artist: "Pistol Annies", title: "Interstate Gospel", description: "The country supergroup of the decade (if not century) tossed aside their ex-husband, house-burning fantasies in favor of somber midlife introspection on this rootsy ode to prenups and Percocet", image: Images.pistol),
                 Album(artist: "Adele", title: "21", description: "Reviewing her debut LP, 19, this magazine praised Adele Adkins for her astonishing voice and hoped her storytelling would one day be as interesting as her phrasing.", image: Images.adele),
                 Album(artist: "Lorde", title: "Melodrama", description: "With her debut, Pure Heroine, Lorde became revered for her honest, mature reflections on being a 21st-century teen.", image: Images.lorde),
                 Album(artist: "Drake", title: "Take Care", description: "Drake has never been more magnetically, confoundingly Drake than he was on this primal sigh of a second official album", image: Images.drake),
                 Album(artist: "David Bowie", title: "Blackstar", description: "David Bowie spent his whole career as rock’s cracked actor — but he saved one of his most stunning performances for the final curtain", image: Images.bowie),
                 Album(artist: "Taylor Swift", title: "Red", description: "You knew she was trouble when she walked in", image: Images.taylor),
                 Album(artist: "Kendrick Lamar", title: "To Pimp a Butterfly", description: "To Pimp a Butterfly is the LP that defined hip-hop’s state of the art in the 2010s", image: Images.kendrick),
                 Album(artist: "Beyoncé", title: "Lemonade", description: "Lemonade was the only place in pop where co-writers Father John Misty and Kendrick Lamar felt equally at home", image: Images.beyonce),
                 Album(artist: "Kanye West", title: "My Beautiful Dark Twisted Fantasy", description: "This is a concept album about his own inability to stop breaking America’s heart", image: Images.kanye)
    ].sorted(by: {$0.artist < $1.artist})
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        // Do any additional setup after loading the view.
        self.tableView.backgroundColor = UIColor.white
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        myList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = myList[indexPath.row].title
        cell.imageView?.image = myList[indexPath.row].image
        
        return cell
    }
        
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0;//Choose your custom row height
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
           //To InfoViewController I am considering you have created InfoViewController with XIB
//        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
//        let destination = storyboard.instantiateViewController(withIdentifier: "InfoViewController") as!
//        InfoViewController
        let controller = InfoViewController()
        controller.myObject = myList[indexPath.row]
        self.performSegue(withIdentifier: "mySegue", sender: indexPath.row)
//        self.navigationController?.pushViewController(destination, animated: true)
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let destination = segue.destination as? InfoViewController{
            let selectedRow = sender as? Int
            if myList[selectedRow!] != nil {
                destination.myObject = myList[selectedRow!]
            }
        }
    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
