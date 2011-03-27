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
            
            
            new Produce(type:'Tomato', 
                subtype:'Cherry',
                description:'''They're delicious!''').save()
            
        
            new VeggieUser(fullName: 'Arnold Rimmer',
                userName: 'Arnie',
                email: 'arnie@jmc.com',
                password: 'arniepass',
                aboutMe:'',
                website:'',
                postcode:'').save()
        
        
        
            new VeggieUser(fullName: 'Dave Lister',
                userName: 'Listerman',
                email: 'lister@jmc.com',
                password: 'listerpass',
                aboutMe:'Guitar & curry enthusiast',
                website:'www.curryandguitar.com',
                postcode:'LL18 3SG').save()
        
       
            new VeggieUser(fullName: 'Kryten',
                userName: 'Kryten',
                email: 'kryters@jmc.com',
                password: 'krytenpass',
                aboutMe:'Housekeeping droid',
                website:'www.squidgymopsexposed.com',
                postcode:'LL17 0BX').save()
            
            
            new VeggieUser(fullName: 'The Cat',
                userName: 'Cat',
                email: 'cat@jmc.com',
                password: 'catpass',
                aboutMe:'Clothes and snoozing',
                website:'',
                postcode:'CH1 1LQ').save()
        
        
            new Crop(produce:Produce.findBySubtype('King Edward'),
                grower:VeggieUser.findByUserName('Arnie'),
                plantDate: new Date('4/19/2009'),
                estHarvestDate: new Date('9/25/2009'),
                actHarvestDate: new Date('9/30/2009'),
                estYield:'5kg',
                actYield: '3.5kg').save()
            
            new Crop(produce:Produce.findByType('Leek'),
                grower:VeggieUser.findByUserName('Lister'),
                plantDate: new Date('4/19/2009'),
                estHarvestDate: new Date('9/25/2009')).save()
            
            new Crop(produce:Produce.findBySubtype('Cherry'),
                grower:VeggieUser.findByUserName('Cat'),
                plantDate: new Date('2/15/2009'),
                estHarvestDate: new Date('6/18/2009')).save()
            
            
            new Crop(produce:Produce.findBySubtype('King Edward'),
                grower:VeggieUser.findByUserName('Cat'),
                plantDate: new Date('12/01/2008'),
                estHarvestDate: new Date('3/10/2009')).save()
            
        
            def veggieUser1 = VeggieUser.findByUserName('Arnie')
            veggieUser1.addToFriends(VeggieUser.findByUserName('Listerman'))
            veggieUser1.save()
            
            def veggieUser2 = VeggieUser.findByUserName('Cat')
            veggieUser2.addToFriends(VeggieUser.findByUserName('Listerman'))
            veggieUser2.addToFriends(VeggieUser.findByUserName('Kryten'))
            veggieUser2.addToFriends(VeggieUser.findByUserName('Arnie'))
            veggieUser2.save()
        }
    }
    def destroy = {
    }
}
