//
//  TableViewController.swift
//  RSSFromScratch
//
//  Created by vlad on 26/02/17.
//  Copyright © 2017 vlad. All rights reserved.
//

import UIKit
class TableViewController: UITableViewController{
    var numberOfRows: Int?
    var art: DataModel?
    var url: String = ""
   fileprivate  var arrayOfData: [DataModel]?
    var currentRow:Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    func load(){
        
        
        
        DispatchQueue.global(qos: DispatchQoS.QoSClass.background).async
        {let url = URL(string: self.url)
            let task = URLSession.shared.dataTask(with: url!)
            { (data, response, error) in
                if error != nil
                {
                    print(error!.localizedDescription)
                }
                else {
                    if let content = data {
                        self.arrayOfData = [DataModel]()
                        do {
                            let jsonDict = try JSONSerialization.jsonObject(with: content, options: .mutableContainers) as! [String : AnyObject]
                            if let allArticles = jsonDict["articles"] as! [NSDictionary]?{
                            for some  in allArticles {
                                let someTitle:String
                                let someDescription:String
                                let someDate:String
                                var someImage:String
                                var someUrl:String
                                if let jsonTitle = some.value(forKey: "title") as? String{
                                    someTitle = jsonTitle
                                }else{
                                    someTitle = ""
                                }
                                if let jsonDescription = some.value(forKey: "description") as? String{someDescription = jsonDescription} else{someDescription = "There is no description at this moment"}
                                if let jsonDate = some.value(forKey: "publishedAt") as? String{
                                    someDate = jsonDate} else{someDate = "01.01.2017"}
                                if let jsonUrl = some.value(forKey: "url") as? String{
                                    someUrl = jsonUrl} else{someUrl = "There is no article at this moment!"}
                                if let jsonImage = some.value(forKey: "urlToImage") as? String{someImage = jsonImage} else{someImage = "https://www.google.com.ua/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=0ahUKEwjFj5T4wIXRAhXEkiwKHZ4xB8IQjRwIBw&url=http%3A%2F%2Fwww.freeiconspng.com%2Ffree-images%2Fno-image-icon-23502&psig=AFQjCNGDHGKpSzND8wx3O0i7vWvkJ9FrZQ&ust=1482417303948638"}
                                let modelValue = DataModel(titleArg: someTitle, descriptionArg: someDescription, dateArg: someDate, imageURLArg: someImage, articleURLArg: someUrl)
                                self.arrayOfData?.append(modelValue)
                                }
                            }
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                        }
                        catch let error{print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        load()
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
        
        return self.arrayOfData?.count ?? 0
    }

        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
            if let titleValue = self.arrayOfData?[indexPath.item]{
                guard let title = titleValue.title, let descr = titleValue.description, let imageURLString = titleValue.imageURL else {
                    cell.myTitle.text = "Title"
                    cell.myDescription.text = "There is no description by current URL"
                    cell.myImage.downloadImage(from: "http://www.freeiconspng.com/uploads/no-image-icon-10.png")
                    return cell
                }
                cell.myTitle.text = title
                cell.myDescription.text = descr
                cell.myImage.downloadImage(from: imageURLString)
                cell.myImage.layer.cornerRadius = cell.myImage.frame.size.height/2
                
            }
        return cell
            
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            art = arrayOfData?[indexPath.row]
            let vc = storyboard?.instantiateViewController(withIdentifier: "detail") as! DetailViewController
        vc.article = art?.articleURL
        vc.image = art?.imageURL
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
 */

extension UIImageView {
    func downloadImage(from url:String) -> Void {
        let urlRequest = URLRequest(url: URL(string: url)!)
        let task = URLSession.shared.dataTask(with: urlRequest){(data, response, error) in
            if error != nil{print(error ?? "Can't download an image ! Look to the extension written for UIImageView in TableViewController.swift file!")
                return
            }
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
                
            }
        }
        task.resume()
        
    }
}

