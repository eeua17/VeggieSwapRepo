class VeggieUser {
    
    String fullName
    String userName
    String email
    String password
    String aboutMe
    String website
    String postcode
    byte[] pic
    
    static hasMany = [  crops:Crop,
                        friends:VeggieUser]
   
    
    String toString(){
        "$userName"
    }
    static constraints = {
                
        fullName(nullable:false, blank:false)
        userName(nullable:false, blank:false, unique:true)
        email(nullable:false, blank:false, unique:true, email:true)
        password(nullable:false, blank:false)
        aboutMe(nullable:true, blank:true, maxSize:5000)
        website(nullable:true, blank:true)
        postcode(nullable:true, blank:true)
        pic(nullable:true, maxSize:1000000)
    }
}
