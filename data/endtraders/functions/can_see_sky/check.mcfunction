scoreboard players set canSeeSky endtrader_math 1
summon text_display ~ ~ ~ {text_opacity:0,Tags:["end_trader","check_sky"],text:'{"text":"t"}',background:0}

execute as @e[type=text_display,nbt={Tags:["end_trader","check_sky"]}] at @s run function endtraders:can_see_sky/loop