 
    local ZombieWeapons = { 2, 3, 4, 5, 6, 7, 8, 9, 15 }; -- Weapons IDs
   -- local ZombieSkin = {, ,  ,, , , , };
    local ZombieSkin = { [9] = true , [12] = true , [29] = true , [27] = true , [26] = true , [33] = true , [50] = true ,
    					 [52] = true , [53] = true , [54] = true , [55] = true , [56] = true , [57] = true, [58] = true , 
    					 [59] = true , [60] = true , [61] = true , [264] = true , [275] = true , [280] = true };                        
                        -- change ZombieSkin for yours zombies skin number

    function zombieW ( )
   
            local SkinZ = getElementModel( source );
                if ( ZombieSkin[ SkinZ ] ) then
            giveWeapon( source, ZombieWeapons[ math.random ( #ZombieWeapons ) ], 1 , true )
                
        end
    end
    
    addEvent("onZombieSpawned",true,zombieW )
    addEventHandler("onZombieSpawned",root,zombieW )