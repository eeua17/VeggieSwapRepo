class Crop {

    Produce produce
    VeggieUser grower   
    
    Date plantDate
    Date estHarvestDate
    Date actHarvestDate
    String estYield
    String actYield     
    
    String toString(){
        "${produce.toString()}"
    }
    
    static constraints = {
        produce(nullable:false)
        grower(nullable:false)
        plantDate(nullable:false, blank:false)
        estHarvestDate(nullable:false, blank:false)
        estYield(nullable:true, blank:true)
        actHarvestDate(nullable:true, blank:true)
        actYield(nullable:true, blank:true)
        comments(nullable:true)
        
    }
    
    static belongsTo = [VeggieUser,
                        Produce]
    static hasMany = [comments:CropComment]
}
