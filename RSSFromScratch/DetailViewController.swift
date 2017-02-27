//
//  DetailViewController.swift
//  RSSFromScratch
//
//  Created by vlad on 26/02/17.
//  Copyright © 2017 vlad. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var image:String?
    var article:String?
    @IBOutlet weak var detailArticle: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.detailArticle.loadRequest(URLRequest(url: URL(string: self.article!)!))
        
        self.view.reloadInputViews()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        
    }
    override func viewWillAppear(_ animated: Bool) {
load()
    }

   private func load(){
        
        DispatchQueue.global(qos: DispatchQoS.QoSClass.background).async
            {
                guard let urlRequest = URLRequest(url: URL(string: self.image!)!) as URLRequest? else{
                    print("An URL of the image is empty")
                    return
                }
                let task = URLSession.shared.dataTask(with: urlRequest){(data, response, error) in
                    if error != nil{print(error ?? "Can't download an image ! Look to the extension written for UIImageView in TableViewController.swift file!")
                        return
                    }

                }
                task.resume()
        }
        
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
