class BootStrap {

    def init = { servletContext ->
        
        if(!VeggieUser.get(1)){
             
         
            new Produce(type:'Leek',
                subtype:'',
                description:'''An edible plant related to the onion and 
                                having a white, slender bulb and flat, dark-green 
                                leaves''').save()
        
            new Produce(type:'Potato', 
                subtype:'King Edward',
                description:'''King Edward is very much a floury variety - 
                                scoring 6 on the waxy / floury scale, which is 
                                one of the highest scores. This makes King Edward 
                                a great variety for smooth creamy mash and light 
                                fluffy roast potatoes and even chips. ''').save()
        
            new VeggieUser(fullName: 'Arnold Rimmer',
                userName: 'IronBalls',
                email: 'arnie@jmc.com',
                password: '1234',
                aboutMe:'',
                website:'',
                postcode:'').save()
        
        
        
            new VeggieUser(fullName: 'Dave Lister',
                userName: 'SmegHead',
                email: 'lister@jmc.com',
                password: '5678',
                aboutMe:'Guitar & curry enthusiast',
                website:'www.curryandguitar.com',
                postcode:'LL18 3SG').save()
        
       
        
        
            new Crop(produce:Produce.findBySubtype('King Edward'),
                grower:VeggieUser.findByUserName('IronBalls'),
                plantDate: new Date('4/19/2009'),
                estHarvestDate: new Date('9/25/2009'),
                actHarvestDate: new Date('9/30/2009'),
                estYield:'5kg',
                actYield: '3.5kg').save()
            
            new Crop(produce:Produce.findByType('Leek'),
                grower:VeggieUser.findByUserName('SmegHead'),
                plantDate: new Date('4/19/2009'),
                estHarvestDate: new Date('9/25/2009')).save()
            
        
            def veggieUser1 = VeggieUser.findByUserName('IronBalls')
            veggieUser1.addToFriends(VeggieUser.findByUserName('SmegHead'))
            veggieUser1.save()
        }
    }
    def destroy = {
    }
}
