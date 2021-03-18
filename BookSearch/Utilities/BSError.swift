//
//  BSError.swift
//  BookSearch
//
//  Created by 이현호 on 2021/03/18.
//

import Foundation

enum BSError: String, Error {
    case invalidBookname = "이 책이름은 잘못되었습니다. 다시 요청해주세요."
    case unableToComplete = "요청을 완료할 수 없습니다. 네트워크 연결을 확인해주세요."
    case invalidResponse = "유효하지 않은 서버로 부터의 응답입니다. 다시 요청해주세요."
    case invalidData = "서버로 받은 데이터가 유효하지 않습니다. 다시 요청해주세요."
}
