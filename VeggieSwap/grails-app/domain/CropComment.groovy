class CropComment {
    String content
    CropComment parent
    Crop crop
    VeggieUser author

    static constraints = {
        content(blank:false, maxSize:2000)
        parent(nullable:true)
        author(nullable:false)
    }
    
    static belongsTo = Crop
}
