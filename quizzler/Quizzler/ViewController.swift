

import UIKit

class ViewController: UIViewController {
    
    let ques=QuestionBank()
    var choice:Bool=true
    var questionNumber:Int=0
    var score:Int=0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var hgh: UIImageView!
    
    @IBOutlet weak var start: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        nextQuestion()
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        hgh.isHidden=true
        start.isHidden=true
    }
    
    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag==1
        {
            choice=true
        }
        else if sender.tag==2
        {
            choice=false
        }
        checkAnswer()
           questionNumber=questionNumber+1
           nextQuestion()
    }
    
    
    func updateUI() {
        scoreLabel.text="Score:\(score)"
        progressLabel.text="\(questionNumber+1)/13"
        progressBar.frame.size.width=(view.frame.size.width/13)*CGFloat(questionNumber+1)
        
    }

    func nextQuestion() {
        if questionNumber<=12
        {
            questionLabel.text=ques.list[questionNumber].quesText
            updateUI()
        }
        else
        {
           let alert=UIAlertController(title:"Great", message: "Do you wish to startover", preferredStyle:.alert)
            let restart=UIAlertAction(title:"Restart", style:.default, handler: { (UIAlertAction) in
                self.startOver();
            })
            alert.addAction(restart)
            present(alert, animated: true, completion: nil)
            
        }
        
    }
    
    
    func checkAnswer() {
        let answer=ques.list[questionNumber].val
        if answer==choice
        {
            ProgressHUD.showSuccess("Correct answer!!")
            score=score+1
        }
        else
        {
            ProgressHUD.showError("Wrong Answer!!")
            print("incorrect")
        }
        
    }
    
    
    func startOver() {
       questionNumber=0
        score=0
        nextQuestion()
    }
    

    
}
