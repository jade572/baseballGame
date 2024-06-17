//
//  main.swift
//  baseballGame
//
//  Created by 이진규 on 6/17/24.
//

import Foundation

import Foundation

class BaseballGame {
    func start() {
        let answer = makeAnswer()
        playGame(answer: answer)
    }
    
    func makeAnswer() -> [Int] {
        var numbers = [Int]()
        while numbers.count < 3 {
            let randomNumber = Int(arc4random_uniform(9)) + 1
            if !numbers.contains(randomNumber) {
                numbers.append(randomNumber)
            }
        }
        return numbers
    }
    
    func getUserInput() -> [Int]? {
        if let input = readLine() {
            let inputArray = input.compactMap { Int(String($0)) }
            if inputArray.count == 3 && Set(inputArray).count == 3 {
                return inputArray
            }
        }
        return nil
    }
    
    func calculateStrikesAndBalls(answer: [Int], userInput: [Int]) -> (strikes: Int, balls: Int) {
        var strikes = 0
        var balls = 0

        for i in 0..<3 {
            if answer[i] == userInput[i] {
                strikes += 1
            } else if answer.contains(userInput[i]) {
                balls += 1
            }
        }
        
        return (strikes, balls)
    }
    
    func playGame(answer: [Int]) {
        print("야구 게임을 시작합니다! 1에서 9까지의 서로 다른 숫자 3개를 입력하세요.")

        while true {
            guard let userInput = getUserInput() else {
                print("잘못된 입력입니다. 1에서 9까지의 서로 다른 숫자 3개를 입력하세요.")
                continue
            }

            let result = calculateStrikesAndBalls(answer: answer, userInput: userInput)
            print("스트라이크: \(result.strikes), 볼: \(result.balls)")

            if result.strikes == 3 {
                print("축하합니다! 숫자를 모두 맞췄습니다!")
                break
            }
        }
    }
}


