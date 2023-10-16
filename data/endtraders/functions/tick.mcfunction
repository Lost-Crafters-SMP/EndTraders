
execute at @a[nbt={Dimension:"minecraft:the_end"},limit=1] positioned 0 ~ 0 at @a[distance=950..] as @e[type=minecraft:enderman,tag=!endtraider_counted,distance=..60] at @s run function endtraders:spawn

# Update head item
execute as @e[type=minecraft:villager,nbt={Tags:["trader","end_trader"]}] unless entity @s[nbt={ArmorItems:[{},{},{},{id:"minecraft:chorus_flower",Count:1b,tag:{CustomModelData:1}}]}] unless entity @s[nbt={ActiveEffects:[{Id:14}]}] run item replace entity @s armor.head with minecraft:chorus_flower{CustomModelData:1b,deleteOnDrop:1b}
# Update hand item
execute as @e[type=minecraft:villager,nbt={Tags:["trader","end_trader"]}] unless entity @s[nbt={HandItems:[{id:"minecraft:chorus_fruit",Count:1b,tag:{CustomModelData:2}},{}]}] unless entity @s[nbt={ActiveEffects:[{Id:14}]}] unless data entity @s HandItems[0].tag.isFromTrades run item replace entity @s weapon.mainhand with minecraft:chorus_fruit{CustomModelData:2b,deleteOnDrop:1b}

# Update trade item (will use trade item before rendering any other item)
execute as @e[type=minecraft:villager,nbt={Tags:["trader","end_trader"]}] at @s unless data entity @s HandItems[0].tag.isFromTrades if data entity @a[sort=nearest,limit=1,distance=0..6] SelectedItem run data modify entity @s Offers.Recipes[0].buy set from entity @a[sort=nearest,limit=1,distance=0..6] SelectedItem

# Force no profession
execute as @e[type=minecraft:villager,nbt={Tags:["trader","end_trader"]}] unless entity @s[nbt={VillagerData:{profession:"minecraft:none"}}] run data merge entity @s {VillagerData:{profession:"minecraft:none"},Offers:{Recipes:[{rewardExp:0b,maxUses:1,uses:0,xp:0,priceMultiplier:0f,specialPrice:0,demand:0,buy:{id:"minecraft:netherite_sword",Count:1b},sell:{id:"minecraft:chorus_fruit",Count:1b,tag:{CustomModelData:2,deleteOnDrop:1b,isFromTrades:1b}}}]}}

# Hide items if invisible
execute as @e[type=minecraft:villager,nbt={Tags:["trader","end_trader"]}] if entity @s[nbt={ActiveEffects:[{Id:14}]}] run item replace entity @s armor.head with air
execute as @e[type=minecraft:villager,nbt={Tags:["trader","end_trader"]}] if entity @s[nbt={ActiveEffects:[{Id:14}]}] run item replace entity @s weapon.mainhand with minecraft:air

# Remove drop items that aren't accessible by players
execute as @e[type=minecraft:item,nbt={Item:{tag:{deleteOnDrop:1b}}}] run kill @s

# Check for trades
execute as @e[type=minecraft:villager,nbt={Tags:["trader","end_trader"]}] at @s unless entity @s[nbt={ActiveEffects:[{Id:26}]}] run function endtraders:trades

schedule function endtraders:tick 1t
