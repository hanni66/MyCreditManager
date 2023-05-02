//
//  Student.swift
//  MyCreditManager
//
//  Created by 김하은 on 2023/05/01.
//

import Foundation

struct StudentInfo {
    var subject: String
    var subGrade: (String, Double)
}

class Student {
    static var studentsName : [String] = []
    static var studentArr: [(String, StudentInfo)] = []
    
    func addStudent() {
        print("추가할 학생의 이름을 입력해주세요")
        if let inputName = readLine(), !inputName.isEmpty {
            if Student.studentsName.contains(inputName) {
                print("\(inputName)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
            } else {
                Student.studentArr.append((inputName, StudentInfo(subject: "", subGrade: ("", 0.0))))
                Student.studentsName.append(inputName)
                print("\(inputName) 학생을 추가했습니다.")
                print(Student.studentsName)
            }
        } else {
            Role().checkInput()
        }
    }
    
    func deleteStudent() {
        print("삭제할 학생의 이름을 입력해주세요")
        
        if let inputName = readLine(), !inputName.isEmpty {
            if Student.studentsName.contains(inputName) {
                Student.studentsName.removeAll(where: {$0 == inputName })
                print("\(inputName) 학생을 삭제하였습니다.")
            } else {
                print("\(inputName) 학생을 찾지 못했습니다.")
            }
        } else {
            Role().checkInput()
        }
    }

}
