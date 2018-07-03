import UIKit


public class Login: UIView {
    public var nibName:String = "Login"
    public var view: UIView! //---**%%%%
    
     @IBOutlet weak var txtUserName: UITextField!
     @IBOutlet weak var txtPassword: UITextField!
     @IBOutlet weak var lblMessage: UILabel!
     @IBOutlet weak var btnLogin: UIButton!
    
    public var loginHandler:((_ username: String, _ password: String)
    -> Void)?
    
     @IBAction func btnLogin(_ sender: Any) {
        showSwiftMessage(msgType: .info, duration: 10, title: "hiii", body: "The world is biuty babe ... ")
        if(loginHandler == nil) {
            print("No loginHandler defined")
            return
        }
        loginHandler!(txtUserName.text!,txtPassword.text!)
    }
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    func setup() {
        //self.view = loadViewFromNib()
        self.view = UINib(nibName: nibName, bundle: Bundle(for: type(of: self))).instantiate(withOwner: self, options: nil)[0] as! UIView
        self.view.frame = bounds
        self.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(self.view)
    }
    public func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: self.nibName, bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return nibView
    }
}




