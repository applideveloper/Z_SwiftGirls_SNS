//
//  ComposeViewController.swift
//  SwifferApp
//
//  Created by 荒木 敦 on 2015/01/05.
//  Copyright (c) 2015年 Training. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController, UITextViewDelegate {


    
    @IBOutlet weak var sweetTextView: UITextView!
    @IBOutlet weak var charRemaining: UILabel!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sweetTextView.layer.borderColor = UIColor.blackColor().CGColor
        sweetTextView.layer.borderWidth = 0.5
        sweetTextView.layer.cornerRadius = 5
        sweetTextView.delegate = self
        
        sweetTextView.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func sendSweet(sender: AnyObject) {
        // Tweetを保存するための変数宣言
        var sweet:PFObject = PFObject(className: "Sweets")
        sweet["content"] = sweetTextView.text // Tweet内容を取得
        sweet["sweeter"] = PFUser.currentUser() // 現在のユーザーの取得
        // NSLog("%@", sweetTextView.text)
        // NSLog("%@", PFUser.currentUser())
        
        sweet.saveInBackground() // Tweetの情報を保存する
        self.navigationController?.popToRootViewControllerAnimated(true)
        // 保存が終わったらトップ画面へ自動的に戻る
    }
    
    func textView(textView: UITextView!,
        shouldChangeTextInRange range: NSRange,
        replacementText text: String!) -> Bool{
            
            var newLength:Int = (textView.text as NSString).length + (text as NSString).length - range.length
            var remainingChar:Int = 140 - newLength
            
            charRemaining.text = "\(remainingChar)"
            
            return (newLength > 140) ? false : true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
