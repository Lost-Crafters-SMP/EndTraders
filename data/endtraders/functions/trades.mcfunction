
execute if entity @s[tag=is_trading] run loot spawn ~ ~ ~ loot endtraders:gameplay/end_trader_bartering
execute if entity @s[tag=is_trading] run playsound minecraft:entity.villager.yes neutral @a ~ ~ ~ 2 0.8 0
tag @s[tag=is_trading] remove is_trading

execute if entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:popped_chorus_fruit"}},distance=0..1,sort=nearest,limit=1] run tag @s add trading
execute if entity @s[tag=trading] as @e[type=minecraft:item,nbt={Item:{id:"minecraft:popped_chorus_fruit"}},distance=0..1,sort=nearest,limit=1] run tag @s add reduce_count
execute if entity @s[tag=trading] as @e[type=minecraft:item,tag=reduce_count] store result score count endtrader_math run data get entity @s Item.Count
execute if entity @s[tag=trading] run scoreboard players remove count endtrader_math 1
execute if entity @s[tag=trading] at @e[type=minecraft:item,tag=reduce_count] run particle minecraft:portal ~ ~ ~ 0 0 0 0.2 30
# execute if entity @s[tag=trading] at @e[type=minecraft:item,tag=reduce_count] run playsound minecraft:entity.enderman.teleport neutral @a ~ ~ ~ 2 1.05 0
execute if entity @s[tag=trading] at @e[type=minecraft:item,tag=reduce_count] run playsound minecraft:entity.item.pickup neutral @a ~ ~ ~ 2 0.95 0
execute if entity @s[tag=trading] as @e[type=minecraft:item,tag=reduce_count] store result entity @s Item.Count byte 1 run scoreboard players get count endtrader_math
tag @e[tag=reduce_count] remove reduce_count

effect give @s[tag=trading] minecraft:luck 5 1 true
effect give @s[tag=trading] minecraft:slowness 5 30 true
tag @s[tag=trading] add is_trading
tag @s remove trading


execute unless entity @s[tag=is_trading] if entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:chorus_flower"}},distance=0..1,sort=nearest,limit=1] run tag @s add trading_death
execute unless entity @s[tag=is_trading] if entity @s[tag=trading_death] as @e[type=minecraft:item,nbt={Item:{id:"minecraft:chorus_flower"}},distance=0..1,sort=nearest,limit=1] run tag @s add reduce_count
execute unless entity @s[tag=is_trading] if entity @s[tag=trading_death] as @e[type=minecraft:item,tag=reduce_count] store result score count endtrader_math run data get entity @s Item.Count
execute unless entity @s[tag=is_trading] if entity @s[tag=trading_death] run scoreboard players remove count endtrader_math 1
execute unless entity @s[tag=is_trading] if entity @s[tag=trading_death] at @e[type=minecraft:item,tag=reduce_count] run particle minecraft:portal ~ ~ ~ 0 0 0 0.2 30
execute unless entity @s[tag=is_trading] if entity @s[tag=trading_death] as @e[type=minecraft:item,tag=reduce_count] store result entity @s Item.Count byte 1 run scoreboard players get count endtrader_math
tag @e[tag=reduce_count] remove reduce_count

execute unless entity @s[tag=is_trading] if entity @s[tag=trading_death] run playsound minecraft:entity.zombie_villager.cure neutral @a ~ ~ ~ 2 0.95 0
execute unless entity @s[tag=is_trading] if entity @s[tag=trading_death] run loot spawn ~ ~ ~ loot endtraders:gameplay/end_trader_death
execute unless entity @s[tag=is_trading] if entity @s[tag=trading_death] run damage @s 20 minecraft:magic by @a[distance=0..10,sort=nearest,limit=1]
