
import Foundation
import Alamofire
import Gloss

//struct ApiGithubComJson
//{
//    let id: Int
//    let name: String
//    let owner:ApiGithubComJsonOwner
//}
//
//struct ApiGithubComJsonOwner
//{
//    let login: String
//    let id: Int
//    let site_admin: Bool
//    
//    
//}

struct ApiGithubComJsonGloss: Decodable
{
    let id: Int?
    let name: String?
    let owner: ApiGithubComJsonOwnerGloss?
    
    init?(json: JSON)
    {
        self.id = "id" <~~ json
        self.name = "name" <~~ json
        self.owner = "owner" <~~ json
    }
}

struct ApiGithubComJsonOwnerGloss: Decodable
{
    let login: String?
    let id: Int?
    let site_admin: String?
    
    
    init?(json: JSON)
    {
        self.login = "login" <~~ json
        self.id = "id" <~~ json
        self.site_admin = "site_admin" <~~ json
    }
}


//extension ApiGithubComJson
//{
//    init?(dictionaryInput:[String:Any])
//    {
//        guard let id = dictionaryInput["id"] as? Int,
//        let name = dictionaryInput["name"] as? String
//        else
//        {
//            return nil
//        }
//        
//        guard let dictionaryOwner = dictionaryInput["owner"] as? [String:Any],
//            let login = dictionaryOwner["login"] as? String,
//            let owner_id = dictionaryOwner["id"] as? Int,
//            let site_admin = dictionaryOwner["site_admin"] as? Bool
//            else { return nil   }
//        
//        
//        self.id = id
//        self.name = name
//        self.owner = ApiGithubComJsonOwner(login: login, id: owner_id, site_admin: site_admin)
//    }
//}

//extension ApiGithubComJson
extension ApiGithubComJsonGloss
{
    static func fetch(completion:@escaping ([ApiGithubComJsonGloss]) -> Void) // 加static時，會把fetch函式先放到記憶體
    {
        request("https://api.github.com/users/octocat/repos").responseJSON { response in
            
            
            guard let dataTransfer = [ApiGithubComJsonGloss].from(jsonArray:response.result.value as! [JSON])
                else { return }
            
            
//            var dataTransfer:[ApiGithubComJsonGloss] = []
//            guard let result_value = response.result.value,
//                let array = result_value as? [Any]
//                else {  return  }
//            
//            for JSON_OBJECT in array
//            {
//                guard let dictionary = JSON_OBJECT as? [String:Any]
//                    else {  return  }
//                
////                guard let apiGithubComJson = ApiGithubComJson(dictionaryInput: dictionary)
////                    else {  return  }
//                
//                
//                guard let jsonParsingGloss = ApiGithubComJsonGloss(json:dictionary) else { return }
//                
//                dataTransfer.append(jsonParsingGloss)
//                
//                print(apiGithubComJson)
//                dataTransfer.append(apiGithubComJson)
//                print("fetch()完成")
                
//            }
            completion(dataTransfer)
        }
    }
}
