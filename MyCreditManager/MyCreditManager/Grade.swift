//
//  Grade.swift
//  MyCreditManager
//
//  Created by 김하은 on 2023/05/02.
//

import Foundation

class Grade {
    var student = Student.self
    let gradeArr = ["A+":4.5, "A":4, "B+":3.5, "B":3, "C+":2.5, "C":2, "D+":1.5, "D":1, "F":0]

    func addGrade() {
        print("성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력예) Mickey Swift A+\n만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.")
        
        if let inputGrade = readLine(), !inputGrade.isEmpty {
            let components = inputGrade.split(separator: " ")
            let inputName = String(components[0]), inputSubject = String(components[1]), inputGrade = String(components[2])
            
            if components.count < 3 {
                Role().checkInput()
            }
            
            if student.studentsName.contains(String(components[0])) {
//                if student.studentArr.== String(components[1]) {
//                    student.studentArr.append((inputName, StudentInfo(subject: inputSubject, subGrade: (inputGrade, Double(gradeArr[inputGrade]!)))))
//                } else {
                    student.studentArr.append((inputName, StudentInfo(subject: inputSubject, subGrade: (inputGrade, Double(gradeArr[inputGrade]!)))))
//                }
                print("\(inputName) 학생의 \(inputSubject) 과목이 \(inputGrade)로 추가(변경)되었습니다.")
            } else {
                print("학생이 없습니다.")
            }
            
        } else {
            Role().checkInput()
        }
    }

    func deleteGrade() {
        print("성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력예) Mickey Swift")
        
        if let inputGrade = readLine(), !inputGrade.isEmpty {
            let components = inputGrade.split(separator: " ")

            if components.count < 1 {
                Role().checkInput()
            }
            
            if student.studentsName.contains(String(components[0])) {
                for (_, value) in Student.studentArr {
                    if value.subject == String(components[1]) {
                        student.studentArr.removeAll { $0.1.subject == String(components[1]) }
                    }
                }
                print("\(String(components[0])) 학생의 \(String(components[1])) 과목의 성적이 삭제되었습니다.")
            } else {
                print("\(String(components[0])) 학생을 찾지 못했습니다.")
            }
        } else {
            Role().checkInput()
        }
    }
    
    func studentAverageGrade() {
        var totalGrade = 0.0
        var rating = 0.0
        print("평점을 알고싶은 학생의 이름을 입력해주세요")
        
        if let inputName = readLine(), !inputName.isEmpty {
            for (key, value) in student.studentArr {
                if key == inputName {
                    if !value.subject.isEmpty {
                        print("\(value.subject): \(value.subGrade.0)")
                        totalGrade += value.subGrade.1
                    }
                }
            }
            if !student.studentsName.contains(inputName) {
                print("\(inputName) 학생을 찾지 못했습니다.")
            } else {
                rating = totalGrade/Double(student.studentArr.count-1)
                print("평점 : " + String(format:"%.2f", rating))
            }
        } else {
            Role().checkInput()
        }
    }
}
