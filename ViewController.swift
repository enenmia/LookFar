import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var reminderLabel: UILabel!
    var countdownTimer: Timer?
    var remainingSeconds = 10

    override func viewDidLoad() {
        super.viewDidLoad()
        startCountdown()
    }

    func startCountdown() {
        reminderLabel.text = "开始望远，持续20秒"
        remainingSeconds = 10
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCountdown), userInfo: nil, repeats: true)
    }

    @objc func updateCountdown() {
        if remainingSeconds > 0 {
            reminderLabel.text = "倒计时: \(remainingSeconds)秒"
            // 触发震动
            let feedbackGenerator = UISelectionFeedbackGenerator()
            feedbackGenerator.selectionChanged()
            remainingSeconds -= 1
        } else {
            countdownTimer?.invalidate()
            countdownTimer = nil
            reminderLabel.text = "望远结束"
        }
    }
}

