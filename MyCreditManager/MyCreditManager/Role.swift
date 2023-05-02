//
//  Role.swift
//  MyCreditManager
//
//  Created by 김하은 on 2023/05/02.
//

import Foundation

class Role {
    var student = Student()
    var grade = Grade()
    
    func division(opt: Int) {
        if opt == 1 {
            student.addStudent()
        } else if opt == 2 {
            student.deleteStudent()
        } else if opt == 3 {
            grade.addGrade()
        } else if opt == 4 {
            grade.deleteGrade()
        } else {
            grade.studentAverageGrade()
        }
        
    }
    
    func checkInput() {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
    }
}
