def yellowPager(text)
    dictionary={
        a:'2',
        b:'2',
        c:'2', 
        d:'3',
        e:'3',
        f:'3',
        g:'4', 
        h:'4',
        i:'4', 
        j:'5', 
        k:'5',
        l:'5', 
        m:'6', 
        n:'6',
        o:'6', 
        p:'7',
        q:'7',
        r:'7', 
        s:'7',
        t:'8',
        u:'8', 
        v:'8',
        w:'9', 
        x:'9',
        y:'9',
        z:'9'
    }
    #Turn string into an array of character 
    
    characters =text.split(',')
    number = ''
     #loops through characters 
     characters.each  do |c|  
     number+= dictionary [:"#{c}"]
    #end loop
    puts number
end

yellowPager ('') 

#ruby yellowPager (to run in command)
