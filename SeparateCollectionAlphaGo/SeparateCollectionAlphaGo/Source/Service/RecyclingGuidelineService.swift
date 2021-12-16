//
//  RecyclingGuidelineService.swift
//  SeparateCollectionAlphaGo
//
//  Created by 이숭인 on 2021/12/16.
//

import UIKit
import Alamofire
import SwiftSoup

/*
 환경부 - 분리배출 (종이, 플라스틱, 패트병, 비닐)
 
 http://www.me.go.kr/home/web/board/read.do?pagerOffset=0&maxPageItems=10&maxIndexPages=10&searchKey=title&searchValue=%EB%B6%84%EB%A6%AC%EB%B0%B0%EC%B6%9C&menuId=10392&orgCd=&boardId=1377650&boardMasterId=713
 이미지 selector: #boardTableWrapper > div.view_con > p > img:nth-child(1)
 */

/*
 환경부 - 재활용품 분리배출 ( 위랑 비슷한데 좀 애매 하다)
 https://me.go.kr/home/web/board/read.do?pagerOffset=0&maxPageItems=10&maxIndexPages=10&searchKey=&searchValue=&menuId=10181&orgCd=&boardId=1398800&boardMasterId=54
 
 이미지 selector: #boardTableWrapper > div.view_con > p > img:nth-child(1)
 */


/*
 관악구청
 
 https://www.gwanak.go.kr/site/gwanak/07/10703010200002016051206.jsp
 
 분리배출대상 재활용품
 
 종류: #contents > div:nth-child(4) > div.table-wrap > table > tbody > tr:nth-child(1) [VAR]> th
 재활용 되는 품목: #contents > div:nth-child(4) > div.table-wrap > table > tbody > tr:nth-child(1) > td:nth-child(2) [FIX]
 비 해당 품목: #contents > div:nth-child(4) > div.table-wrap > table > tbody > tr:nth-child(2) > td:nth-child(2)
 배출 요령: #contents > div:nth-child(8) > div > table > tbody > tr:nth-child(5) [VAR] > td:nth-child(3) [FIX]

 재활용품 분리배출 요령
 
 종류: #contents > div:nth-child(8) > div > table > tbody > tr:nth-child(1) [VAR] > th
 해당 품목: #contents > div:nth-child(8) > div > table > tbody > tr:nth-child(1) [VAR]> td:nth-child(2) [FIX]
 배출 요령:#contents > div:nth-child(8) > div > table > tbody > tr:nth-child(2) [VAR]> td:nth-child(3) [FIX]
 
 */

class RecyclingGuidelineService {
    static let shared = RecyclingGuidelineService()
    
    private init() {}
    
    /* 재활용품 분리 배출 요령 텍스트 크롤링 */
    func requestSeparateDischargeTextGuidelines(completion: @escaping (SeparateDischargeTextResponse)->(Void)){
        let requestUrl = "https://www.gwanak.go.kr/site/gwanak/07/10703010200002016051206.jsp"
        var responses = SeparateDischargeTextResponse(typeOfRecycleable: [], separateDischargeTips: [])
        
        AF.request(requestUrl).responseString{ response in
            guard var html = response.value else {
                print("html is nil")
                return
            }

            if let data = response.data {
                let encodedHtml = NSString(data: data, encoding: CFStringConvertEncodingToNSStringEncoding( 0x0422 ) )
                if let encodedHtml = encodedHtml {
                    html = encodedHtml as String
                }
            }
            
            do {
                let doc: Document = try SwiftSoup.parse(html)
                
                let elements: Elements = try doc.select("#contents > div:nth-child(4) > div.table-wrap > table > tbody > tr")
                let secondElements: Elements = try doc.select("#contents > div:nth-child(8) > div > table > tbody > tr")
                
                /* 재활용품 대상 */
                for element in elements{
                    let typeOfRecycle = TypeOfRecyclable(classification: try element.select("th").text(), // 분류
                                                         applicableItems: try element.select("td")[0].text(), // 해당품목
                                                         nonApplicableItems: try element.select("td")[2].text()) // 비 해당 품목
                    
                    responses.typeOfRecycleable.append(typeOfRecycle)
                }
                
                /* 분리 배출 요령 */
                for element in secondElements{
                    let tip = SeparateDischargeTip(classification: try element.select("th").text(), // 분류
                                                   applicableItems: try element.select("td")[0].text(), // 해당 품목
                                                   dischargeGuidelines: try element.select("td")[1].text()) // 배출요령
                  
                    responses.separateDischargeTips.append(tip)
                }
                
                //TODO: viewModel 로 return 해서 쓰면 될듯!
                completion(responses)
            } catch {
                print("crawl error")
            } // catch
        } //AF
    }
    
    
    /* 재활용품 분리배출 이미지 크롤링 */
    func requestRecyclingSeparateDischargeGuidelines(completion: @escaping ([String])->(Void)){
        let baseUrl = "https://www.me.go.kr"
        let requestUrl = "https://me.go.kr/home/web/board/read.do?pagerOffset=0&maxPageItems=10&maxIndexPages=10&searchKey=&searchValue=&menuId=10181&orgCd=&boardId=1398800&boardMasterId=54&boardCategoryId=&decorator="
        
        var imageUrls = [String]()
        
        AF.request(requestUrl).responseString{ response in
            guard var html = response.value else {
                print("html is nil")
                return
            }

            if let data = response.data {
                let encodedHtml = NSString(data: data, encoding: CFStringConvertEncodingToNSStringEncoding( 0x0422 ) )
                if let encodedHtml = encodedHtml {
                    html = encodedHtml as String
                }
            }
            
            do {
                let doc: Document = try SwiftSoup.parse(html)
                
                let elements: Elements = try doc.select("#boardTableWrapper > div.view_con > p > img")

                for element in elements{
                    let source = try element.attr("src").description
                    //TODO: image url 저장하장
                    imageUrls.append(baseUrl + source)
                }
                completion(imageUrls)
            } catch {
                print("crawl error")
            } // catch
        } //AF
    }// requestGuidelines
    
    
    /* 분리배출 요령 이미지 크롤링 */
    func requestSeparateDischargeGuidelines(completion: @escaping ([String])->(Void)){
        let baseUrl = "https://www.me.go.kr"
        let requestUrl = "http://www.me.go.kr/home/web/board/read.do?pagerOffset=0&maxPageItems=10&maxIndexPages=10&searchKey=title&searchValue=%EB%B6%84%EB%A6%AC%EB%B0%B0%EC%B6%9C&menuId=10392&orgCd=&boardId=1377650&boardMasterId=713"
        
        var imageUrls = [String]()
        
        AF.request(requestUrl).responseString{ response in
            guard var html = response.value else {
                print("html is nil")
                return
            }

            if let data = response.data {
                let encodedHtml = NSString(data: data, encoding: CFStringConvertEncodingToNSStringEncoding( 0x0422 ) )
                if let encodedHtml = encodedHtml {
                    html = encodedHtml as String
                }
            }
            
            do {
                let doc: Document = try SwiftSoup.parse(html)
                
                let elements: Elements = try doc.select("#boardTableWrapper > div.view_con > p > img")

                for element in elements{
                    let source = try element.attr("src").description
                    //TODO: image url 저장하장
                    imageUrls.append(baseUrl + source)
                }
                completion(imageUrls)
            } catch {
                print("crawl error")
            } // catch
        } //AF
    }
}
