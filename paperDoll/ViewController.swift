//
//  ViewController.swift
//  paperDoll
//
//  Created by 陳秉軒 on 2022/3/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var showHeadImage: UIImageView!
    @IBOutlet weak var showBodyImage: UIImageView!
    @IBOutlet weak var showFaceImage: UIImageView!
    @IBOutlet weak var showGlassesImage: UIImageView!
    @IBOutlet weak var showBeardImage: UIImageView!
    @IBOutlet weak var backGroundImage: UIImageView!
    
    @IBOutlet weak var pageOutlet: UIPageControl!
    
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var headView: UIView!
    @IBOutlet weak var faceView: UIView!
    @IBOutlet weak var beardView: UIView!
    @IBOutlet weak var glassesView: UIView!
    @IBOutlet weak var colorView: UIView!
   
    @IBOutlet weak var RgbColorView: UIView!
    @IBOutlet weak var RgbColorView2: UIView!
    
    @IBOutlet weak var redslider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    
    @IBOutlet weak var redSlider2: UISlider!
    @IBOutlet weak var greenSlider2: UISlider!
    @IBOutlet weak var blueSlider2: UISlider!
    @IBOutlet weak var alphaSlider2: UISlider!
    
    let gradientLayer = CAGradientLayer()
    let backGround = ["game1","game2","game3"]
    var red1: Float = 0
    var green1: Float = 0
    var blue1: Float = 0
    var alpha1: Float = 0
    var red2: Float = 0
    var green2: Float = 0
    var blue2 : Float = 0
    var alpha2: Float = 0
    var color1 = UIColor()
    var color2 = UIColor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        RgbColorView.layer.cornerRadius = 30
        RgbColorView2.layer.cornerRadius = 30
        
    }
    //
    @IBAction func showAllButton(_ sender: UIButton) {
        switch sender.tag{
        case 0 :
            bodyView.isHidden = false
            headView.isHidden = true
            faceView.isHidden = true
            beardView.isHidden = true
            glassesView.isHidden = true
            colorView.isHidden = true
        case 1 :
            bodyView.isHidden = true
            headView.isHidden = false
            faceView.isHidden = true
            beardView.isHidden = true
            glassesView.isHidden = true
            colorView.isHidden = true
        case 2 :
            bodyView.isHidden = true
            headView.isHidden = true
            faceView.isHidden = false
            beardView.isHidden = true
            glassesView.isHidden = true
            colorView.isHidden = true
        case 3 :
            bodyView.isHidden = true
            headView.isHidden = true
            faceView.isHidden = true
            beardView.isHidden = false
            glassesView.isHidden = true
            colorView.isHidden = true
        case 4 :
            bodyView.isHidden = true
            headView.isHidden = true
            faceView.isHidden = true
            beardView.isHidden = true
            glassesView.isHidden = false
            colorView.isHidden = true
        case 5 :
            bodyView.isHidden = true
            headView.isHidden = true
            faceView.isHidden = true
            beardView.isHidden = true
            glassesView.isHidden = true
            colorView.isHidden = false
        default:
            break
        }
    }
    //點選圖片更改人物設定
    @IBAction func glassButton(_ sender: UIButton) {
        showGlassesImage.image = sender.currentBackgroundImage
    }
    @IBAction func beardButton(_ sender: UIButton) {
        showBeardImage.image = sender.currentBackgroundImage
    }
    @IBAction func faceButton(_ sender: UIButton) {
        showFaceImage.image = sender.currentBackgroundImage
    }
    @IBAction func headButton(_ sender: UIButton) {
        showHeadImage.image = sender.currentBackgroundImage
    }
    @IBAction func bodyButton(_ sender: UIButton) {
        showBodyImage.image = sender.currentBackgroundImage
    }
    //眼鏡、鬍子不選設定
    @IBAction func nilButton(_ sender: UIButton) {
        if sender.tag == 0{
            showBeardImage.image = nil
        }else{
            showGlassesImage.image = nil
        }
    }
    //自行更改背景顏色
    @IBAction func changeBgColor(_ sender: UISlider) {
        color1 = UIColor(red: CGFloat(redslider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
        color2 = UIColor(red: CGFloat(redSlider2.value), green: CGFloat(greenSlider2.value), blue: CGFloat(blueSlider2.value), alpha: CGFloat(alphaSlider2.value))
        gradientLayer.frame = view.frame
        gradientLayer.colors = [color1.cgColor,color2.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        view.layer.insertSublayer(gradientLayer, at: 0)
        RgbColorView.backgroundColor = color1
        RgbColorView2.backgroundColor = color2
    }
    //點選page改背景
    @IBAction func pageButton(_ sender: UIPageControl) {
        if pageOutlet.currentPage == 0 {
            backGroundImage.image = UIImage(named: backGround[0])
        }else if pageOutlet.currentPage == 1{
            backGroundImage.image = UIImage(named: backGround[1])
        }else{
            backGroundImage.image = UIImage(named: backGround[2])
        }
    }
    //隨機角色、背景
    @IBAction func randomCharacter(_ sender: UIButton) {
        showBodyImage.image = UIImage(named: "body\(Int.random(in: 0...18))")
        showFaceImage.image = UIImage(named: "face\(Int.random(in: 0...18))")
        showGlassesImage.image = UIImage(named: "Glasses\(Int.random(in: 0...8))")
        showHeadImage.image = UIImage(named: "head\(Int.random(in: 0...18))")
        showBeardImage.image = UIImage(named: "beard\(Int.random(in: 0...18))")
        backGroundImage.image = UIImage(named: "game\(Int.random(in: 0...3))")
    }
    //隨機背景顏色
    @IBAction func randomColorbutton(_ sender: UIButton) {
        red1 = Float.random(in: 1...255)/255
        green1 = Float.random(in: 1...255)/255
        blue1 = Float.random(in: 1...255)/255
        alpha1 = Float.random(in: 1...255)/255
        red2 = Float.random(in: 1...255)/255
        green2 = Float.random(in: 1...255)/255
        blue2 = Float.random(in: 1...255)/255
        alpha2 = Float.random(in: 1...255)/255
        color1 = UIColor(red: CGFloat(red1), green: CGFloat(green1), blue: CGFloat(blue1), alpha: CGFloat(alpha1))
        color2 = UIColor(red: CGFloat(red2), green: CGFloat(green2), blue: CGFloat(blue2), alpha: CGFloat(alpha2))
        gradientLayer.frame = view.frame
        gradientLayer.colors = [color1.cgColor,color2.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        view.layer.insertSublayer(gradientLayer, at: 0)
        RgbColorView.backgroundColor = color1
        RgbColorView2.backgroundColor = color2
        redslider.value = red1
        greenSlider.value = green1
        blueSlider.value = blue1
        alphaSlider.value = alpha1
        redSlider2.value = red2
        greenSlider2.value = green2
        blueSlider2.value = blue2
        alphaSlider2.value = alpha2
    }
    //clear背景顏色
    @IBAction func clearColorButton(_ sender: UIButton) {
        RgbColorView.backgroundColor = .white
        RgbColorView2.backgroundColor = .white
        gradientLayer.removeFromSuperlayer()
        redslider.value = 1
        greenSlider.value = 1
        blueSlider.value = 1
        alphaSlider.value = 1
        redSlider2.value = 1
        greenSlider2.value = 1
        blueSlider2.value = 1
        alphaSlider2.value = 1
    }
    
    
    
    
}

