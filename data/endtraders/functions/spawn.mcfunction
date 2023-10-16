scoreboard players add spawn endtrader_math 1
execute if score spawn endtrader_math matches 200.. run summon villager ~ ~ ~ {CanPickUpLoot:0b,Willing:0b,Tags:["end_trader","trader"],ForcedAge:-1,VillagerData:{level:99,profession:"minecraft:none",type:"minecraft:plains"},Offers:{Recipes:[{rewardExp:0b,maxUses:1,uses:0,xp:0,priceMultiplier:0f,specialPrice:0,demand:0,buy:{id:"minecraft:netherite_sword",Count:1b},sell:{id:"minecraft:chorus_fruit",Count:1b,tag:{CustomModelData:2,deleteOnDrop:1b,isFromTrades:1b}}}]}}
execute if score spawn endtrader_math matches 200.. run playsound minecraft:entity.wandering_trader.reappeared neutral @a[distance=0..70] ~ ~ ~ 20 1 1
execute if score spawn endtrader_math matches 200.. run tp @s ~ -64 ~
execute if score spawn endtrader_math matches 200.. run scoreboard players set spawn endtrader_math 0
tag @s add endtraider_counted