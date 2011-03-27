
class Produce {

    String type
    String subtype
    String description
    byte[] thumb
    static hasMany = [crops:Crop]
    
    static constraints = {
        type(inList:['Leek', 'Onion', 'Cucumber', 'Avocado', 'Aubegine', 'Pepper', 
                    'Tomato', 'Broccoli', 'Cauliflower', 'Sprout','Cabbage','Cress',
                    'Lettuce','Spinach','Beetroot', 'Carrot', 'Parsnip', 'Radish', 
                    'Turnip', 'Asparagus', 'Celery', 'Potato', 'Sweet Potato', 'Mushroom'], 
                    blank:false, nullable:false)
        subtype(nullable:true, blank:true)
        description(maxSize:5000)
        thumb(nullable:true, maxSize:1000000)
    }
}
