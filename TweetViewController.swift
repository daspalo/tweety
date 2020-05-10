//
//  TweetViewController.swift
//  Twitter
//
//  Created by Martin Palomino on 5/7/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController, UITextViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        tweetTextView.becomeFirstResponder()
        //tweetTextView.delegate = self;
        //self.tweetTextView = RSKPlaceholderTextView(frame: CGRect(x: 0, y: 20, width: self.view.frame.width, height: 100))
        //self.tweetTextView.placeholder = "What do you want to say about this event?"

        //self.view.addSubview(self.tweetTextView)

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var tweetTextView: UITextView!
    
    
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil )
    }
    
    @IBAction func tweet(_ sender: Any) {
        if(!tweetTextView.text.isEmpty){
            TwitterAPICaller.client? .postTweet(tweetString: tweetTextView.text, success: {self.dismiss(animated: true, completion: nil)
                }, failure: { (error) in
                    print("Error posting tweet \(error)")
                        self.dismiss(animated: true, completion: nil)
            })
        } else {
            self.dismiss(animated: true, completion:nil)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
