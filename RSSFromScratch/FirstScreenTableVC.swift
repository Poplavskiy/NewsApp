//
//  FirstScreenTableVC.swift
//  RSSFromScratch
//
//  Created by vlad on 2/27/17.
//  Copyright © 2017 Developer. All rights reserved.
//

import UIKit

class FirstScreenTableVC: UITableViewController {
    var groupNames = ["MTV News","ABC News","BBC News","BBC Sport", "Bild", "Bloomberg","Business Insider UK","Buzzfeed","CNBC","Daily-Mail","Die-Zeit","Engadget","Focus","Fox Sports"]
    var urls = ["https://newsapi.org/v1/articles?source=mtv-news&sortBy=top&apiKey=0ceab341623a4da79719490634ff4cbc",
                "https://newsapi.org/v1/articles?source=abc-news-au&sortBy=top&apiKey=0ceab341623a4da79719490634ff4cbc",
                "https://newsapi.org/v1/articles?source=bbc-news&sortBy=top&apiKey=0ceab341623a4da79719490634ff4cbc",
                "https://newsapi.org/v1/articles?source=bbc-sport&sortBy=top&apiKey=0ceab341623a4da79719490634ff4cbc",
                "https://newsapi.org/v1/articles?source=bild&sortBy=top&apiKey=0ceab341623a4da79719490634ff4cbc",
                "https://newsapi.org/v1/articles?source=bloomberg&sortBy=top&apiKey=0ceab341623a4da79719490634ff4cbc",
                "https://newsapi.org/v1/articles?source=business-insider-uk&sortBy=top&apiKey=0ceab341623a4da79719490634ff4cbc",
                "https://newsapi.org/v1/articles?source=buzzfeed&sortBy=top&apiKey=0ceab341623a4da79719490634ff4cbc",
                "https://newsapi.org/v1/articles?source=cnbc&sortBy=top&apiKey=0ceab341623a4da79719490634ff4cbc",
                "https://newsapi.org/v1/articles?source=daily-mail&sortBy=top&apiKey=0ceab341623a4da79719490634ff4cbc",
                "https://newsapi.org/v1/articles?source=die-zeit&sortBy=top&apiKey=0ceab341623a4da79719490634ff4cbc",
                "https://newsapi.org/v1/articles?source=engadget&sortBy=top&apiKey=0ceab341623a4da79719490634ff4cbc",
                "https://newsapi.org/v1/articles?source=focus&sortBy=top&apiKey=0ceab341623a4da79719490634ff4cbc",
                "https://newsapi.org/v1/articles?source=fox-sports&sortBy=top&apiKey=0ceab341623a4da79719490634ff4cbc"
                ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return urls.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell

        
        cell.textLabel?.text = groupNames[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "listNews") as! TableViewController
        vc.url = urls[indexPath.row]
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


