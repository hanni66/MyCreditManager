//
//  main.swift
//  MyCreditManager
//
//  Created by 김하은 on 2023/05/01.
//

import Foundation

var condition = true
var role = Role()

while condition {
    print("원하는 기능을 입력해주세요")
    print("1. 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")

    let input = readLine()!
    let checkInput = [1, 2, 3, 4, 5]

    if let inputInt = Int(input), checkInput.contains(inputInt) {
        role.division(opt: inputInt)
    } else if input == "X" {
        print("프로그램을 종료합니다...")
        condition = false
    } else {
        print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
    }
}
