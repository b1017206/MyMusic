//
//  ViewController.swift
//  MyMusic
//
//  Created by 松尾龍磨 on 2019/08/09.
//  Copyright © 2019 松尾龍磨. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

//    シンバルの音源ファイル指定
    let cymbalPath=Bundle.main.bundleURL.appendingPathComponent("cymbal.mp3")
    
//    シンバル用のプレイヤーインスタンスを作成
    var cymbalPlayer=AVAudioPlayer()

    @IBAction func cymbal(_ sender: Any) {
        do{
//            シンバル用のプレイヤーに、音源ファイル名を指定
            cymbalPlayer = try AVAudioPlayer(contentsOf: cymbalPath, fileTypeHint: nil)
            
//            シンバルの音源再生
            cymbalPlayer.play()
        }catch{
            print("シンバルで、エラーが発生しました！")
        }
    }
    
    //    ギターの音源ファイル指定
    let guitarPath=Bundle.main.bundleURL.appendingPathComponent("guitar.mp3")
    
    //    ギター用のプレイヤーインスタンスを作成
    var guitarPlayer=AVAudioPlayer()
    
    @IBAction func guitar(_ sender: Any) {
        do{
            //            ギター用のプレイヤーに、音源ファイル名を指定
            guitarPlayer = try AVAudioPlayer(contentsOf: guitarPath, fileTypeHint: nil)
            
            //            ギターの音源再生
            guitarPlayer.play()
        }catch{
            print("ギターで、エラーが発生しました！")
        }
    }
//    バックミュージックの音源ファイル指定
    let backmusicPath = Bundle.main.bundleURL.appendingPathComponent("backmusic.mp3")
    
//    バックミュージック用のプレイヤインスタンスを作成
    var backmusicPlayer = AVAudioPlayer()
    
    @IBAction func play(_ sender: Any) {
        do{
//            バックミュージック用のプレイヤーに、音源ファイル名指定
            backmusicPlayer = try AVAudioPlayer(contentsOf: backmusicPath, fileTypeHint: nil)
//            リピート設定
            backmusicPlayer.numberOfLoops = -1
            backmusicPlayer.play()
        }catch{
            print("エラーが発生しました！")
        }
    }
//    stopボタンがタップした時の処理
    @IBAction func stop(_ sender: Any) {
//バックミュージック停止
        backmusicPlayer.stop()
    }
    
//    共有のプレイヤー再生処理
    fileprivate func soundPlayer(player:inout AVAudioPlayer , path:URL , count:Int){
        do{
            player = try AVAudioPlayer(contentsOf: path, fileTypeHint: nil)
            player.numberOfLoops = count
            player.play()
        } catch{
            print("エラーが発生しました！")
        }
    }
}

