
import Foundation
import Alamofire

struct ApiGithubComJson
{
    let id: Int
    let name: String
    let owner:(
    login:String,
    id:Int,
    site_admin:Bool
    )
    
}

extension ApiGithubComJson
{
    init?(dictionaryInput:[String:Any])
    {
        guard let id = dictionaryInput["id"] as? Int,
        let name = dictionaryInput["name"] as? String
        else
        {
            return nil
        }
        guard let dictionaryOwner = dictionaryInput["owner"] as? [String:Any],
            let login = dictionaryOwner["login"] as? String,
            let owner_id = dictionaryOwner["id"] as? Int,
            let site_admin = dictionaryOwner["site_admin"] as? Bool
            else { return nil   }
        
        
        self.id = id
        self.name = name
        self.owner = (login, owner_id, site_admin)
    }
}

extension ApiGithubComJson
{
    static func fetch(completion:@escaping ([ApiGithubComJson]) -> Void) // 加static時，會把fetch函式先放到記憶體
    {
        request("https://api.github.com/users/octocat/repos").responseJSON { response in
            var dataTransfer:[ApiGithubComJson] = []
            
            guard let result_value = response.result.value,
                let array = result_value as? [Any]
                else {  return  }
            
            for JSON_OBJECT in array
            {
                guard let dictionary = JSON_OBJECT as? [String:Any]
                    else {  return  }
                
                guard let apiGithubComJson = ApiGithubComJson(dictionaryInput: dictionary)
                    else {  return  }
                
                print(apiGithubComJson)
                dataTransfer.append(apiGithubComJson)
                print("fetch()完成")
                
            }
            completion(dataTransfer)
        }
    }
}
